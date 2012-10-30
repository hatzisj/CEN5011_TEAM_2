	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM f */
;
		;
		
	case 4: /* STATE 5 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC :init: */

	case 5: /* STATE 1 */
		;
		((P1 *)this)->AckBuf.AckBuf_field1 = trpt->bup.oval;
		;
		goto R999;

	case 6: /* STATE 2 */
		;
		_m = unsend(now.place_AckBuf);
		;
		goto R999;

	case 7: /* STATE 4 */
		;
		((P1 *)this)->Accept.Accept_field1 = trpt->bup.oval;
		;
		;
		goto R999;

	case 8: /* STATE 5 */
		;
		_m = unsend(now.place_Accept);
		;
		goto R999;

	case 9: /* STATE 6 */
		;
		((P1 *)this)->Accept.Accept_field1 = trpt->bup.oval;
		;
		goto R999;

	case 10: /* STATE 7 */
		;
		_m = unsend(now.place_Accept);
		;
		goto R999;

	case 11: /* STATE 8 */
		;
		((P1 *)this)->Accept.Accept_field1 = trpt->bup.oval;
		;
		goto R999;

	case 12: /* STATE 9 */
		;
		_m = unsend(now.place_Accept);
		;
		goto R999;

	case 13: /* STATE 10 */
		;
		((P1 *)this)->Accept.Accept_field1 = trpt->bup.oval;
		;
		goto R999;

	case 14: /* STATE 11 */
		;
		_m = unsend(now.place_Accept);
		;
		goto R999;

	case 15: /* STATE 12 */
		;
		((P1 *)this)->Accept.Accept_field1 = trpt->bup.oval;
		;
		goto R999;

	case 16: /* STATE 13 */
		;
		_m = unsend(now.place_Accept);
		;
		goto R999;

	case 17: /* STATE 16 */
		;
		((P1 *)this)->DataBuf.DataBuf_field2 = trpt->bup.ovals[1];
		((P1 *)this)->DataBuf.DataBuf_field1 = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 18: /* STATE 17 */
		;
		_m = unsend(now.place_DataBuf);
		;
		goto R999;

	case 19: /* STATE 20 */
		;
		((P1 *)this)->AckIn.AckIn_field1 = trpt->bup.oval;
		;
		;
		;
		goto R999;

	case 20: /* STATE 21 */
		;
		_m = unsend(now.place_AckIn);
		;
		goto R999;

	case 21: /* STATE 22 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 22: /* STATE 23 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Main */
;
		;
		
	case 24: /* STATE 2 */
		;
		XX = 1;
		unrecv(now.place_CDataOut, XX-1, 0, ((P0 *)this)->CDataOut.CDataOut_field1, 1);
		unrecv(now.place_CDataOut, XX-1, 1, ((P0 *)this)->CDataOut.CDataOut_field2, 0);
		((P0 *)this)->CDataOut.CDataOut_field1 = trpt->bup.ovals[0];
		((P0 *)this)->CDataOut.CDataOut_field2 = trpt->bup.ovals[1];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 25: /* STATE 5 */
		;
		((P0 *)this)->corrupted_is_enabled = trpt->bup.oval;
		;
		goto R999;

	case 26: /* STATE 7 */
		;
		_m = unsend(now.place_CDataOut);
		;
		goto R999;

	case 27: /* STATE 12 */
		;
	/* 0 */	((P0 *)this)->corrupted_is_enabled = trpt->bup.oval;
		;
		;
		goto R999;

	case 28: /* STATE 14 */
		;
		((P0 *)this)->CDataIn.CDataIn_field2 = trpt->bup.ovals[1];
		((P0 *)this)->CDataIn.CDataIn_field1 = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 29: /* STATE 16 */
		;
		((P0 *)this)->corrupted_is_enabled = trpt->bup.oval;
		_m = unsend(now.place_CDataIn);
		;
		goto R999;
;
		
	case 30: /* STATE 22 */
		goto R999;
;
		
	case 31: /* STATE 20 */
		goto R999;
;
		;
		
	case 33: /* STATE 26 */
		;
		XX = 1;
		unrecv(now.place_CDataOut, XX-1, 0, ((P0 *)this)->CDataOut.CDataOut_field1, 1);
		unrecv(now.place_CDataOut, XX-1, 1, ((P0 *)this)->CDataOut.CDataOut_field2, 0);
		((P0 *)this)->CDataOut.CDataOut_field1 = trpt->bup.ovals[0];
		((P0 *)this)->CDataOut.CDataOut_field2 = trpt->bup.ovals[1];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 34: /* STATE 29 */
		;
		((P0 *)this)->transmitted_is_enabled = trpt->bup.oval;
		;
		goto R999;

	case 35: /* STATE 31 */
		;
		_m = unsend(now.place_CDataOut);
		;
		goto R999;

	case 36: /* STATE 36 */
		;
	/* 0 */	((P0 *)this)->transmitted_is_enabled = trpt->bup.oval;
		;
		;
		goto R999;

	case 37: /* STATE 38 */
		;
		((P0 *)this)->CDataIn.CDataIn_field2 = trpt->bup.ovals[1];
		((P0 *)this)->CDataIn.CDataIn_field1 = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 38: /* STATE 40 */
		;
		((P0 *)this)->transmitted_is_enabled = trpt->bup.oval;
		_m = unsend(now.place_CDataIn);
		;
		goto R999;
;
		
	case 39: /* STATE 46 */
		goto R999;
;
		
	case 40: /* STATE 44 */
		goto R999;
;
		;
		
	case 42: /* STATE 50 */
		;
		XX = 1;
		unrecv(now.place_CDataOut, XX-1, 0, ((P0 *)this)->CDataOut.CDataOut_field1, 1);
		unrecv(now.place_CDataOut, XX-1, 1, ((P0 *)this)->CDataOut.CDataOut_field2, 0);
		((P0 *)this)->CDataOut.CDataOut_field1 = trpt->bup.ovals[0];
		((P0 *)this)->CDataOut.CDataOut_field2 = trpt->bup.ovals[1];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 43: /* STATE 53 */
		;
		((P0 *)this)->lost_is_enabled = trpt->bup.oval;
		;
		goto R999;

	case 44: /* STATE 55 */
		;
		_m = unsend(now.place_CDataOut);
		;
		goto R999;

	case 45: /* STATE 60 */
		;
	/* 0 */	((P0 *)this)->lost_is_enabled = trpt->bup.oval;
		;
		;
		goto R999;

	case 46: /* STATE 62 */
		;
		((P0 *)this)->CDataIn.CDataIn_field2 = trpt->bup.ovals[1];
		((P0 *)this)->CDataIn.CDataIn_field1 = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 47: /* STATE 64 */
		;
		((P0 *)this)->lost_is_enabled = trpt->bup.oval;
		_m = unsend(now.place_CDataIn);
		;
		goto R999;
;
		
	case 48: /* STATE 70 */
		goto R999;
;
		
	case 49: /* STATE 68 */
		goto R999;
;
		;
		
	case 51: /* STATE 74 */
		;
		XX = 1;
		unrecv(now.place_CAckOut, XX-1, 0, ((P0 *)this)->CAckOut.CAckOut_field1, 1);
		((P0 *)this)->CAckOut.CAckOut_field1 = trpt->bup.oval;
		;
		;
		goto R999;

	case 52: /* STATE 76 */
		;
		((P0 *)this)->corrupted_ack_is_enabled = trpt->bup.oval;
		;
		goto R999;

	case 53: /* STATE 78 */
		;
		_m = unsend(now.place_CAckOut);
		;
		goto R999;

	case 54: /* STATE 83 */
		;
	/* 0 */	((P0 *)this)->corrupted_ack_is_enabled = trpt->bup.oval;
		;
		;
		goto R999;

	case 55: /* STATE 84 */
		;
		((P0 *)this)->CAckIn.CAckIn_field1 = trpt->bup.oval;
		;
		goto R999;

	case 56: /* STATE 86 */
		;
		((P0 *)this)->corrupted_ack_is_enabled = trpt->bup.oval;
		_m = unsend(now.place_CAckIn);
		;
		goto R999;
;
		
	case 57: /* STATE 92 */
		goto R999;
;
		
	case 58: /* STATE 90 */
		goto R999;
;
		;
		
	case 60: /* STATE 96 */
		;
		XX = 1;
		unrecv(now.place_CAckOut, XX-1, 0, ((P0 *)this)->CAckOut.CAckOut_field1, 1);
		((P0 *)this)->CAckOut.CAckOut_field1 = trpt->bup.oval;
		;
		;
		goto R999;

	case 61: /* STATE 98 */
		;
		((P0 *)this)->transmitted_ack_is_enabled = trpt->bup.oval;
		;
		goto R999;

	case 62: /* STATE 100 */
		;
		_m = unsend(now.place_CAckOut);
		;
		goto R999;

	case 63: /* STATE 105 */
		;
	/* 0 */	((P0 *)this)->transmitted_ack_is_enabled = trpt->bup.oval;
		;
		;
		goto R999;

	case 64: /* STATE 106 */
		;
		((P0 *)this)->CAckIn.CAckIn_field1 = trpt->bup.oval;
		;
		goto R999;

	case 65: /* STATE 108 */
		;
		((P0 *)this)->transmitted_ack_is_enabled = trpt->bup.oval;
		_m = unsend(now.place_CAckIn);
		;
		goto R999;
;
		
	case 66: /* STATE 114 */
		goto R999;
;
		
	case 67: /* STATE 112 */
		goto R999;
;
		;
		
	case 69: /* STATE 118 */
		;
		XX = 1;
		unrecv(now.place_CAckOut, XX-1, 0, ((P0 *)this)->CAckOut.CAckOut_field1, 1);
		((P0 *)this)->CAckOut.CAckOut_field1 = trpt->bup.oval;
		;
		;
		goto R999;

	case 70: /* STATE 120 */
		;
		((P0 *)this)->lost_ack_is_enabled = trpt->bup.oval;
		;
		goto R999;

	case 71: /* STATE 122 */
		;
		_m = unsend(now.place_CAckOut);
		;
		goto R999;

	case 72: /* STATE 127 */
		;
	/* 0 */	((P0 *)this)->lost_ack_is_enabled = trpt->bup.oval;
		;
		;
		goto R999;

	case 73: /* STATE 128 */
		;
		((P0 *)this)->CAckIn.CAckIn_field1 = trpt->bup.oval;
		;
		goto R999;

	case 74: /* STATE 130 */
		;
		((P0 *)this)->lost_ack_is_enabled = trpt->bup.oval;
		_m = unsend(now.place_CAckIn);
		;
		goto R999;
;
		
	case 75: /* STATE 136 */
		goto R999;
;
		
	case 76: /* STATE 134 */
		goto R999;
;
		;
		
	case 78: /* STATE 140 */
		;
		XX = 1;
		unrecv(now.place_DataIn, XX-1, 0, ((P0 *)this)->DataIn.DataIn_field1, 1);
		unrecv(now.place_DataIn, XX-1, 1, ((P0 *)this)->DataIn.DataIn_field2, 0);
		((P0 *)this)->DataIn.DataIn_field1 = trpt->bup.ovals[0];
		((P0 *)this)->DataIn.DataIn_field2 = trpt->bup.ovals[1];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 79: /* STATE 141 */
		;
		XX = 1;
		unrecv(now.place_AckBuf, XX-1, 0, ((P0 *)this)->AckBuf.AckBuf_field1, 1);
		((P0 *)this)->AckBuf.AckBuf_field1 = trpt->bup.oval;
		;
		;
		goto R999;

	case 80: /* STATE 144 */
		;
		((P0 *)this)->deliverData_is_enabled = trpt->bup.oval;
		;
		goto R999;

	case 81: /* STATE 146 */
		;
		_m = unsend(now.place_DataIn);
		;
		goto R999;

	case 82: /* STATE 147 */
		;
		_m = unsend(now.place_AckBuf);
		;
		goto R999;

	case 83: /* STATE 152 */
		;
	/* 0 */	((P0 *)this)->deliverData_is_enabled = trpt->bup.oval;
		;
		;
		goto R999;

	case 84: /* STATE 155 */
		;
		((P0 *)this)->AckBuf.AckBuf_field1 = trpt->bup.ovals[2];
		((P0 *)this)->AckOut.AckOut_field1 = trpt->bup.ovals[1];
		((P0 *)this)->Deliver.Deliver_field1 = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 85: /* STATE 156 */
		;
		_m = unsend(now.place_Deliver);
		;
		goto R999;

	case 86: /* STATE 157 */
		;
		_m = unsend(now.place_AckOut);
		;
		goto R999;

	case 87: /* STATE 159 */
		;
		((P0 *)this)->deliverData_is_enabled = trpt->bup.oval;
		_m = unsend(now.place_AckBuf);
		;
		goto R999;
;
		
	case 88: /* STATE 165 */
		goto R999;
;
		
	case 89: /* STATE 163 */
		goto R999;
;
		;
		
	case 91: /* STATE 169 */
		;
		XX = 1;
		unrecv(now.place_DataIn, XX-1, 0, ((P0 *)this)->DataIn.DataIn_field1, 1);
		unrecv(now.place_DataIn, XX-1, 1, ((P0 *)this)->DataIn.DataIn_field2, 0);
		((P0 *)this)->DataIn.DataIn_field1 = trpt->bup.ovals[0];
		((P0 *)this)->DataIn.DataIn_field2 = trpt->bup.ovals[1];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 92: /* STATE 170 */
		;
		XX = 1;
		unrecv(now.place_AckBuf, XX-1, 0, ((P0 *)this)->AckBuf.AckBuf_field1, 1);
		((P0 *)this)->AckBuf.AckBuf_field1 = trpt->bup.oval;
		;
		;
		goto R999;

	case 93: /* STATE 173 */
		;
		((P0 *)this)->resendAck_is_enabled = trpt->bup.oval;
		;
		goto R999;

	case 94: /* STATE 175 */
		;
		_m = unsend(now.place_DataIn);
		;
		goto R999;

	case 95: /* STATE 176 */
		;
		_m = unsend(now.place_AckBuf);
		;
		goto R999;

	case 96: /* STATE 181 */
		;
	/* 0 */	((P0 *)this)->resendAck_is_enabled = trpt->bup.oval;
		;
		;
		goto R999;

	case 97: /* STATE 183 */
		;
		((P0 *)this)->AckOut.AckOut_field1 = trpt->bup.ovals[1];
		((P0 *)this)->AckBuf.AckBuf_field1 = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 98: /* STATE 184 */
		;
		_m = unsend(now.place_AckOut);
		;
		goto R999;

	case 99: /* STATE 186 */
		;
		((P0 *)this)->resendAck_is_enabled = trpt->bup.oval;
		_m = unsend(now.place_AckBuf);
		;
		goto R999;
;
		
	case 100: /* STATE 192 */
		goto R999;
;
		
	case 101: /* STATE 190 */
		goto R999;
;
		;
		
	case 103: /* STATE 196 */
		;
		XX = 1;
		unrecv(now.place_Accept, XX-1, 0, ((P0 *)this)->Accept.Accept_field1, 1);
		((P0 *)this)->Accept.Accept_field1 = trpt->bup.oval;
		;
		;
		goto R999;

	case 104: /* STATE 197 */
		;
		XX = 1;
		unrecv(now.place_DataBuf, XX-1, 0, ((P0 *)this)->DataBuf.DataBuf_field1, 1);
		unrecv(now.place_DataBuf, XX-1, 1, ((P0 *)this)->DataBuf.DataBuf_field2, 0);
		((P0 *)this)->DataBuf.DataBuf_field1 = trpt->bup.ovals[0];
		((P0 *)this)->DataBuf.DataBuf_field2 = trpt->bup.ovals[1];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 105: /* STATE 198 */
		;
		XX = 1;
		unrecv(now.place_AckIn, XX-1, 0, ((P0 *)this)->AckIn.AckIn_field1, 1);
		((P0 *)this)->AckIn.AckIn_field1 = trpt->bup.oval;
		;
		;
		goto R999;

	case 106: /* STATE 201 */
		;
		((P0 *)this)->sendData_is_enabled = trpt->bup.oval;
		;
		goto R999;

	case 107: /* STATE 203 */
		;
		_m = unsend(now.place_Accept);
		;
		goto R999;

	case 108: /* STATE 204 */
		;
		_m = unsend(now.place_DataBuf);
		;
		goto R999;

	case 109: /* STATE 205 */
		;
		_m = unsend(now.place_AckIn);
		;
		goto R999;

	case 110: /* STATE 210 */
		;
	/* 0 */	((P0 *)this)->sendData_is_enabled = trpt->bup.oval;
		;
		;
		goto R999;

	case 111: /* STATE 214 */
		;
		((P0 *)this)->DataBuf.DataBuf_field2 = trpt->bup.ovals[3];
		((P0 *)this)->DataBuf.DataBuf_field1 = trpt->bup.ovals[2];
		((P0 *)this)->DataOut.DataOut_field2 = trpt->bup.ovals[1];
		((P0 *)this)->DataOut.DataOut_field1 = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 112: /* STATE 215 */
		;
		_m = unsend(now.place_DataBuf);
		;
		goto R999;

	case 113: /* STATE 217 */
		;
		((P0 *)this)->sendData_is_enabled = trpt->bup.oval;
		_m = unsend(now.place_DataOut);
		;
		goto R999;
;
		
	case 114: /* STATE 223 */
		goto R999;
;
		
	case 115: /* STATE 221 */
		goto R999;
;
		;
		
	case 117: /* STATE 227 */
		;
		XX = 1;
		unrecv(now.place_DataBuf, XX-1, 0, ((P0 *)this)->DataBuf.DataBuf_field1, 1);
		unrecv(now.place_DataBuf, XX-1, 1, ((P0 *)this)->DataBuf.DataBuf_field2, 0);
		((P0 *)this)->DataBuf.DataBuf_field1 = trpt->bup.ovals[0];
		((P0 *)this)->DataBuf.DataBuf_field2 = trpt->bup.ovals[1];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 118: /* STATE 228 */
		;
		XX = 1;
		unrecv(now.place_AckIn, XX-1, 0, ((P0 *)this)->AckIn.AckIn_field1, 1);
		((P0 *)this)->AckIn.AckIn_field1 = trpt->bup.oval;
		;
		;
		goto R999;

	case 119: /* STATE 231 */
		;
		((P0 *)this)->resendData_is_enabled = trpt->bup.oval;
		;
		goto R999;

	case 120: /* STATE 233 */
		;
		_m = unsend(now.place_DataBuf);
		;
		goto R999;

	case 121: /* STATE 234 */
		;
		_m = unsend(now.place_AckIn);
		;
		goto R999;

	case 122: /* STATE 239 */
		;
	/* 0 */	((P0 *)this)->resendData_is_enabled = trpt->bup.oval;
		;
		;
		goto R999;

	case 123: /* STATE 243 */
		;
		((P0 *)this)->DataBuf.DataBuf_field2 = trpt->bup.ovals[3];
		((P0 *)this)->DataBuf.DataBuf_field1 = trpt->bup.ovals[2];
		((P0 *)this)->DataOut.DataOut_field2 = trpt->bup.ovals[1];
		((P0 *)this)->DataOut.DataOut_field1 = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 124: /* STATE 244 */
		;
		_m = unsend(now.place_DataBuf);
		;
		goto R999;

	case 125: /* STATE 246 */
		;
		((P0 *)this)->resendData_is_enabled = trpt->bup.oval;
		_m = unsend(now.place_DataOut);
		;
		goto R999;
;
		
	case 126: /* STATE 252 */
		goto R999;
;
		
	case 127: /* STATE 250 */
		goto R999;
;
		;
		
	case 129: /* STATE 256 */
		;
		XX = 1;
		unrecv(now.place_AckOut, XX-1, 0, ((P0 *)this)->AckOut.AckOut_field1, 1);
		((P0 *)this)->AckOut.AckOut_field1 = trpt->bup.oval;
		;
		;
		goto R999;

	case 130: /* STATE 258 */
		;
		((P0 *)this)->Conn5_is_enabled = trpt->bup.oval;
		;
		goto R999;

	case 131: /* STATE 260 */
		;
		_m = unsend(now.place_AckOut);
		;
		goto R999;

	case 132: /* STATE 265 */
		;
	/* 0 */	((P0 *)this)->Conn5_is_enabled = trpt->bup.oval;
		;
		;
		goto R999;

	case 133: /* STATE 266 */
		;
		((P0 *)this)->CAckOut.CAckOut_field1 = trpt->bup.oval;
		;
		goto R999;

	case 134: /* STATE 268 */
		;
		((P0 *)this)->Conn5_is_enabled = trpt->bup.oval;
		_m = unsend(now.place_CAckOut);
		;
		goto R999;
;
		
	case 135: /* STATE 274 */
		goto R999;
;
		
	case 136: /* STATE 272 */
		goto R999;
;
		;
		
	case 138: /* STATE 278 */
		;
		XX = 1;
		unrecv(now.place_CAckIn, XX-1, 0, ((P0 *)this)->CAckIn.CAckIn_field1, 1);
		((P0 *)this)->CAckIn.CAckIn_field1 = trpt->bup.oval;
		;
		;
		goto R999;

	case 139: /* STATE 280 */
		;
		((P0 *)this)->Conn4_is_enabled = trpt->bup.oval;
		;
		goto R999;

	case 140: /* STATE 282 */
		;
		_m = unsend(now.place_CAckIn);
		;
		goto R999;

	case 141: /* STATE 287 */
		;
	/* 0 */	((P0 *)this)->Conn4_is_enabled = trpt->bup.oval;
		;
		;
		goto R999;

	case 142: /* STATE 288 */
		;
		((P0 *)this)->AckIn.AckIn_field1 = trpt->bup.oval;
		;
		goto R999;

	case 143: /* STATE 290 */
		;
		((P0 *)this)->Conn4_is_enabled = trpt->bup.oval;
		_m = unsend(now.place_AckIn);
		;
		goto R999;
;
		
	case 144: /* STATE 296 */
		goto R999;
;
		
	case 145: /* STATE 294 */
		goto R999;
;
		;
		
	case 147: /* STATE 300 */
		;
		XX = 1;
		unrecv(now.place_CDataIn, XX-1, 0, ((P0 *)this)->CDataIn.CDataIn_field1, 1);
		unrecv(now.place_CDataIn, XX-1, 1, ((P0 *)this)->CDataIn.CDataIn_field2, 0);
		((P0 *)this)->CDataIn.CDataIn_field1 = trpt->bup.ovals[0];
		((P0 *)this)->CDataIn.CDataIn_field2 = trpt->bup.ovals[1];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 148: /* STATE 302 */
		;
		((P0 *)this)->Conn3_is_enabled = trpt->bup.oval;
		;
		goto R999;

	case 149: /* STATE 304 */
		;
		_m = unsend(now.place_CDataIn);
		;
		goto R999;

	case 150: /* STATE 309 */
		;
	/* 0 */	((P0 *)this)->Conn3_is_enabled = trpt->bup.oval;
		;
		;
		goto R999;

	case 151: /* STATE 311 */
		;
		((P0 *)this)->DataIn.DataIn_field2 = trpt->bup.ovals[1];
		((P0 *)this)->DataIn.DataIn_field1 = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 152: /* STATE 313 */
		;
		((P0 *)this)->Conn3_is_enabled = trpt->bup.oval;
		_m = unsend(now.place_DataIn);
		;
		goto R999;
;
		
	case 153: /* STATE 319 */
		goto R999;
;
		
	case 154: /* STATE 317 */
		goto R999;
;
		;
		
	case 156: /* STATE 323 */
		;
		XX = 1;
		unrecv(now.place_DataOut, XX-1, 0, ((P0 *)this)->DataOut.DataOut_field1, 1);
		unrecv(now.place_DataOut, XX-1, 1, ((P0 *)this)->DataOut.DataOut_field2, 0);
		((P0 *)this)->DataOut.DataOut_field1 = trpt->bup.ovals[0];
		((P0 *)this)->DataOut.DataOut_field2 = trpt->bup.ovals[1];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 157: /* STATE 325 */
		;
		((P0 *)this)->Conn2_is_enabled = trpt->bup.oval;
		;
		goto R999;

	case 158: /* STATE 327 */
		;
		_m = unsend(now.place_DataOut);
		;
		goto R999;

	case 159: /* STATE 332 */
		;
	/* 0 */	((P0 *)this)->Conn2_is_enabled = trpt->bup.oval;
		;
		;
		goto R999;

	case 160: /* STATE 334 */
		;
		((P0 *)this)->CDataOut.CDataOut_field2 = trpt->bup.ovals[1];
		((P0 *)this)->CDataOut.CDataOut_field1 = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 161: /* STATE 336 */
		;
		((P0 *)this)->Conn2_is_enabled = trpt->bup.oval;
		_m = unsend(now.place_CDataOut);
		;
		goto R999;
;
		
	case 162: /* STATE 342 */
		goto R999;
;
		
	case 163: /* STATE 340 */
		goto R999;

	case 164: /* STATE 348 */
		;
		p_restor(II);
		;
		;
		goto R999;
	}

