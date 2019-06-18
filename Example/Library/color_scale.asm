color_scale__get_range:
;color_scale.c,21 :: 		static uint8_t _get_range( float val )
; val start address is: 0 (R0)
VMOV.F32	S1, S0
; val end address is: 0 (R0)
; val start address is: 4 (R1)
;color_scale.c,23 :: 		if (val <= _abs_min)
MOVW	R1, #lo_addr(color_scale__abs_min+0)
MOVT	R1, #hi_addr(color_scale__abs_min+0)
VLDR	#1, S0, [R1, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	GT
BGT	L_color_scale__get_range0
; val end address is: 4 (R1)
;color_scale.c,24 :: 		return RANGE_ABS_MIN;
MOVS	R0, #0
IT	AL
BAL	L_end__get_range
L_color_scale__get_range0:
;color_scale.c,25 :: 		if (val <= _low_center)
; val start address is: 4 (R1)
MOVW	R1, #lo_addr(color_scale__low_center+0)
MOVT	R1, #hi_addr(color_scale__low_center+0)
VLDR	#1, S0, [R1, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	GT
BGT	L_color_scale__get_range1
; val end address is: 4 (R1)
;color_scale.c,26 :: 		return RANGE_LOW_CENTER;
MOVS	R0, #1
IT	AL
BAL	L_end__get_range
L_color_scale__get_range1:
;color_scale.c,27 :: 		if (val <= _med_center)
; val start address is: 4 (R1)
MOVW	R1, #lo_addr(color_scale__med_center+0)
MOVT	R1, #hi_addr(color_scale__med_center+0)
VLDR	#1, S0, [R1, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	GT
BGT	L_color_scale__get_range2
; val end address is: 4 (R1)
;color_scale.c,28 :: 		return RANGE_MED_CENTER;
MOVS	R0, #2
IT	AL
BAL	L_end__get_range
L_color_scale__get_range2:
;color_scale.c,29 :: 		if (val <= _hig_center)
; val start address is: 4 (R1)
MOVW	R1, #lo_addr(color_scale__hig_center+0)
MOVT	R1, #hi_addr(color_scale__hig_center+0)
VLDR	#1, S0, [R1, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	GT
BGT	L_color_scale__get_range3
; val end address is: 4 (R1)
;color_scale.c,30 :: 		return RANGE_HIGH_CENTER;
MOVS	R0, #3
IT	AL
BAL	L_end__get_range
L_color_scale__get_range3:
;color_scale.c,32 :: 		return RANGE_ABS_MAX;
MOVS	R0, #4
;color_scale.c,33 :: 		}
L_end__get_range:
BX	LR
; end of color_scale__get_range
_color_scale_init:
;color_scale.c,35 :: 		void color_scale_init(uint8_t Ta)
; Ta start address is: 0 (R0)
; Ta end address is: 0 (R0)
; Ta start address is: 0 (R0)
;color_scale.c,37 :: 		_abs_min    = (Ta + _min_value);   // TA - 4
MOVW	R1, #lo_addr(__min_value+0)
MOVT	R1, #hi_addr(__min_value+0)
LDRSB	R1, [R1, #0]
ADDS	R1, R0, R1
SXTH	R1, R1
VMOV	S0, R1
VCVT.F32	#1, S0, S0
MOVW	R1, #lo_addr(color_scale__abs_min+0)
MOVT	R1, #hi_addr(color_scale__abs_min+0)
VSTR	#1, S0, [R1, #0]
;color_scale.c,38 :: 		_low_center = (Ta + _low_value);   // TA - 2
MOVW	R1, #lo_addr(__low_value+0)
MOVT	R1, #hi_addr(__low_value+0)
LDRSB	R1, [R1, #0]
ADDS	R1, R0, R1
SXTH	R1, R1
VMOV	S0, R1
VCVT.F32	#1, S0, S0
MOVW	R1, #lo_addr(color_scale__low_center+0)
MOVT	R1, #hi_addr(color_scale__low_center+0)
VSTR	#1, S0, [R1, #0]
;color_scale.c,39 :: 		_med_center = (Ta + _med_value);   // TA + 1
MOVW	R1, #lo_addr(__med_value+0)
MOVT	R1, #hi_addr(__med_value+0)
LDRSB	R1, [R1, #0]
ADDS	R1, R0, R1
SXTH	R1, R1
VMOV	S0, R1
VCVT.F32	#1, S0, S0
MOVW	R1, #lo_addr(color_scale__med_center+0)
MOVT	R1, #hi_addr(color_scale__med_center+0)
VSTR	#1, S0, [R1, #0]
;color_scale.c,40 :: 		_hig_center = (Ta + _high_value);  // TA + 2
MOVW	R1, #lo_addr(__high_value+0)
MOVT	R1, #hi_addr(__high_value+0)
LDRSB	R1, [R1, #0]
ADDS	R1, R0, R1
SXTH	R1, R1
VMOV	S0, R1
VCVT.F32	#1, S0, S0
MOVW	R1, #lo_addr(color_scale__hig_center+0)
MOVT	R1, #hi_addr(color_scale__hig_center+0)
VSTR	#1, S0, [R1, #0]
;color_scale.c,41 :: 		_abs_max    = (Ta + _max_value);   // TA + 4
MOVW	R1, #lo_addr(__max_value+0)
MOVT	R1, #hi_addr(__max_value+0)
LDRSB	R1, [R1, #0]
ADDS	R1, R0, R1
SXTH	R1, R1
; Ta end address is: 0 (R0)
VMOV	S0, R1
VCVT.F32	#1, S0, S0
MOVW	R1, #lo_addr(color_scale__abs_max+0)
MOVT	R1, #hi_addr(color_scale__abs_max+0)
VSTR	#1, S0, [R1, #0]
;color_scale.c,42 :: 		}
L_end_color_scale_init:
BX	LR
; end of _color_scale_init
_color_scale_rgb_conversion:
;color_scale.c,44 :: 		uint16_t color_scale_rgb_conversion( float x )
SUB	SP, SP, #8
STR	LR, [SP, #0]
; x start address is: 0 (R0)
; x end address is: 0 (R0)
; x start address is: 0 (R0)
;color_scale.c,49 :: 		range = _get_range(x);
; x end address is: 0 (R0)
BL	color_scale__get_range+0
; range start address is: 0 (R0)
;color_scale.c,51 :: 		switch (range)
IT	AL
BAL	L_color_scale_rgb_conversion4
; range end address is: 0 (R0)
;color_scale.c,53 :: 		case RANGE_ABS_MIN:
L_color_scale_rgb_conversion6:
;color_scale.c,55 :: 		col = _COLOR_BLUE;
MOVW	R1, #4379
STRH	R1, [SP, #4]
;color_scale.c,56 :: 		break;
IT	AL
BAL	L_color_scale_rgb_conversion5
;color_scale.c,58 :: 		case RANGE_LOW_CENTER:
L_color_scale_rgb_conversion7:
;color_scale.c,60 :: 		col = _COLOR_BLUE_LOW;
MOVW	R1, #5945
STRH	R1, [SP, #4]
;color_scale.c,61 :: 		break;
IT	AL
BAL	L_color_scale_rgb_conversion5
;color_scale.c,63 :: 		case RANGE_MED_CENTER:
L_color_scale_rgb_conversion8:
;color_scale.c,65 :: 		col = _COLOR_GREEN_LOW;
MOVW	R1, #26465
STRH	R1, [SP, #4]
;color_scale.c,66 :: 		break;
IT	AL
BAL	L_color_scale_rgb_conversion5
;color_scale.c,68 :: 		case RANGE_HIGH_CENTER:
L_color_scale_rgb_conversion9:
;color_scale.c,70 :: 		col = _COLOR_YELLOW;
MOVW	R1, #60544
STRH	R1, [SP, #4]
;color_scale.c,71 :: 		break;
IT	AL
BAL	L_color_scale_rgb_conversion5
;color_scale.c,73 :: 		case RANGE_ABS_MAX:
L_color_scale_rgb_conversion10:
;color_scale.c,75 :: 		col = _COLOR_RED;
MOVW	R1, #61696
STRH	R1, [SP, #4]
;color_scale.c,76 :: 		break;
IT	AL
BAL	L_color_scale_rgb_conversion5
;color_scale.c,78 :: 		}
L_color_scale_rgb_conversion4:
; range start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_color_scale_rgb_conversion6
CMP	R0, #1
IT	EQ
BEQ	L_color_scale_rgb_conversion7
CMP	R0, #2
IT	EQ
BEQ	L_color_scale_rgb_conversion8
CMP	R0, #3
IT	EQ
BEQ	L_color_scale_rgb_conversion9
CMP	R0, #4
IT	EQ
BEQ	L_color_scale_rgb_conversion10
; range end address is: 0 (R0)
L_color_scale_rgb_conversion5:
;color_scale.c,79 :: 		return col;
LDRH	R0, [SP, #4]
;color_scale.c,80 :: 		}
L_end_color_scale_rgb_conversion:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _color_scale_rgb_conversion
