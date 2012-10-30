#define rand	pan_rand
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* CLAIM f */
	case 3: /* STATE 1 - _spin_nvr.tmp:4 - [(!((len(place_Deliver)==5)))] (0:0:0 - 1) */
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][1] = 1;
		if (!( !((q_len(now.place_Deliver)==5))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: /* STATE 5 - _spin_nvr.tmp:6 - [-end-] (0:0:0 - 1) */
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported5 = 0;
			if (verbose && !reported5)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported5 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported5 = 0;
			if (verbose && !reported5)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported5 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][5] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC :init: */
	case 5: /* STATE 1 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:472 - [AckBuf.AckBuf_field1 = 1] (0:0:1 - 1) */
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->AckBuf.AckBuf_field1;
		((P1 *)this)->AckBuf.AckBuf_field1 = 1;
#ifdef VAR_RANGES
		logval(":init::AckBuf.AckBuf_field1", ((P1 *)this)->AckBuf.AckBuf_field1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 6: /* STATE 2 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:473 - [place_AckBuf!AckBuf.AckBuf_field1] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][2] = 1;
		if (q_full(now.place_AckBuf))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_AckBuf);
		sprintf(simtmp, "%d", ((P1 *)this)->AckBuf.AckBuf_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_AckBuf, 0, ((P1 *)this)->AckBuf.AckBuf_field1, 0, 1);
		_m = 2; goto P999; /* 0 */
	case 7: /* STATE 3 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:475 - [] (0:5:1 - 1) */
		IfNotBlocked
		reached[1][3] = 1;
		;
		/* merge: Accept.Accept_field1 = 1(5, 4, 5) */
		reached[1][4] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->Accept.Accept_field1;
		((P1 *)this)->Accept.Accept_field1 = 1;
#ifdef VAR_RANGES
		logval(":init::Accept.Accept_field1", ((P1 *)this)->Accept.Accept_field1);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 8: /* STATE 5 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:476 - [place_Accept!Accept.Accept_field1] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][5] = 1;
		if (q_full(now.place_Accept))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_Accept);
		sprintf(simtmp, "%d", ((P1 *)this)->Accept.Accept_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_Accept, 0, ((P1 *)this)->Accept.Accept_field1, 0, 1);
		_m = 2; goto P999; /* 0 */
	case 9: /* STATE 6 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:477 - [Accept.Accept_field1 = 2] (0:0:1 - 1) */
		IfNotBlocked
		reached[1][6] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->Accept.Accept_field1;
		((P1 *)this)->Accept.Accept_field1 = 2;
#ifdef VAR_RANGES
		logval(":init::Accept.Accept_field1", ((P1 *)this)->Accept.Accept_field1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: /* STATE 7 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:478 - [place_Accept!Accept.Accept_field1] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][7] = 1;
		if (q_full(now.place_Accept))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_Accept);
		sprintf(simtmp, "%d", ((P1 *)this)->Accept.Accept_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_Accept, 0, ((P1 *)this)->Accept.Accept_field1, 0, 1);
		_m = 2; goto P999; /* 0 */
	case 11: /* STATE 8 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:479 - [Accept.Accept_field1 = 3] (0:0:1 - 1) */
		IfNotBlocked
		reached[1][8] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->Accept.Accept_field1;
		((P1 *)this)->Accept.Accept_field1 = 3;
#ifdef VAR_RANGES
		logval(":init::Accept.Accept_field1", ((P1 *)this)->Accept.Accept_field1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: /* STATE 9 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:480 - [place_Accept!Accept.Accept_field1] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][9] = 1;
		if (q_full(now.place_Accept))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_Accept);
		sprintf(simtmp, "%d", ((P1 *)this)->Accept.Accept_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_Accept, 0, ((P1 *)this)->Accept.Accept_field1, 0, 1);
		_m = 2; goto P999; /* 0 */
	case 13: /* STATE 10 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:481 - [Accept.Accept_field1 = 4] (0:0:1 - 1) */
		IfNotBlocked
		reached[1][10] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->Accept.Accept_field1;
		((P1 *)this)->Accept.Accept_field1 = 4;
#ifdef VAR_RANGES
		logval(":init::Accept.Accept_field1", ((P1 *)this)->Accept.Accept_field1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: /* STATE 11 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:482 - [place_Accept!Accept.Accept_field1] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][11] = 1;
		if (q_full(now.place_Accept))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_Accept);
		sprintf(simtmp, "%d", ((P1 *)this)->Accept.Accept_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_Accept, 0, ((P1 *)this)->Accept.Accept_field1, 0, 1);
		_m = 2; goto P999; /* 0 */
	case 15: /* STATE 12 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:483 - [Accept.Accept_field1 = 5] (0:0:1 - 1) */
		IfNotBlocked
		reached[1][12] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->Accept.Accept_field1;
		((P1 *)this)->Accept.Accept_field1 = 5;
#ifdef VAR_RANGES
		logval(":init::Accept.Accept_field1", ((P1 *)this)->Accept.Accept_field1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: /* STATE 13 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:484 - [place_Accept!Accept.Accept_field1] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][13] = 1;
		if (q_full(now.place_Accept))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_Accept);
		sprintf(simtmp, "%d", ((P1 *)this)->Accept.Accept_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_Accept, 0, ((P1 *)this)->Accept.Accept_field1, 0, 1);
		_m = 2; goto P999; /* 0 */
	case 17: /* STATE 14 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:486 - [] (0:17:2 - 1) */
		IfNotBlocked
		reached[1][14] = 1;
		;
		/* merge: DataBuf.DataBuf_field1 = 1(17, 15, 17) */
		reached[1][15] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->DataBuf.DataBuf_field1;
		((P1 *)this)->DataBuf.DataBuf_field1 = 1;
#ifdef VAR_RANGES
		logval(":init::DataBuf.DataBuf_field1", ((P1 *)this)->DataBuf.DataBuf_field1);
#endif
		;
		/* merge: DataBuf.DataBuf_field2 = 999(17, 16, 17) */
		reached[1][16] = 1;
		(trpt+1)->bup.ovals[1] = ((P1 *)this)->DataBuf.DataBuf_field2;
		((P1 *)this)->DataBuf.DataBuf_field2 = 999;
#ifdef VAR_RANGES
		logval(":init::DataBuf.DataBuf_field2", ((P1 *)this)->DataBuf.DataBuf_field2);
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 18: /* STATE 17 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:488 - [place_DataBuf!DataBuf.DataBuf_field1,DataBuf.DataBuf_field2] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][17] = 1;
		if (q_full(now.place_DataBuf))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_DataBuf);
		sprintf(simtmp, "%d", ((P1 *)this)->DataBuf.DataBuf_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)this)->DataBuf.DataBuf_field2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_DataBuf, 0, ((P1 *)this)->DataBuf.DataBuf_field1, ((P1 *)this)->DataBuf.DataBuf_field2, 2);
		_m = 2; goto P999; /* 0 */
	case 19: /* STATE 18 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:490 - [] (0:21:1 - 1) */
		IfNotBlocked
		reached[1][18] = 1;
		;
		/* merge: (21, 19, 21) */
		reached[1][19] = 1;
		;
		/* merge: AckIn.AckIn_field1 = 1(21, 20, 21) */
		reached[1][20] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->AckIn.AckIn_field1;
		((P1 *)this)->AckIn.AckIn_field1 = 1;
#ifdef VAR_RANGES
		logval(":init::AckIn.AckIn_field1", ((P1 *)this)->AckIn.AckIn_field1);
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 20: /* STATE 21 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:492 - [place_AckIn!AckIn.AckIn_field1] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][21] = 1;
		if (q_full(now.place_AckIn))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_AckIn);
		sprintf(simtmp, "%d", ((P1 *)this)->AckIn.AckIn_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_AckIn, 0, ((P1 *)this)->AckIn.AckIn_field1, 0, 1);
		_m = 2; goto P999; /* 0 */
	case 21: /* STATE 22 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:493 - [(run Main())] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][22] = 1;
		if (!(addproc(II, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 22: /* STATE 23 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:494 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][23] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Main */
	case 23: /* STATE 1 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:89 - [(place_CDataOut?[CDataOut.CDataOut_field1,CDataOut.CDataOut_field2])] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][1] = 1;
		if (!((q_len(now.place_CDataOut) > 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 24: /* STATE 2 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:91 - [place_CDataOut?CDataOut.CDataOut_field1,CDataOut.CDataOut_field2] (0:0:2 - 1) */
		reached[0][2] = 1;
		if (q_len(now.place_CDataOut) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->CDataOut.CDataOut_field1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->CDataOut.CDataOut_field2;
		;
		((P0 *)this)->CDataOut.CDataOut_field1 = qrecv(now.place_CDataOut, XX-1, 0, 0);
#ifdef VAR_RANGES
		logval("Main:CDataOut.CDataOut_field1", ((P0 *)this)->CDataOut.CDataOut_field1);
#endif
		;
		((P0 *)this)->CDataOut.CDataOut_field2 = qrecv(now.place_CDataOut, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("Main:CDataOut.CDataOut_field2", ((P0 *)this)->CDataOut.CDataOut_field2);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.place_CDataOut);
		sprintf(simtmp, "%d", ((P0 *)this)->CDataOut.CDataOut_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->CDataOut.CDataOut_field2); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 25: /* STATE 3 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:93 - [((1&&1))] (21:0:1 - 1) */
		IfNotBlocked
		reached[0][3] = 1;
		if (!((1&&1)))
			continue;
		/* merge: corrupted_is_enabled = 1(0, 5, 21) */
		reached[0][5] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->corrupted_is_enabled);
		((P0 *)this)->corrupted_is_enabled = 1;
#ifdef VAR_RANGES
		logval("Main:corrupted_is_enabled", ((int)((P0 *)this)->corrupted_is_enabled));
#endif
		;
		/* merge: .(goto)(0, 10, 21) */
		reached[0][10] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 26: /* STATE 7 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:95 - [place_CDataOut!CDataOut.CDataOut_field1,CDataOut.CDataOut_field2] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][7] = 1;
		if (q_full(now.place_CDataOut))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_CDataOut);
		sprintf(simtmp, "%d", ((P0 *)this)->CDataOut.CDataOut_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->CDataOut.CDataOut_field2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_CDataOut, 0, ((P0 *)this)->CDataOut.CDataOut_field1, ((P0 *)this)->CDataOut.CDataOut_field2, 2);
		_m = 2; goto P999; /* 0 */
	case 27: /* STATE 12 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:323 - [(corrupted_is_enabled)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][12] = 1;
		if (!(((int)((P0 *)this)->corrupted_is_enabled)))
			continue;
		/* dead 1: corrupted_is_enabled */  (trpt+1)->bup.oval = ((P0 *)this)->corrupted_is_enabled;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->corrupted_is_enabled = 0;
		_m = 3; goto P999; /* 0 */
	case 28: /* STATE 13 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:232 - [CDataIn.CDataIn_field1 = 3] (0:15:2 - 1) */
		IfNotBlocked
		reached[0][13] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->CDataIn.CDataIn_field1;
		((P0 *)this)->CDataIn.CDataIn_field1 = 3;
#ifdef VAR_RANGES
		logval("Main:CDataIn.CDataIn_field1", ((P0 *)this)->CDataIn.CDataIn_field1);
#endif
		;
		/* merge: CDataIn.CDataIn_field2 = 999(15, 14, 15) */
		reached[0][14] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->CDataIn.CDataIn_field2;
		((P0 *)this)->CDataIn.CDataIn_field2 = 999;
#ifdef VAR_RANGES
		logval("Main:CDataIn.CDataIn_field2", ((P0 *)this)->CDataIn.CDataIn_field2);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 29: /* STATE 15 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:234 - [place_CDataIn!CDataIn.CDataIn_field1,CDataIn.CDataIn_field2] (345:0:1 - 1) */
		IfNotBlocked
		reached[0][15] = 1;
		if (q_full(now.place_CDataIn))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_CDataIn);
		sprintf(simtmp, "%d", ((P0 *)this)->CDataIn.CDataIn_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->CDataIn.CDataIn_field2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_CDataIn, 0, ((P0 *)this)->CDataIn.CDataIn_field1, ((P0 *)this)->CDataIn.CDataIn_field2, 2);
		/* merge: corrupted_is_enabled = 0(345, 16, 345) */
		reached[0][16] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->corrupted_is_enabled);
		((P0 *)this)->corrupted_is_enabled = 0;
#ifdef VAR_RANGES
		logval("Main:corrupted_is_enabled", ((int)((P0 *)this)->corrupted_is_enabled));
#endif
		;
		/* merge: .(goto)(345, 22, 345) */
		reached[0][22] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 2; goto P999; /* 3 */
	case 30: /* STATE 22 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:326 - [.(goto)] (0:345:0 - 2) */
		IfNotBlocked
		reached[0][22] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 31: /* STATE 20 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:324 - [(1)] (345:0:0 - 1) */
		IfNotBlocked
		reached[0][20] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(345, 22, 345) */
		reached[0][22] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 32: /* STATE 25 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:99 - [(place_CDataOut?[CDataOut.CDataOut_field1,CDataOut.CDataOut_field2])] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][25] = 1;
		if (!((q_len(now.place_CDataOut) > 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 33: /* STATE 26 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:101 - [place_CDataOut?CDataOut.CDataOut_field1,CDataOut.CDataOut_field2] (0:0:2 - 1) */
		reached[0][26] = 1;
		if (q_len(now.place_CDataOut) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->CDataOut.CDataOut_field1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->CDataOut.CDataOut_field2;
		;
		((P0 *)this)->CDataOut.CDataOut_field1 = qrecv(now.place_CDataOut, XX-1, 0, 0);
#ifdef VAR_RANGES
		logval("Main:CDataOut.CDataOut_field1", ((P0 *)this)->CDataOut.CDataOut_field1);
#endif
		;
		((P0 *)this)->CDataOut.CDataOut_field2 = qrecv(now.place_CDataOut, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("Main:CDataOut.CDataOut_field2", ((P0 *)this)->CDataOut.CDataOut_field2);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.place_CDataOut);
		sprintf(simtmp, "%d", ((P0 *)this)->CDataOut.CDataOut_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->CDataOut.CDataOut_field2); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 34: /* STATE 27 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:103 - [((1&&1))] (45:0:1 - 1) */
		IfNotBlocked
		reached[0][27] = 1;
		if (!((1&&1)))
			continue;
		/* merge: transmitted_is_enabled = 1(0, 29, 45) */
		reached[0][29] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->transmitted_is_enabled);
		((P0 *)this)->transmitted_is_enabled = 1;
#ifdef VAR_RANGES
		logval("Main:transmitted_is_enabled", ((int)((P0 *)this)->transmitted_is_enabled));
#endif
		;
		/* merge: .(goto)(0, 34, 45) */
		reached[0][34] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 35: /* STATE 31 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:105 - [place_CDataOut!CDataOut.CDataOut_field1,CDataOut.CDataOut_field2] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][31] = 1;
		if (q_full(now.place_CDataOut))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_CDataOut);
		sprintf(simtmp, "%d", ((P0 *)this)->CDataOut.CDataOut_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->CDataOut.CDataOut_field2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_CDataOut, 0, ((P0 *)this)->CDataOut.CDataOut_field1, ((P0 *)this)->CDataOut.CDataOut_field2, 2);
		_m = 2; goto P999; /* 0 */
	case 36: /* STATE 36 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:330 - [(transmitted_is_enabled)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][36] = 1;
		if (!(((int)((P0 *)this)->transmitted_is_enabled)))
			continue;
		/* dead 1: transmitted_is_enabled */  (trpt+1)->bup.oval = ((P0 *)this)->transmitted_is_enabled;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->transmitted_is_enabled = 0;
		_m = 3; goto P999; /* 0 */
	case 37: /* STATE 37 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:238 - [CDataIn.CDataIn_field1 = CDataOut.CDataOut_field1] (0:39:2 - 1) */
		IfNotBlocked
		reached[0][37] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->CDataIn.CDataIn_field1;
		((P0 *)this)->CDataIn.CDataIn_field1 = ((P0 *)this)->CDataOut.CDataOut_field1;
#ifdef VAR_RANGES
		logval("Main:CDataIn.CDataIn_field1", ((P0 *)this)->CDataIn.CDataIn_field1);
#endif
		;
		/* merge: CDataIn.CDataIn_field2 = CDataOut.CDataOut_field2(39, 38, 39) */
		reached[0][38] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->CDataIn.CDataIn_field2;
		((P0 *)this)->CDataIn.CDataIn_field2 = ((P0 *)this)->CDataOut.CDataOut_field2;
#ifdef VAR_RANGES
		logval("Main:CDataIn.CDataIn_field2", ((P0 *)this)->CDataIn.CDataIn_field2);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 38: /* STATE 39 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:240 - [place_CDataIn!CDataIn.CDataIn_field1,CDataIn.CDataIn_field2] (345:0:1 - 1) */
		IfNotBlocked
		reached[0][39] = 1;
		if (q_full(now.place_CDataIn))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_CDataIn);
		sprintf(simtmp, "%d", ((P0 *)this)->CDataIn.CDataIn_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->CDataIn.CDataIn_field2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_CDataIn, 0, ((P0 *)this)->CDataIn.CDataIn_field1, ((P0 *)this)->CDataIn.CDataIn_field2, 2);
		/* merge: transmitted_is_enabled = 0(345, 40, 345) */
		reached[0][40] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->transmitted_is_enabled);
		((P0 *)this)->transmitted_is_enabled = 0;
#ifdef VAR_RANGES
		logval("Main:transmitted_is_enabled", ((int)((P0 *)this)->transmitted_is_enabled));
#endif
		;
		/* merge: .(goto)(345, 46, 345) */
		reached[0][46] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 2; goto P999; /* 3 */
	case 39: /* STATE 46 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:333 - [.(goto)] (0:345:0 - 2) */
		IfNotBlocked
		reached[0][46] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 40: /* STATE 44 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:331 - [(1)] (345:0:0 - 1) */
		IfNotBlocked
		reached[0][44] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(345, 46, 345) */
		reached[0][46] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 41: /* STATE 49 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:109 - [(place_CDataOut?[CDataOut.CDataOut_field1,CDataOut.CDataOut_field2])] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][49] = 1;
		if (!((q_len(now.place_CDataOut) > 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 42: /* STATE 50 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:111 - [place_CDataOut?CDataOut.CDataOut_field1,CDataOut.CDataOut_field2] (0:0:2 - 1) */
		reached[0][50] = 1;
		if (q_len(now.place_CDataOut) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->CDataOut.CDataOut_field1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->CDataOut.CDataOut_field2;
		;
		((P0 *)this)->CDataOut.CDataOut_field1 = qrecv(now.place_CDataOut, XX-1, 0, 0);
#ifdef VAR_RANGES
		logval("Main:CDataOut.CDataOut_field1", ((P0 *)this)->CDataOut.CDataOut_field1);
#endif
		;
		((P0 *)this)->CDataOut.CDataOut_field2 = qrecv(now.place_CDataOut, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("Main:CDataOut.CDataOut_field2", ((P0 *)this)->CDataOut.CDataOut_field2);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.place_CDataOut);
		sprintf(simtmp, "%d", ((P0 *)this)->CDataOut.CDataOut_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->CDataOut.CDataOut_field2); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 43: /* STATE 51 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:113 - [((1&&1))] (69:0:1 - 1) */
		IfNotBlocked
		reached[0][51] = 1;
		if (!((1&&1)))
			continue;
		/* merge: lost_is_enabled = 1(0, 53, 69) */
		reached[0][53] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->lost_is_enabled);
		((P0 *)this)->lost_is_enabled = 1;
#ifdef VAR_RANGES
		logval("Main:lost_is_enabled", ((int)((P0 *)this)->lost_is_enabled));
#endif
		;
		/* merge: .(goto)(0, 58, 69) */
		reached[0][58] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 44: /* STATE 55 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:115 - [place_CDataOut!CDataOut.CDataOut_field1,CDataOut.CDataOut_field2] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][55] = 1;
		if (q_full(now.place_CDataOut))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_CDataOut);
		sprintf(simtmp, "%d", ((P0 *)this)->CDataOut.CDataOut_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->CDataOut.CDataOut_field2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_CDataOut, 0, ((P0 *)this)->CDataOut.CDataOut_field1, ((P0 *)this)->CDataOut.CDataOut_field2, 2);
		_m = 2; goto P999; /* 0 */
	case 45: /* STATE 60 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:337 - [(lost_is_enabled)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][60] = 1;
		if (!(((int)((P0 *)this)->lost_is_enabled)))
			continue;
		/* dead 1: lost_is_enabled */  (trpt+1)->bup.oval = ((P0 *)this)->lost_is_enabled;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->lost_is_enabled = 0;
		_m = 3; goto P999; /* 0 */
	case 46: /* STATE 61 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:244 - [CDataIn.CDataIn_field1 = 4] (0:63:2 - 1) */
		IfNotBlocked
		reached[0][61] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->CDataIn.CDataIn_field1;
		((P0 *)this)->CDataIn.CDataIn_field1 = 4;
#ifdef VAR_RANGES
		logval("Main:CDataIn.CDataIn_field1", ((P0 *)this)->CDataIn.CDataIn_field1);
#endif
		;
		/* merge: CDataIn.CDataIn_field2 = 1000(63, 62, 63) */
		reached[0][62] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->CDataIn.CDataIn_field2;
		((P0 *)this)->CDataIn.CDataIn_field2 = 1000;
#ifdef VAR_RANGES
		logval("Main:CDataIn.CDataIn_field2", ((P0 *)this)->CDataIn.CDataIn_field2);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 47: /* STATE 63 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:246 - [place_CDataIn!CDataIn.CDataIn_field1,CDataIn.CDataIn_field2] (345:0:1 - 1) */
		IfNotBlocked
		reached[0][63] = 1;
		if (q_full(now.place_CDataIn))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_CDataIn);
		sprintf(simtmp, "%d", ((P0 *)this)->CDataIn.CDataIn_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->CDataIn.CDataIn_field2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_CDataIn, 0, ((P0 *)this)->CDataIn.CDataIn_field1, ((P0 *)this)->CDataIn.CDataIn_field2, 2);
		/* merge: lost_is_enabled = 0(345, 64, 345) */
		reached[0][64] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->lost_is_enabled);
		((P0 *)this)->lost_is_enabled = 0;
#ifdef VAR_RANGES
		logval("Main:lost_is_enabled", ((int)((P0 *)this)->lost_is_enabled));
#endif
		;
		/* merge: .(goto)(345, 70, 345) */
		reached[0][70] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 2; goto P999; /* 3 */
	case 48: /* STATE 70 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:340 - [.(goto)] (0:345:0 - 2) */
		IfNotBlocked
		reached[0][70] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 49: /* STATE 68 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:338 - [(1)] (345:0:0 - 1) */
		IfNotBlocked
		reached[0][68] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(345, 70, 345) */
		reached[0][70] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 50: /* STATE 73 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:119 - [(place_CAckOut?[CAckOut.CAckOut_field1])] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][73] = 1;
		if (!((q_len(now.place_CAckOut) > 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 51: /* STATE 74 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:121 - [place_CAckOut?CAckOut.CAckOut_field1] (0:0:1 - 1) */
		reached[0][74] = 1;
		if (q_len(now.place_CAckOut) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P0 *)this)->CAckOut.CAckOut_field1;
		;
		((P0 *)this)->CAckOut.CAckOut_field1 = qrecv(now.place_CAckOut, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("Main:CAckOut.CAckOut_field1", ((P0 *)this)->CAckOut.CAckOut_field1);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.place_CAckOut);
		sprintf(simtmp, "%d", ((P0 *)this)->CAckOut.CAckOut_field1); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 52: /* STATE 75 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:123 - [(1)] (91:0:1 - 1) */
		IfNotBlocked
		reached[0][75] = 1;
		if (!(1))
			continue;
		/* merge: corrupted_ack_is_enabled = 1(0, 76, 91) */
		reached[0][76] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->corrupted_ack_is_enabled);
		((P0 *)this)->corrupted_ack_is_enabled = 1;
#ifdef VAR_RANGES
		logval("Main:corrupted_ack_is_enabled", ((int)((P0 *)this)->corrupted_ack_is_enabled));
#endif
		;
		/* merge: .(goto)(0, 81, 91) */
		reached[0][81] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 53: /* STATE 78 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:124 - [place_CAckOut!CAckOut.CAckOut_field1] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][78] = 1;
		if (q_full(now.place_CAckOut))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_CAckOut);
		sprintf(simtmp, "%d", ((P0 *)this)->CAckOut.CAckOut_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_CAckOut, 0, ((P0 *)this)->CAckOut.CAckOut_field1, 0, 1);
		_m = 2; goto P999; /* 0 */
	case 54: /* STATE 83 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:344 - [(corrupted_ack_is_enabled)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][83] = 1;
		if (!(((int)((P0 *)this)->corrupted_ack_is_enabled)))
			continue;
		/* dead 1: corrupted_ack_is_enabled */  (trpt+1)->bup.oval = ((P0 *)this)->corrupted_ack_is_enabled;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->corrupted_ack_is_enabled = 0;
		_m = 3; goto P999; /* 0 */
	case 55: /* STATE 84 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:250 - [CAckIn.CAckIn_field1 = 3] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][84] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->CAckIn.CAckIn_field1;
		((P0 *)this)->CAckIn.CAckIn_field1 = 3;
#ifdef VAR_RANGES
		logval("Main:CAckIn.CAckIn_field1", ((P0 *)this)->CAckIn.CAckIn_field1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 56: /* STATE 85 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:251 - [place_CAckIn!CAckIn.CAckIn_field1] (345:0:1 - 1) */
		IfNotBlocked
		reached[0][85] = 1;
		if (q_full(now.place_CAckIn))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_CAckIn);
		sprintf(simtmp, "%d", ((P0 *)this)->CAckIn.CAckIn_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_CAckIn, 0, ((P0 *)this)->CAckIn.CAckIn_field1, 0, 1);
		/* merge: corrupted_ack_is_enabled = 0(345, 86, 345) */
		reached[0][86] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->corrupted_ack_is_enabled);
		((P0 *)this)->corrupted_ack_is_enabled = 0;
#ifdef VAR_RANGES
		logval("Main:corrupted_ack_is_enabled", ((int)((P0 *)this)->corrupted_ack_is_enabled));
#endif
		;
		/* merge: .(goto)(345, 92, 345) */
		reached[0][92] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 2; goto P999; /* 3 */
	case 57: /* STATE 92 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:347 - [.(goto)] (0:345:0 - 2) */
		IfNotBlocked
		reached[0][92] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 58: /* STATE 90 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:345 - [(1)] (345:0:0 - 1) */
		IfNotBlocked
		reached[0][90] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(345, 92, 345) */
		reached[0][92] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 59: /* STATE 95 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:128 - [(place_CAckOut?[CAckOut.CAckOut_field1])] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][95] = 1;
		if (!((q_len(now.place_CAckOut) > 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 60: /* STATE 96 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:130 - [place_CAckOut?CAckOut.CAckOut_field1] (0:0:1 - 1) */
		reached[0][96] = 1;
		if (q_len(now.place_CAckOut) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P0 *)this)->CAckOut.CAckOut_field1;
		;
		((P0 *)this)->CAckOut.CAckOut_field1 = qrecv(now.place_CAckOut, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("Main:CAckOut.CAckOut_field1", ((P0 *)this)->CAckOut.CAckOut_field1);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.place_CAckOut);
		sprintf(simtmp, "%d", ((P0 *)this)->CAckOut.CAckOut_field1); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 61: /* STATE 97 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:132 - [(1)] (113:0:1 - 1) */
		IfNotBlocked
		reached[0][97] = 1;
		if (!(1))
			continue;
		/* merge: transmitted_ack_is_enabled = 1(0, 98, 113) */
		reached[0][98] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->transmitted_ack_is_enabled);
		((P0 *)this)->transmitted_ack_is_enabled = 1;
#ifdef VAR_RANGES
		logval("Main:transmitted_ack_is_enabled", ((int)((P0 *)this)->transmitted_ack_is_enabled));
#endif
		;
		/* merge: .(goto)(0, 103, 113) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 62: /* STATE 100 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:133 - [place_CAckOut!CAckOut.CAckOut_field1] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][100] = 1;
		if (q_full(now.place_CAckOut))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_CAckOut);
		sprintf(simtmp, "%d", ((P0 *)this)->CAckOut.CAckOut_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_CAckOut, 0, ((P0 *)this)->CAckOut.CAckOut_field1, 0, 1);
		_m = 2; goto P999; /* 0 */
	case 63: /* STATE 105 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:351 - [(transmitted_ack_is_enabled)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][105] = 1;
		if (!(((int)((P0 *)this)->transmitted_ack_is_enabled)))
			continue;
		/* dead 1: transmitted_ack_is_enabled */  (trpt+1)->bup.oval = ((P0 *)this)->transmitted_ack_is_enabled;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->transmitted_ack_is_enabled = 0;
		_m = 3; goto P999; /* 0 */
	case 64: /* STATE 106 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:255 - [CAckIn.CAckIn_field1 = CAckOut.CAckOut_field1] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][106] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->CAckIn.CAckIn_field1;
		((P0 *)this)->CAckIn.CAckIn_field1 = ((P0 *)this)->CAckOut.CAckOut_field1;
#ifdef VAR_RANGES
		logval("Main:CAckIn.CAckIn_field1", ((P0 *)this)->CAckIn.CAckIn_field1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 65: /* STATE 107 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:256 - [place_CAckIn!CAckIn.CAckIn_field1] (345:0:1 - 1) */
		IfNotBlocked
		reached[0][107] = 1;
		if (q_full(now.place_CAckIn))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_CAckIn);
		sprintf(simtmp, "%d", ((P0 *)this)->CAckIn.CAckIn_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_CAckIn, 0, ((P0 *)this)->CAckIn.CAckIn_field1, 0, 1);
		/* merge: transmitted_ack_is_enabled = 0(345, 108, 345) */
		reached[0][108] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->transmitted_ack_is_enabled);
		((P0 *)this)->transmitted_ack_is_enabled = 0;
#ifdef VAR_RANGES
		logval("Main:transmitted_ack_is_enabled", ((int)((P0 *)this)->transmitted_ack_is_enabled));
#endif
		;
		/* merge: .(goto)(345, 114, 345) */
		reached[0][114] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 2; goto P999; /* 3 */
	case 66: /* STATE 114 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:354 - [.(goto)] (0:345:0 - 2) */
		IfNotBlocked
		reached[0][114] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 67: /* STATE 112 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:352 - [(1)] (345:0:0 - 1) */
		IfNotBlocked
		reached[0][112] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(345, 114, 345) */
		reached[0][114] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 68: /* STATE 117 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:137 - [(place_CAckOut?[CAckOut.CAckOut_field1])] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][117] = 1;
		if (!((q_len(now.place_CAckOut) > 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 69: /* STATE 118 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:139 - [place_CAckOut?CAckOut.CAckOut_field1] (0:0:1 - 1) */
		reached[0][118] = 1;
		if (q_len(now.place_CAckOut) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P0 *)this)->CAckOut.CAckOut_field1;
		;
		((P0 *)this)->CAckOut.CAckOut_field1 = qrecv(now.place_CAckOut, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("Main:CAckOut.CAckOut_field1", ((P0 *)this)->CAckOut.CAckOut_field1);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.place_CAckOut);
		sprintf(simtmp, "%d", ((P0 *)this)->CAckOut.CAckOut_field1); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 70: /* STATE 119 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:141 - [(1)] (135:0:1 - 1) */
		IfNotBlocked
		reached[0][119] = 1;
		if (!(1))
			continue;
		/* merge: lost_ack_is_enabled = 1(0, 120, 135) */
		reached[0][120] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->lost_ack_is_enabled);
		((P0 *)this)->lost_ack_is_enabled = 1;
#ifdef VAR_RANGES
		logval("Main:lost_ack_is_enabled", ((int)((P0 *)this)->lost_ack_is_enabled));
#endif
		;
		/* merge: .(goto)(0, 125, 135) */
		reached[0][125] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 71: /* STATE 122 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:142 - [place_CAckOut!CAckOut.CAckOut_field1] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][122] = 1;
		if (q_full(now.place_CAckOut))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_CAckOut);
		sprintf(simtmp, "%d", ((P0 *)this)->CAckOut.CAckOut_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_CAckOut, 0, ((P0 *)this)->CAckOut.CAckOut_field1, 0, 1);
		_m = 2; goto P999; /* 0 */
	case 72: /* STATE 127 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:358 - [(lost_ack_is_enabled)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][127] = 1;
		if (!(((int)((P0 *)this)->lost_ack_is_enabled)))
			continue;
		/* dead 1: lost_ack_is_enabled */  (trpt+1)->bup.oval = ((P0 *)this)->lost_ack_is_enabled;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->lost_ack_is_enabled = 0;
		_m = 3; goto P999; /* 0 */
	case 73: /* STATE 128 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:260 - [CAckIn.CAckIn_field1 = 4] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][128] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->CAckIn.CAckIn_field1;
		((P0 *)this)->CAckIn.CAckIn_field1 = 4;
#ifdef VAR_RANGES
		logval("Main:CAckIn.CAckIn_field1", ((P0 *)this)->CAckIn.CAckIn_field1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 74: /* STATE 129 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:261 - [place_CAckIn!CAckIn.CAckIn_field1] (345:0:1 - 1) */
		IfNotBlocked
		reached[0][129] = 1;
		if (q_full(now.place_CAckIn))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_CAckIn);
		sprintf(simtmp, "%d", ((P0 *)this)->CAckIn.CAckIn_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_CAckIn, 0, ((P0 *)this)->CAckIn.CAckIn_field1, 0, 1);
		/* merge: lost_ack_is_enabled = 0(345, 130, 345) */
		reached[0][130] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->lost_ack_is_enabled);
		((P0 *)this)->lost_ack_is_enabled = 0;
#ifdef VAR_RANGES
		logval("Main:lost_ack_is_enabled", ((int)((P0 *)this)->lost_ack_is_enabled));
#endif
		;
		/* merge: .(goto)(345, 136, 345) */
		reached[0][136] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 2; goto P999; /* 3 */
	case 75: /* STATE 136 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:361 - [.(goto)] (0:345:0 - 2) */
		IfNotBlocked
		reached[0][136] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 76: /* STATE 134 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:359 - [(1)] (345:0:0 - 1) */
		IfNotBlocked
		reached[0][134] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(345, 136, 345) */
		reached[0][136] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 77: /* STATE 139 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:146 - [((place_DataIn?[DataIn.DataIn_field1,DataIn.DataIn_field2]&&place_AckBuf?[AckBuf.AckBuf_field1]))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][139] = 1;
		if (!(((q_len(now.place_DataIn) > 0)&&(q_len(now.place_AckBuf) > 0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 78: /* STATE 140 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:148 - [place_DataIn?DataIn.DataIn_field1,DataIn.DataIn_field2] (0:0:2 - 1) */
		reached[0][140] = 1;
		if (q_len(now.place_DataIn) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->DataIn.DataIn_field1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->DataIn.DataIn_field2;
		;
		((P0 *)this)->DataIn.DataIn_field1 = qrecv(now.place_DataIn, XX-1, 0, 0);
#ifdef VAR_RANGES
		logval("Main:DataIn.DataIn_field1", ((P0 *)this)->DataIn.DataIn_field1);
#endif
		;
		((P0 *)this)->DataIn.DataIn_field2 = qrecv(now.place_DataIn, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("Main:DataIn.DataIn_field2", ((P0 *)this)->DataIn.DataIn_field2);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.place_DataIn);
		sprintf(simtmp, "%d", ((P0 *)this)->DataIn.DataIn_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->DataIn.DataIn_field2); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 79: /* STATE 141 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:149 - [place_AckBuf?AckBuf.AckBuf_field1] (0:0:1 - 1) */
		reached[0][141] = 1;
		if (q_len(now.place_AckBuf) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P0 *)this)->AckBuf.AckBuf_field1;
		;
		((P0 *)this)->AckBuf.AckBuf_field1 = qrecv(now.place_AckBuf, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("Main:AckBuf.AckBuf_field1", ((P0 *)this)->AckBuf.AckBuf_field1);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.place_AckBuf);
		sprintf(simtmp, "%d", ((P0 *)this)->AckBuf.AckBuf_field1); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 80: /* STATE 142 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:151 - [(((((((DataIn.DataIn_field1==0)||(DataIn.DataIn_field1==1))&&(DataIn.DataIn_field1==((AckBuf.AckBuf_field1+1)%2)))&&1)&&1)&&1))] (164:0:1 - 1) */
		IfNotBlocked
		reached[0][142] = 1;
		if (!(((((((((P0 *)this)->DataIn.DataIn_field1==0)||(((P0 *)this)->DataIn.DataIn_field1==1))&&(((P0 *)this)->DataIn.DataIn_field1==((((P0 *)this)->AckBuf.AckBuf_field1+1)%2)))&&1)&&1)&&1)))
			continue;
		/* merge: deliverData_is_enabled = 1(0, 144, 164) */
		reached[0][144] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->deliverData_is_enabled);
		((P0 *)this)->deliverData_is_enabled = 1;
#ifdef VAR_RANGES
		logval("Main:deliverData_is_enabled", ((int)((P0 *)this)->deliverData_is_enabled));
#endif
		;
		/* merge: .(goto)(0, 150, 164) */
		reached[0][150] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 81: /* STATE 146 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:153 - [place_DataIn!DataIn.DataIn_field1,DataIn.DataIn_field2] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][146] = 1;
		if (q_full(now.place_DataIn))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_DataIn);
		sprintf(simtmp, "%d", ((P0 *)this)->DataIn.DataIn_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->DataIn.DataIn_field2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_DataIn, 0, ((P0 *)this)->DataIn.DataIn_field1, ((P0 *)this)->DataIn.DataIn_field2, 2);
		_m = 2; goto P999; /* 0 */
	case 82: /* STATE 147 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:154 - [place_AckBuf!AckBuf.AckBuf_field1] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][147] = 1;
		if (q_full(now.place_AckBuf))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_AckBuf);
		sprintf(simtmp, "%d", ((P0 *)this)->AckBuf.AckBuf_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_AckBuf, 0, ((P0 *)this)->AckBuf.AckBuf_field1, 0, 1);
		_m = 2; goto P999; /* 0 */
	case 83: /* STATE 152 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:365 - [(deliverData_is_enabled)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][152] = 1;
		if (!(((int)((P0 *)this)->deliverData_is_enabled)))
			continue;
		/* dead 1: deliverData_is_enabled */  (trpt+1)->bup.oval = ((P0 *)this)->deliverData_is_enabled;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->deliverData_is_enabled = 0;
		_m = 3; goto P999; /* 0 */
	case 84: /* STATE 153 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:265 - [Deliver.Deliver_field1 = DataIn.DataIn_field2] (0:156:3 - 1) */
		IfNotBlocked
		reached[0][153] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->Deliver.Deliver_field1;
		((P0 *)this)->Deliver.Deliver_field1 = ((P0 *)this)->DataIn.DataIn_field2;
#ifdef VAR_RANGES
		logval("Main:Deliver.Deliver_field1", ((P0 *)this)->Deliver.Deliver_field1);
#endif
		;
		/* merge: AckOut.AckOut_field1 = DataIn.DataIn_field1(156, 154, 156) */
		reached[0][154] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->AckOut.AckOut_field1;
		((P0 *)this)->AckOut.AckOut_field1 = ((P0 *)this)->DataIn.DataIn_field1;
#ifdef VAR_RANGES
		logval("Main:AckOut.AckOut_field1", ((P0 *)this)->AckOut.AckOut_field1);
#endif
		;
		/* merge: AckBuf.AckBuf_field1 = DataIn.DataIn_field1(156, 155, 156) */
		reached[0][155] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->AckBuf.AckBuf_field1;
		((P0 *)this)->AckBuf.AckBuf_field1 = ((P0 *)this)->DataIn.DataIn_field1;
#ifdef VAR_RANGES
		logval("Main:AckBuf.AckBuf_field1", ((P0 *)this)->AckBuf.AckBuf_field1);
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 85: /* STATE 156 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:268 - [place_Deliver!Deliver.Deliver_field1] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][156] = 1;
		if (q_full(now.place_Deliver))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_Deliver);
		sprintf(simtmp, "%d", ((P0 *)this)->Deliver.Deliver_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_Deliver, 0, ((P0 *)this)->Deliver.Deliver_field1, 0, 1);
		_m = 2; goto P999; /* 0 */
	case 86: /* STATE 157 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:269 - [place_AckOut!AckOut.AckOut_field1] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][157] = 1;
		if (q_full(now.place_AckOut))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_AckOut);
		sprintf(simtmp, "%d", ((P0 *)this)->AckOut.AckOut_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_AckOut, 0, ((P0 *)this)->AckOut.AckOut_field1, 0, 1);
		_m = 2; goto P999; /* 0 */
	case 87: /* STATE 158 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:270 - [place_AckBuf!AckBuf.AckBuf_field1] (345:0:1 - 1) */
		IfNotBlocked
		reached[0][158] = 1;
		if (q_full(now.place_AckBuf))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_AckBuf);
		sprintf(simtmp, "%d", ((P0 *)this)->AckBuf.AckBuf_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_AckBuf, 0, ((P0 *)this)->AckBuf.AckBuf_field1, 0, 1);
		/* merge: deliverData_is_enabled = 0(345, 159, 345) */
		reached[0][159] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->deliverData_is_enabled);
		((P0 *)this)->deliverData_is_enabled = 0;
#ifdef VAR_RANGES
		logval("Main:deliverData_is_enabled", ((int)((P0 *)this)->deliverData_is_enabled));
#endif
		;
		/* merge: .(goto)(345, 165, 345) */
		reached[0][165] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 2; goto P999; /* 3 */
	case 88: /* STATE 165 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:368 - [.(goto)] (0:345:0 - 2) */
		IfNotBlocked
		reached[0][165] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 89: /* STATE 163 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:366 - [(1)] (345:0:0 - 1) */
		IfNotBlocked
		reached[0][163] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(345, 165, 345) */
		reached[0][165] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 90: /* STATE 168 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:158 - [((place_DataIn?[DataIn.DataIn_field1,DataIn.DataIn_field2]&&place_AckBuf?[AckBuf.AckBuf_field1]))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][168] = 1;
		if (!(((q_len(now.place_DataIn) > 0)&&(q_len(now.place_AckBuf) > 0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 91: /* STATE 169 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:160 - [place_DataIn?DataIn.DataIn_field1,DataIn.DataIn_field2] (0:0:2 - 1) */
		reached[0][169] = 1;
		if (q_len(now.place_DataIn) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->DataIn.DataIn_field1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->DataIn.DataIn_field2;
		;
		((P0 *)this)->DataIn.DataIn_field1 = qrecv(now.place_DataIn, XX-1, 0, 0);
#ifdef VAR_RANGES
		logval("Main:DataIn.DataIn_field1", ((P0 *)this)->DataIn.DataIn_field1);
#endif
		;
		((P0 *)this)->DataIn.DataIn_field2 = qrecv(now.place_DataIn, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("Main:DataIn.DataIn_field2", ((P0 *)this)->DataIn.DataIn_field2);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.place_DataIn);
		sprintf(simtmp, "%d", ((P0 *)this)->DataIn.DataIn_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->DataIn.DataIn_field2); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 92: /* STATE 170 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:161 - [place_AckBuf?AckBuf.AckBuf_field1] (0:0:1 - 1) */
		reached[0][170] = 1;
		if (q_len(now.place_AckBuf) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P0 *)this)->AckBuf.AckBuf_field1;
		;
		((P0 *)this)->AckBuf.AckBuf_field1 = qrecv(now.place_AckBuf, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("Main:AckBuf.AckBuf_field1", ((P0 *)this)->AckBuf.AckBuf_field1);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.place_AckBuf);
		sprintf(simtmp, "%d", ((P0 *)this)->AckBuf.AckBuf_field1); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 93: /* STATE 171 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:163 - [(((((DataIn.DataIn_field1==3)||(DataIn.DataIn_field1==4))&&1)&&1))] (191:0:1 - 1) */
		IfNotBlocked
		reached[0][171] = 1;
		if (!(((((((P0 *)this)->DataIn.DataIn_field1==3)||(((P0 *)this)->DataIn.DataIn_field1==4))&&1)&&1)))
			continue;
		/* merge: resendAck_is_enabled = 1(0, 173, 191) */
		reached[0][173] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->resendAck_is_enabled);
		((P0 *)this)->resendAck_is_enabled = 1;
#ifdef VAR_RANGES
		logval("Main:resendAck_is_enabled", ((int)((P0 *)this)->resendAck_is_enabled));
#endif
		;
		/* merge: .(goto)(0, 179, 191) */
		reached[0][179] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 94: /* STATE 175 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:165 - [place_DataIn!DataIn.DataIn_field1,DataIn.DataIn_field2] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][175] = 1;
		if (q_full(now.place_DataIn))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_DataIn);
		sprintf(simtmp, "%d", ((P0 *)this)->DataIn.DataIn_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->DataIn.DataIn_field2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_DataIn, 0, ((P0 *)this)->DataIn.DataIn_field1, ((P0 *)this)->DataIn.DataIn_field2, 2);
		_m = 2; goto P999; /* 0 */
	case 95: /* STATE 176 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:166 - [place_AckBuf!AckBuf.AckBuf_field1] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][176] = 1;
		if (q_full(now.place_AckBuf))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_AckBuf);
		sprintf(simtmp, "%d", ((P0 *)this)->AckBuf.AckBuf_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_AckBuf, 0, ((P0 *)this)->AckBuf.AckBuf_field1, 0, 1);
		_m = 2; goto P999; /* 0 */
	case 96: /* STATE 181 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:372 - [(resendAck_is_enabled)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][181] = 1;
		if (!(((int)((P0 *)this)->resendAck_is_enabled)))
			continue;
		/* dead 1: resendAck_is_enabled */  (trpt+1)->bup.oval = ((P0 *)this)->resendAck_is_enabled;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->resendAck_is_enabled = 0;
		_m = 3; goto P999; /* 0 */
	case 97: /* STATE 182 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:274 - [AckBuf.AckBuf_field1 = AckBuf.AckBuf_field1] (0:184:2 - 1) */
		IfNotBlocked
		reached[0][182] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->AckBuf.AckBuf_field1;
		((P0 *)this)->AckBuf.AckBuf_field1 = ((P0 *)this)->AckBuf.AckBuf_field1;
#ifdef VAR_RANGES
		logval("Main:AckBuf.AckBuf_field1", ((P0 *)this)->AckBuf.AckBuf_field1);
#endif
		;
		/* merge: AckOut.AckOut_field1 = AckBuf.AckBuf_field1(184, 183, 184) */
		reached[0][183] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->AckOut.AckOut_field1;
		((P0 *)this)->AckOut.AckOut_field1 = ((P0 *)this)->AckBuf.AckBuf_field1;
#ifdef VAR_RANGES
		logval("Main:AckOut.AckOut_field1", ((P0 *)this)->AckOut.AckOut_field1);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 98: /* STATE 184 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:276 - [place_AckOut!AckOut.AckOut_field1] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][184] = 1;
		if (q_full(now.place_AckOut))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_AckOut);
		sprintf(simtmp, "%d", ((P0 *)this)->AckOut.AckOut_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_AckOut, 0, ((P0 *)this)->AckOut.AckOut_field1, 0, 1);
		_m = 2; goto P999; /* 0 */
	case 99: /* STATE 185 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:277 - [place_AckBuf!AckBuf.AckBuf_field1] (345:0:1 - 1) */
		IfNotBlocked
		reached[0][185] = 1;
		if (q_full(now.place_AckBuf))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_AckBuf);
		sprintf(simtmp, "%d", ((P0 *)this)->AckBuf.AckBuf_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_AckBuf, 0, ((P0 *)this)->AckBuf.AckBuf_field1, 0, 1);
		/* merge: resendAck_is_enabled = 0(345, 186, 345) */
		reached[0][186] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->resendAck_is_enabled);
		((P0 *)this)->resendAck_is_enabled = 0;
#ifdef VAR_RANGES
		logval("Main:resendAck_is_enabled", ((int)((P0 *)this)->resendAck_is_enabled));
#endif
		;
		/* merge: .(goto)(345, 192, 345) */
		reached[0][192] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 2; goto P999; /* 3 */
	case 100: /* STATE 192 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:375 - [.(goto)] (0:345:0 - 2) */
		IfNotBlocked
		reached[0][192] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 101: /* STATE 190 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:373 - [(1)] (345:0:0 - 1) */
		IfNotBlocked
		reached[0][190] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(345, 192, 345) */
		reached[0][192] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 102: /* STATE 195 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:170 - [(((place_Accept?[Accept.Accept_field1]&&place_DataBuf?[DataBuf.DataBuf_field1,DataBuf.DataBuf_field2])&&place_AckIn?[AckIn.AckIn_field1]))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][195] = 1;
		if (!((((q_len(now.place_Accept) > 0)&&(q_len(now.place_DataBuf) > 0))&&(q_len(now.place_AckIn) > 0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 103: /* STATE 196 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:172 - [place_Accept?Accept.Accept_field1] (0:0:1 - 1) */
		reached[0][196] = 1;
		if (q_len(now.place_Accept) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P0 *)this)->Accept.Accept_field1;
		;
		((P0 *)this)->Accept.Accept_field1 = qrecv(now.place_Accept, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("Main:Accept.Accept_field1", ((P0 *)this)->Accept.Accept_field1);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.place_Accept);
		sprintf(simtmp, "%d", ((P0 *)this)->Accept.Accept_field1); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 104: /* STATE 197 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:173 - [place_DataBuf?DataBuf.DataBuf_field1,DataBuf.DataBuf_field2] (0:0:2 - 1) */
		reached[0][197] = 1;
		if (q_len(now.place_DataBuf) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->DataBuf.DataBuf_field1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->DataBuf.DataBuf_field2;
		;
		((P0 *)this)->DataBuf.DataBuf_field1 = qrecv(now.place_DataBuf, XX-1, 0, 0);
#ifdef VAR_RANGES
		logval("Main:DataBuf.DataBuf_field1", ((P0 *)this)->DataBuf.DataBuf_field1);
#endif
		;
		((P0 *)this)->DataBuf.DataBuf_field2 = qrecv(now.place_DataBuf, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("Main:DataBuf.DataBuf_field2", ((P0 *)this)->DataBuf.DataBuf_field2);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.place_DataBuf);
		sprintf(simtmp, "%d", ((P0 *)this)->DataBuf.DataBuf_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->DataBuf.DataBuf_field2); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 105: /* STATE 198 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:174 - [place_AckIn?AckIn.AckIn_field1] (0:0:1 - 1) */
		reached[0][198] = 1;
		if (q_len(now.place_AckIn) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P0 *)this)->AckIn.AckIn_field1;
		;
		((P0 *)this)->AckIn.AckIn_field1 = qrecv(now.place_AckIn, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("Main:AckIn.AckIn_field1", ((P0 *)this)->AckIn.AckIn_field1);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.place_AckIn);
		sprintf(simtmp, "%d", ((P0 *)this)->AckIn.AckIn_field1); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 106: /* STATE 199 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:176 - [((((((((AckIn.AckIn_field1==0)||(AckIn.AckIn_field1==1))&&(AckIn.AckIn_field1==DataBuf.DataBuf_field1))&&1)&&1)&&1)&&1))] (222:0:1 - 1) */
		IfNotBlocked
		reached[0][199] = 1;
		if (!((((((((((P0 *)this)->AckIn.AckIn_field1==0)||(((P0 *)this)->AckIn.AckIn_field1==1))&&(((P0 *)this)->AckIn.AckIn_field1==((P0 *)this)->DataBuf.DataBuf_field1))&&1)&&1)&&1)&&1)))
			continue;
		/* merge: sendData_is_enabled = 1(0, 201, 222) */
		reached[0][201] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->sendData_is_enabled);
		((P0 *)this)->sendData_is_enabled = 1;
#ifdef VAR_RANGES
		logval("Main:sendData_is_enabled", ((int)((P0 *)this)->sendData_is_enabled));
#endif
		;
		/* merge: .(goto)(0, 208, 222) */
		reached[0][208] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 107: /* STATE 203 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:178 - [place_Accept!Accept.Accept_field1] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][203] = 1;
		if (q_full(now.place_Accept))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_Accept);
		sprintf(simtmp, "%d", ((P0 *)this)->Accept.Accept_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_Accept, 0, ((P0 *)this)->Accept.Accept_field1, 0, 1);
		_m = 2; goto P999; /* 0 */
	case 108: /* STATE 204 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:179 - [place_DataBuf!DataBuf.DataBuf_field1,DataBuf.DataBuf_field2] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][204] = 1;
		if (q_full(now.place_DataBuf))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_DataBuf);
		sprintf(simtmp, "%d", ((P0 *)this)->DataBuf.DataBuf_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->DataBuf.DataBuf_field2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_DataBuf, 0, ((P0 *)this)->DataBuf.DataBuf_field1, ((P0 *)this)->DataBuf.DataBuf_field2, 2);
		_m = 2; goto P999; /* 0 */
	case 109: /* STATE 205 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:180 - [place_AckIn!AckIn.AckIn_field1] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][205] = 1;
		if (q_full(now.place_AckIn))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_AckIn);
		sprintf(simtmp, "%d", ((P0 *)this)->AckIn.AckIn_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_AckIn, 0, ((P0 *)this)->AckIn.AckIn_field1, 0, 1);
		_m = 2; goto P999; /* 0 */
	case 110: /* STATE 210 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:379 - [(sendData_is_enabled)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][210] = 1;
		if (!(((int)((P0 *)this)->sendData_is_enabled)))
			continue;
		/* dead 1: sendData_is_enabled */  (trpt+1)->bup.oval = ((P0 *)this)->sendData_is_enabled;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->sendData_is_enabled = 0;
		_m = 3; goto P999; /* 0 */
	case 111: /* STATE 211 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:281 - [DataOut.DataOut_field1 = ((AckIn.AckIn_field1+1)%2)] (0:215:4 - 1) */
		IfNotBlocked
		reached[0][211] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->DataOut.DataOut_field1;
		((P0 *)this)->DataOut.DataOut_field1 = ((((P0 *)this)->AckIn.AckIn_field1+1)%2);
#ifdef VAR_RANGES
		logval("Main:DataOut.DataOut_field1", ((P0 *)this)->DataOut.DataOut_field1);
#endif
		;
		/* merge: DataOut.DataOut_field2 = Accept.Accept_field1(215, 212, 215) */
		reached[0][212] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->DataOut.DataOut_field2;
		((P0 *)this)->DataOut.DataOut_field2 = ((P0 *)this)->Accept.Accept_field1;
#ifdef VAR_RANGES
		logval("Main:DataOut.DataOut_field2", ((P0 *)this)->DataOut.DataOut_field2);
#endif
		;
		/* merge: DataBuf.DataBuf_field1 = ((AckIn.AckIn_field1+1)%2)(215, 213, 215) */
		reached[0][213] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->DataBuf.DataBuf_field1;
		((P0 *)this)->DataBuf.DataBuf_field1 = ((((P0 *)this)->AckIn.AckIn_field1+1)%2);
#ifdef VAR_RANGES
		logval("Main:DataBuf.DataBuf_field1", ((P0 *)this)->DataBuf.DataBuf_field1);
#endif
		;
		/* merge: DataBuf.DataBuf_field2 = Accept.Accept_field1(215, 214, 215) */
		reached[0][214] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->DataBuf.DataBuf_field2;
		((P0 *)this)->DataBuf.DataBuf_field2 = ((P0 *)this)->Accept.Accept_field1;
#ifdef VAR_RANGES
		logval("Main:DataBuf.DataBuf_field2", ((P0 *)this)->DataBuf.DataBuf_field2);
#endif
		;
		_m = 3; goto P999; /* 3 */
	case 112: /* STATE 215 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:285 - [place_DataBuf!DataBuf.DataBuf_field1,DataBuf.DataBuf_field2] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][215] = 1;
		if (q_full(now.place_DataBuf))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_DataBuf);
		sprintf(simtmp, "%d", ((P0 *)this)->DataBuf.DataBuf_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->DataBuf.DataBuf_field2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_DataBuf, 0, ((P0 *)this)->DataBuf.DataBuf_field1, ((P0 *)this)->DataBuf.DataBuf_field2, 2);
		_m = 2; goto P999; /* 0 */
	case 113: /* STATE 216 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:286 - [place_DataOut!DataOut.DataOut_field1,DataOut.DataOut_field2] (345:0:1 - 1) */
		IfNotBlocked
		reached[0][216] = 1;
		if (q_full(now.place_DataOut))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_DataOut);
		sprintf(simtmp, "%d", ((P0 *)this)->DataOut.DataOut_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->DataOut.DataOut_field2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_DataOut, 0, ((P0 *)this)->DataOut.DataOut_field1, ((P0 *)this)->DataOut.DataOut_field2, 2);
		/* merge: sendData_is_enabled = 0(345, 217, 345) */
		reached[0][217] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->sendData_is_enabled);
		((P0 *)this)->sendData_is_enabled = 0;
#ifdef VAR_RANGES
		logval("Main:sendData_is_enabled", ((int)((P0 *)this)->sendData_is_enabled));
#endif
		;
		/* merge: .(goto)(345, 223, 345) */
		reached[0][223] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 2; goto P999; /* 3 */
	case 114: /* STATE 223 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:382 - [.(goto)] (0:345:0 - 2) */
		IfNotBlocked
		reached[0][223] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 115: /* STATE 221 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:380 - [(1)] (345:0:0 - 1) */
		IfNotBlocked
		reached[0][221] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(345, 223, 345) */
		reached[0][223] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 116: /* STATE 226 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:184 - [((place_DataBuf?[DataBuf.DataBuf_field1,DataBuf.DataBuf_field2]&&place_AckIn?[AckIn.AckIn_field1]))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][226] = 1;
		if (!(((q_len(now.place_DataBuf) > 0)&&(q_len(now.place_AckIn) > 0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 117: /* STATE 227 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:186 - [place_DataBuf?DataBuf.DataBuf_field1,DataBuf.DataBuf_field2] (0:0:2 - 1) */
		reached[0][227] = 1;
		if (q_len(now.place_DataBuf) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->DataBuf.DataBuf_field1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->DataBuf.DataBuf_field2;
		;
		((P0 *)this)->DataBuf.DataBuf_field1 = qrecv(now.place_DataBuf, XX-1, 0, 0);
#ifdef VAR_RANGES
		logval("Main:DataBuf.DataBuf_field1", ((P0 *)this)->DataBuf.DataBuf_field1);
#endif
		;
		((P0 *)this)->DataBuf.DataBuf_field2 = qrecv(now.place_DataBuf, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("Main:DataBuf.DataBuf_field2", ((P0 *)this)->DataBuf.DataBuf_field2);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.place_DataBuf);
		sprintf(simtmp, "%d", ((P0 *)this)->DataBuf.DataBuf_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->DataBuf.DataBuf_field2); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 118: /* STATE 228 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:187 - [place_AckIn?AckIn.AckIn_field1] (0:0:1 - 1) */
		reached[0][228] = 1;
		if (q_len(now.place_AckIn) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P0 *)this)->AckIn.AckIn_field1;
		;
		((P0 *)this)->AckIn.AckIn_field1 = qrecv(now.place_AckIn, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("Main:AckIn.AckIn_field1", ((P0 *)this)->AckIn.AckIn_field1);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.place_AckIn);
		sprintf(simtmp, "%d", ((P0 *)this)->AckIn.AckIn_field1); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 119: /* STATE 229 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:189 - [(((((((AckIn.AckIn_field1==3)||(AckIn.AckIn_field1==4))&&1)&&1)&&1)&&1))] (251:0:1 - 1) */
		IfNotBlocked
		reached[0][229] = 1;
		if (!(((((((((P0 *)this)->AckIn.AckIn_field1==3)||(((P0 *)this)->AckIn.AckIn_field1==4))&&1)&&1)&&1)&&1)))
			continue;
		/* merge: resendData_is_enabled = 1(0, 231, 251) */
		reached[0][231] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->resendData_is_enabled);
		((P0 *)this)->resendData_is_enabled = 1;
#ifdef VAR_RANGES
		logval("Main:resendData_is_enabled", ((int)((P0 *)this)->resendData_is_enabled));
#endif
		;
		/* merge: .(goto)(0, 237, 251) */
		reached[0][237] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 120: /* STATE 233 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:191 - [place_DataBuf!DataBuf.DataBuf_field1,DataBuf.DataBuf_field2] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][233] = 1;
		if (q_full(now.place_DataBuf))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_DataBuf);
		sprintf(simtmp, "%d", ((P0 *)this)->DataBuf.DataBuf_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->DataBuf.DataBuf_field2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_DataBuf, 0, ((P0 *)this)->DataBuf.DataBuf_field1, ((P0 *)this)->DataBuf.DataBuf_field2, 2);
		_m = 2; goto P999; /* 0 */
	case 121: /* STATE 234 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:192 - [place_AckIn!AckIn.AckIn_field1] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][234] = 1;
		if (q_full(now.place_AckIn))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_AckIn);
		sprintf(simtmp, "%d", ((P0 *)this)->AckIn.AckIn_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_AckIn, 0, ((P0 *)this)->AckIn.AckIn_field1, 0, 1);
		_m = 2; goto P999; /* 0 */
	case 122: /* STATE 239 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:386 - [(resendData_is_enabled)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][239] = 1;
		if (!(((int)((P0 *)this)->resendData_is_enabled)))
			continue;
		/* dead 1: resendData_is_enabled */  (trpt+1)->bup.oval = ((P0 *)this)->resendData_is_enabled;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->resendData_is_enabled = 0;
		_m = 3; goto P999; /* 0 */
	case 123: /* STATE 240 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:290 - [DataOut.DataOut_field1 = DataBuf.DataBuf_field1] (0:244:4 - 1) */
		IfNotBlocked
		reached[0][240] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->DataOut.DataOut_field1;
		((P0 *)this)->DataOut.DataOut_field1 = ((P0 *)this)->DataBuf.DataBuf_field1;
#ifdef VAR_RANGES
		logval("Main:DataOut.DataOut_field1", ((P0 *)this)->DataOut.DataOut_field1);
#endif
		;
		/* merge: DataOut.DataOut_field2 = DataBuf.DataBuf_field2(244, 241, 244) */
		reached[0][241] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->DataOut.DataOut_field2;
		((P0 *)this)->DataOut.DataOut_field2 = ((P0 *)this)->DataBuf.DataBuf_field2;
#ifdef VAR_RANGES
		logval("Main:DataOut.DataOut_field2", ((P0 *)this)->DataOut.DataOut_field2);
#endif
		;
		/* merge: DataBuf.DataBuf_field1 = DataBuf.DataBuf_field1(244, 242, 244) */
		reached[0][242] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->DataBuf.DataBuf_field1;
		((P0 *)this)->DataBuf.DataBuf_field1 = ((P0 *)this)->DataBuf.DataBuf_field1;
#ifdef VAR_RANGES
		logval("Main:DataBuf.DataBuf_field1", ((P0 *)this)->DataBuf.DataBuf_field1);
#endif
		;
		/* merge: DataBuf.DataBuf_field2 = DataBuf.DataBuf_field2(244, 243, 244) */
		reached[0][243] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->DataBuf.DataBuf_field2;
		((P0 *)this)->DataBuf.DataBuf_field2 = ((P0 *)this)->DataBuf.DataBuf_field2;
#ifdef VAR_RANGES
		logval("Main:DataBuf.DataBuf_field2", ((P0 *)this)->DataBuf.DataBuf_field2);
#endif
		;
		_m = 3; goto P999; /* 3 */
	case 124: /* STATE 244 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:294 - [place_DataBuf!DataBuf.DataBuf_field1,DataBuf.DataBuf_field2] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][244] = 1;
		if (q_full(now.place_DataBuf))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_DataBuf);
		sprintf(simtmp, "%d", ((P0 *)this)->DataBuf.DataBuf_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->DataBuf.DataBuf_field2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_DataBuf, 0, ((P0 *)this)->DataBuf.DataBuf_field1, ((P0 *)this)->DataBuf.DataBuf_field2, 2);
		_m = 2; goto P999; /* 0 */
	case 125: /* STATE 245 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:295 - [place_DataOut!DataOut.DataOut_field1,DataOut.DataOut_field2] (345:0:1 - 1) */
		IfNotBlocked
		reached[0][245] = 1;
		if (q_full(now.place_DataOut))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_DataOut);
		sprintf(simtmp, "%d", ((P0 *)this)->DataOut.DataOut_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->DataOut.DataOut_field2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_DataOut, 0, ((P0 *)this)->DataOut.DataOut_field1, ((P0 *)this)->DataOut.DataOut_field2, 2);
		/* merge: resendData_is_enabled = 0(345, 246, 345) */
		reached[0][246] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->resendData_is_enabled);
		((P0 *)this)->resendData_is_enabled = 0;
#ifdef VAR_RANGES
		logval("Main:resendData_is_enabled", ((int)((P0 *)this)->resendData_is_enabled));
#endif
		;
		/* merge: .(goto)(345, 252, 345) */
		reached[0][252] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 2; goto P999; /* 3 */
	case 126: /* STATE 252 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:389 - [.(goto)] (0:345:0 - 2) */
		IfNotBlocked
		reached[0][252] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 127: /* STATE 250 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:387 - [(1)] (345:0:0 - 1) */
		IfNotBlocked
		reached[0][250] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(345, 252, 345) */
		reached[0][252] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 128: /* STATE 255 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:196 - [(place_AckOut?[AckOut.AckOut_field1])] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][255] = 1;
		if (!((q_len(now.place_AckOut) > 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 129: /* STATE 256 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:198 - [place_AckOut?AckOut.AckOut_field1] (0:0:1 - 1) */
		reached[0][256] = 1;
		if (q_len(now.place_AckOut) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P0 *)this)->AckOut.AckOut_field1;
		;
		((P0 *)this)->AckOut.AckOut_field1 = qrecv(now.place_AckOut, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("Main:AckOut.AckOut_field1", ((P0 *)this)->AckOut.AckOut_field1);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.place_AckOut);
		sprintf(simtmp, "%d", ((P0 *)this)->AckOut.AckOut_field1); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 130: /* STATE 257 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:200 - [(1)] (273:0:1 - 1) */
		IfNotBlocked
		reached[0][257] = 1;
		if (!(1))
			continue;
		/* merge: Conn5_is_enabled = 1(0, 258, 273) */
		reached[0][258] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->Conn5_is_enabled);
		((P0 *)this)->Conn5_is_enabled = 1;
#ifdef VAR_RANGES
		logval("Main:Conn5_is_enabled", ((int)((P0 *)this)->Conn5_is_enabled));
#endif
		;
		/* merge: .(goto)(0, 263, 273) */
		reached[0][263] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 131: /* STATE 260 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:201 - [place_AckOut!AckOut.AckOut_field1] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][260] = 1;
		if (q_full(now.place_AckOut))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_AckOut);
		sprintf(simtmp, "%d", ((P0 *)this)->AckOut.AckOut_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_AckOut, 0, ((P0 *)this)->AckOut.AckOut_field1, 0, 1);
		_m = 2; goto P999; /* 0 */
	case 132: /* STATE 265 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:393 - [(Conn5_is_enabled)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][265] = 1;
		if (!(((int)((P0 *)this)->Conn5_is_enabled)))
			continue;
		/* dead 1: Conn5_is_enabled */  (trpt+1)->bup.oval = ((P0 *)this)->Conn5_is_enabled;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->Conn5_is_enabled = 0;
		_m = 3; goto P999; /* 0 */
	case 133: /* STATE 266 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:299 - [CAckOut.CAckOut_field1 = AckOut.AckOut_field1] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][266] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->CAckOut.CAckOut_field1;
		((P0 *)this)->CAckOut.CAckOut_field1 = ((P0 *)this)->AckOut.AckOut_field1;
#ifdef VAR_RANGES
		logval("Main:CAckOut.CAckOut_field1", ((P0 *)this)->CAckOut.CAckOut_field1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 134: /* STATE 267 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:300 - [place_CAckOut!CAckOut.CAckOut_field1] (345:0:1 - 1) */
		IfNotBlocked
		reached[0][267] = 1;
		if (q_full(now.place_CAckOut))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_CAckOut);
		sprintf(simtmp, "%d", ((P0 *)this)->CAckOut.CAckOut_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_CAckOut, 0, ((P0 *)this)->CAckOut.CAckOut_field1, 0, 1);
		/* merge: Conn5_is_enabled = 0(345, 268, 345) */
		reached[0][268] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->Conn5_is_enabled);
		((P0 *)this)->Conn5_is_enabled = 0;
#ifdef VAR_RANGES
		logval("Main:Conn5_is_enabled", ((int)((P0 *)this)->Conn5_is_enabled));
#endif
		;
		/* merge: .(goto)(345, 274, 345) */
		reached[0][274] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 2; goto P999; /* 3 */
	case 135: /* STATE 274 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:396 - [.(goto)] (0:345:0 - 2) */
		IfNotBlocked
		reached[0][274] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 136: /* STATE 272 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:394 - [(1)] (345:0:0 - 1) */
		IfNotBlocked
		reached[0][272] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(345, 274, 345) */
		reached[0][274] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 137: /* STATE 277 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:205 - [(place_CAckIn?[CAckIn.CAckIn_field1])] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][277] = 1;
		if (!((q_len(now.place_CAckIn) > 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 138: /* STATE 278 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:207 - [place_CAckIn?CAckIn.CAckIn_field1] (0:0:1 - 1) */
		reached[0][278] = 1;
		if (q_len(now.place_CAckIn) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P0 *)this)->CAckIn.CAckIn_field1;
		;
		((P0 *)this)->CAckIn.CAckIn_field1 = qrecv(now.place_CAckIn, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("Main:CAckIn.CAckIn_field1", ((P0 *)this)->CAckIn.CAckIn_field1);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.place_CAckIn);
		sprintf(simtmp, "%d", ((P0 *)this)->CAckIn.CAckIn_field1); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 139: /* STATE 279 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:209 - [(1)] (295:0:1 - 1) */
		IfNotBlocked
		reached[0][279] = 1;
		if (!(1))
			continue;
		/* merge: Conn4_is_enabled = 1(0, 280, 295) */
		reached[0][280] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->Conn4_is_enabled);
		((P0 *)this)->Conn4_is_enabled = 1;
#ifdef VAR_RANGES
		logval("Main:Conn4_is_enabled", ((int)((P0 *)this)->Conn4_is_enabled));
#endif
		;
		/* merge: .(goto)(0, 285, 295) */
		reached[0][285] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 140: /* STATE 282 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:210 - [place_CAckIn!CAckIn.CAckIn_field1] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][282] = 1;
		if (q_full(now.place_CAckIn))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_CAckIn);
		sprintf(simtmp, "%d", ((P0 *)this)->CAckIn.CAckIn_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_CAckIn, 0, ((P0 *)this)->CAckIn.CAckIn_field1, 0, 1);
		_m = 2; goto P999; /* 0 */
	case 141: /* STATE 287 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:400 - [(Conn4_is_enabled)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][287] = 1;
		if (!(((int)((P0 *)this)->Conn4_is_enabled)))
			continue;
		/* dead 1: Conn4_is_enabled */  (trpt+1)->bup.oval = ((P0 *)this)->Conn4_is_enabled;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->Conn4_is_enabled = 0;
		_m = 3; goto P999; /* 0 */
	case 142: /* STATE 288 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:304 - [AckIn.AckIn_field1 = CAckIn.CAckIn_field1] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][288] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->AckIn.AckIn_field1;
		((P0 *)this)->AckIn.AckIn_field1 = ((P0 *)this)->CAckIn.CAckIn_field1;
#ifdef VAR_RANGES
		logval("Main:AckIn.AckIn_field1", ((P0 *)this)->AckIn.AckIn_field1);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 143: /* STATE 289 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:305 - [place_AckIn!AckIn.AckIn_field1] (345:0:1 - 1) */
		IfNotBlocked
		reached[0][289] = 1;
		if (q_full(now.place_AckIn))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_AckIn);
		sprintf(simtmp, "%d", ((P0 *)this)->AckIn.AckIn_field1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_AckIn, 0, ((P0 *)this)->AckIn.AckIn_field1, 0, 1);
		/* merge: Conn4_is_enabled = 0(345, 290, 345) */
		reached[0][290] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->Conn4_is_enabled);
		((P0 *)this)->Conn4_is_enabled = 0;
#ifdef VAR_RANGES
		logval("Main:Conn4_is_enabled", ((int)((P0 *)this)->Conn4_is_enabled));
#endif
		;
		/* merge: .(goto)(345, 296, 345) */
		reached[0][296] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 2; goto P999; /* 3 */
	case 144: /* STATE 296 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:403 - [.(goto)] (0:345:0 - 2) */
		IfNotBlocked
		reached[0][296] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 145: /* STATE 294 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:401 - [(1)] (345:0:0 - 1) */
		IfNotBlocked
		reached[0][294] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(345, 296, 345) */
		reached[0][296] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 146: /* STATE 299 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:214 - [(place_CDataIn?[CDataIn.CDataIn_field1,CDataIn.CDataIn_field2])] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][299] = 1;
		if (!((q_len(now.place_CDataIn) > 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 147: /* STATE 300 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:216 - [place_CDataIn?CDataIn.CDataIn_field1,CDataIn.CDataIn_field2] (0:0:2 - 1) */
		reached[0][300] = 1;
		if (q_len(now.place_CDataIn) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->CDataIn.CDataIn_field1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->CDataIn.CDataIn_field2;
		;
		((P0 *)this)->CDataIn.CDataIn_field1 = qrecv(now.place_CDataIn, XX-1, 0, 0);
#ifdef VAR_RANGES
		logval("Main:CDataIn.CDataIn_field1", ((P0 *)this)->CDataIn.CDataIn_field1);
#endif
		;
		((P0 *)this)->CDataIn.CDataIn_field2 = qrecv(now.place_CDataIn, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("Main:CDataIn.CDataIn_field2", ((P0 *)this)->CDataIn.CDataIn_field2);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.place_CDataIn);
		sprintf(simtmp, "%d", ((P0 *)this)->CDataIn.CDataIn_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->CDataIn.CDataIn_field2); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 148: /* STATE 301 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:218 - [(1)] (318:0:1 - 1) */
		IfNotBlocked
		reached[0][301] = 1;
		if (!(1))
			continue;
		/* merge: Conn3_is_enabled = 1(0, 302, 318) */
		reached[0][302] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->Conn3_is_enabled);
		((P0 *)this)->Conn3_is_enabled = 1;
#ifdef VAR_RANGES
		logval("Main:Conn3_is_enabled", ((int)((P0 *)this)->Conn3_is_enabled));
#endif
		;
		/* merge: .(goto)(0, 307, 318) */
		reached[0][307] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 149: /* STATE 304 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:219 - [place_CDataIn!CDataIn.CDataIn_field1,CDataIn.CDataIn_field2] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][304] = 1;
		if (q_full(now.place_CDataIn))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_CDataIn);
		sprintf(simtmp, "%d", ((P0 *)this)->CDataIn.CDataIn_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->CDataIn.CDataIn_field2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_CDataIn, 0, ((P0 *)this)->CDataIn.CDataIn_field1, ((P0 *)this)->CDataIn.CDataIn_field2, 2);
		_m = 2; goto P999; /* 0 */
	case 150: /* STATE 309 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:407 - [(Conn3_is_enabled)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][309] = 1;
		if (!(((int)((P0 *)this)->Conn3_is_enabled)))
			continue;
		/* dead 1: Conn3_is_enabled */  (trpt+1)->bup.oval = ((P0 *)this)->Conn3_is_enabled;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->Conn3_is_enabled = 0;
		_m = 3; goto P999; /* 0 */
	case 151: /* STATE 310 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:309 - [DataIn.DataIn_field1 = CDataIn.CDataIn_field1] (0:312:2 - 1) */
		IfNotBlocked
		reached[0][310] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->DataIn.DataIn_field1;
		((P0 *)this)->DataIn.DataIn_field1 = ((P0 *)this)->CDataIn.CDataIn_field1;
#ifdef VAR_RANGES
		logval("Main:DataIn.DataIn_field1", ((P0 *)this)->DataIn.DataIn_field1);
#endif
		;
		/* merge: DataIn.DataIn_field2 = CDataIn.CDataIn_field2(312, 311, 312) */
		reached[0][311] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->DataIn.DataIn_field2;
		((P0 *)this)->DataIn.DataIn_field2 = ((P0 *)this)->CDataIn.CDataIn_field2;
#ifdef VAR_RANGES
		logval("Main:DataIn.DataIn_field2", ((P0 *)this)->DataIn.DataIn_field2);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 152: /* STATE 312 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:311 - [place_DataIn!DataIn.DataIn_field1,DataIn.DataIn_field2] (345:0:1 - 1) */
		IfNotBlocked
		reached[0][312] = 1;
		if (q_full(now.place_DataIn))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_DataIn);
		sprintf(simtmp, "%d", ((P0 *)this)->DataIn.DataIn_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->DataIn.DataIn_field2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_DataIn, 0, ((P0 *)this)->DataIn.DataIn_field1, ((P0 *)this)->DataIn.DataIn_field2, 2);
		/* merge: Conn3_is_enabled = 0(345, 313, 345) */
		reached[0][313] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->Conn3_is_enabled);
		((P0 *)this)->Conn3_is_enabled = 0;
#ifdef VAR_RANGES
		logval("Main:Conn3_is_enabled", ((int)((P0 *)this)->Conn3_is_enabled));
#endif
		;
		/* merge: .(goto)(345, 319, 345) */
		reached[0][319] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 2; goto P999; /* 3 */
	case 153: /* STATE 319 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:410 - [.(goto)] (0:345:0 - 2) */
		IfNotBlocked
		reached[0][319] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 154: /* STATE 317 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:408 - [(1)] (345:0:0 - 1) */
		IfNotBlocked
		reached[0][317] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(345, 319, 345) */
		reached[0][319] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 155: /* STATE 322 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:223 - [(place_DataOut?[DataOut.DataOut_field1,DataOut.DataOut_field2])] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][322] = 1;
		if (!((q_len(now.place_DataOut) > 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 156: /* STATE 323 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:225 - [place_DataOut?DataOut.DataOut_field1,DataOut.DataOut_field2] (0:0:2 - 1) */
		reached[0][323] = 1;
		if (q_len(now.place_DataOut) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->DataOut.DataOut_field1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->DataOut.DataOut_field2;
		;
		((P0 *)this)->DataOut.DataOut_field1 = qrecv(now.place_DataOut, XX-1, 0, 0);
#ifdef VAR_RANGES
		logval("Main:DataOut.DataOut_field1", ((P0 *)this)->DataOut.DataOut_field1);
#endif
		;
		((P0 *)this)->DataOut.DataOut_field2 = qrecv(now.place_DataOut, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("Main:DataOut.DataOut_field2", ((P0 *)this)->DataOut.DataOut_field2);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.place_DataOut);
		sprintf(simtmp, "%d", ((P0 *)this)->DataOut.DataOut_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->DataOut.DataOut_field2); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 157: /* STATE 324 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:227 - [(1)] (341:0:1 - 1) */
		IfNotBlocked
		reached[0][324] = 1;
		if (!(1))
			continue;
		/* merge: Conn2_is_enabled = 1(0, 325, 341) */
		reached[0][325] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->Conn2_is_enabled);
		((P0 *)this)->Conn2_is_enabled = 1;
#ifdef VAR_RANGES
		logval("Main:Conn2_is_enabled", ((int)((P0 *)this)->Conn2_is_enabled));
#endif
		;
		/* merge: .(goto)(0, 330, 341) */
		reached[0][330] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 158: /* STATE 327 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:228 - [place_DataOut!DataOut.DataOut_field1,DataOut.DataOut_field2] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][327] = 1;
		if (q_full(now.place_DataOut))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_DataOut);
		sprintf(simtmp, "%d", ((P0 *)this)->DataOut.DataOut_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->DataOut.DataOut_field2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_DataOut, 0, ((P0 *)this)->DataOut.DataOut_field1, ((P0 *)this)->DataOut.DataOut_field2, 2);
		_m = 2; goto P999; /* 0 */
	case 159: /* STATE 332 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:414 - [(Conn2_is_enabled)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][332] = 1;
		if (!(((int)((P0 *)this)->Conn2_is_enabled)))
			continue;
		/* dead 1: Conn2_is_enabled */  (trpt+1)->bup.oval = ((P0 *)this)->Conn2_is_enabled;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->Conn2_is_enabled = 0;
		_m = 3; goto P999; /* 0 */
	case 160: /* STATE 333 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:315 - [CDataOut.CDataOut_field1 = DataOut.DataOut_field1] (0:335:2 - 1) */
		IfNotBlocked
		reached[0][333] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->CDataOut.CDataOut_field1;
		((P0 *)this)->CDataOut.CDataOut_field1 = ((P0 *)this)->DataOut.DataOut_field1;
#ifdef VAR_RANGES
		logval("Main:CDataOut.CDataOut_field1", ((P0 *)this)->CDataOut.CDataOut_field1);
#endif
		;
		/* merge: CDataOut.CDataOut_field2 = DataOut.DataOut_field2(335, 334, 335) */
		reached[0][334] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->CDataOut.CDataOut_field2;
		((P0 *)this)->CDataOut.CDataOut_field2 = ((P0 *)this)->DataOut.DataOut_field2;
#ifdef VAR_RANGES
		logval("Main:CDataOut.CDataOut_field2", ((P0 *)this)->CDataOut.CDataOut_field2);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 161: /* STATE 335 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:317 - [place_CDataOut!CDataOut.CDataOut_field1,CDataOut.CDataOut_field2] (345:0:1 - 1) */
		IfNotBlocked
		reached[0][335] = 1;
		if (q_full(now.place_CDataOut))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.place_CDataOut);
		sprintf(simtmp, "%d", ((P0 *)this)->CDataOut.CDataOut_field1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)this)->CDataOut.CDataOut_field2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.place_CDataOut, 0, ((P0 *)this)->CDataOut.CDataOut_field1, ((P0 *)this)->CDataOut.CDataOut_field2, 2);
		/* merge: Conn2_is_enabled = 0(345, 336, 345) */
		reached[0][336] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->Conn2_is_enabled);
		((P0 *)this)->Conn2_is_enabled = 0;
#ifdef VAR_RANGES
		logval("Main:Conn2_is_enabled", ((int)((P0 *)this)->Conn2_is_enabled));
#endif
		;
		/* merge: .(goto)(345, 342, 345) */
		reached[0][342] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 2; goto P999; /* 3 */
	case 162: /* STATE 342 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:417 - [.(goto)] (0:345:0 - 2) */
		IfNotBlocked
		reached[0][342] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 163: /* STATE 340 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:415 - [(1)] (345:0:0 - 1) */
		IfNotBlocked
		reached[0][340] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(345, 342, 345) */
		reached[0][342] = 1;
		;
		/* merge: .(goto)(0, 346, 345) */
		reached[0][346] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 164: /* STATE 348 - C:\Documents and Settings\Greg\workspace\CEN5011_TEAM_2\Team_2_Project\abp.pml:462 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][348] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

