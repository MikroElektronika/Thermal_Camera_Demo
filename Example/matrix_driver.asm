matrix_driver_hal_gpio_rstSet:
;matrix_driver.c,29 :: 		static void hal_gpio_rstSet(uint8_t state)
; state start address is: 0 (R0)
SUB	SP, SP, #4
; state end address is: 0 (R0)
; state start address is: 0 (R0)
;matrix_driver.c,31 :: 		GPIOE_ODR.B12 = state;
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
_SX	[R1, ByteOffset(GPIOE_ODR+0)]
; state end address is: 0 (R0)
;matrix_driver.c,32 :: 		}
L_end_hal_gpio_rstSet:
ADD	SP, SP, #4
BX	LR
; end of matrix_driver_hal_gpio_rstSet
matrix_driver_hal_gpio_csSet:
;matrix_driver.c,34 :: 		static void hal_gpio_csSet(uint8_t state)
; state start address is: 0 (R0)
SUB	SP, SP, #4
; state end address is: 0 (R0)
; state start address is: 0 (R0)
;matrix_driver.c,36 :: 		GPIOB_ODR.B2  = state;
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
; state end address is: 0 (R0)
;matrix_driver.c,37 :: 		}
L_end_hal_gpio_csSet:
ADD	SP, SP, #4
BX	LR
; end of matrix_driver_hal_gpio_csSet
matrix_driver_hal_gpio_intGet:
;matrix_driver.c,39 :: 		static uint8_t hal_gpio_intGet()
SUB	SP, SP, #4
;matrix_driver.c,41 :: 		return GPIOD_IDR.B4;
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
_LX	[R0, ByteOffset(GPIOD_IDR+0)]
;matrix_driver.c,42 :: 		}
L_end_hal_gpio_intGet:
ADD	SP, SP, #4
BX	LR
; end of matrix_driver_hal_gpio_intGet
matrix_driver_hal_spiWrite:
;matrix_driver.c,44 :: 		static void hal_spiWrite(uint8_t *pBuf, uint16_t nBytes)
; nBytes start address is: 4 (R1)
; pBuf start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; nBytes end address is: 4 (R1)
; pBuf end address is: 0 (R0)
; pBuf start address is: 0 (R0)
; nBytes start address is: 4 (R1)
;matrix_driver.c,46 :: 		uint8_t *ptr = pBuf;
; ptr start address is: 20 (R5)
MOV	R5, R0
; pBuf end address is: 0 (R0)
; nBytes end address is: 4 (R1)
; ptr end address is: 20 (R5)
UXTH	R0, R1
;matrix_driver.c,47 :: 		while( nBytes-- )
L_matrix_driver_hal_spiWrite0:
; ptr start address is: 20 (R5)
; nBytes start address is: 16 (R4)
; nBytes start address is: 0 (R0)
UXTH	R3, R0
SUBS	R2, R0, #1
; nBytes end address is: 0 (R0)
; nBytes start address is: 16 (R4)
UXTH	R4, R2
; nBytes end address is: 16 (R4)
CMP	R3, #0
IT	EQ
BEQ	L_matrix_driver_hal_spiWrite1
; nBytes end address is: 16 (R4)
;matrix_driver.c,48 :: 		SPI1_Write( *( ptr++ ) );
; nBytes start address is: 16 (R4)
LDRB	R2, [R5, #0]
UXTH	R0, R2
BL	_SPI1_Write+0
ADDS	R5, R5, #1
UXTH	R0, R4
; nBytes end address is: 16 (R4)
; ptr end address is: 20 (R5)
IT	AL
BAL	L_matrix_driver_hal_spiWrite0
L_matrix_driver_hal_spiWrite1:
;matrix_driver.c,49 :: 		}
L_end_hal_spiWrite:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of matrix_driver_hal_spiWrite
matrix_driver__spi_cmd:
;matrix_driver.c,52 :: 		static void _spi_cmd( const uint8_t cmd, uint8_t arg )
; arg start address is: 4 (R1)
; cmd start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; arg end address is: 4 (R1)
; cmd end address is: 0 (R0)
; cmd start address is: 0 (R0)
; arg start address is: 4 (R1)
;matrix_driver.c,56 :: 		tmp[0] = cmd;
ADD	R2, SP, #4
STRB	R0, [R2, #0]
; cmd end address is: 0 (R0)
;matrix_driver.c,57 :: 		tmp[1] = arg;
ADDS	R2, R2, #1
STRB	R1, [R2, #0]
; arg end address is: 4 (R1)
;matrix_driver.c,60 :: 		hal_gpio_csSet( 0 );
MOVS	R0, #0
BL	matrix_driver_hal_gpio_csSet+0
;matrix_driver.c,61 :: 		hal_spiWrite( tmp, 2 );
ADD	R2, SP, #4
MOVS	R1, #2
MOV	R0, R2
BL	matrix_driver_hal_spiWrite+0
;matrix_driver.c,62 :: 		hal_gpio_csSet( 1 );
MOVS	R0, #1
BL	matrix_driver_hal_gpio_csSet+0
;matrix_driver.c,63 :: 		Delay_1ms();
BL	_Delay_1ms+0
;matrix_driver.c,64 :: 		}
L_end__spi_cmd:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of matrix_driver__spi_cmd
matrix_driver__char_wr:
;matrix_driver.c,67 :: 		static void _char_wr( uint16_t ch )
; ch start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
UXTH	R2, R0
; ch end address is: 0 (R0)
; ch start address is: 8 (R2)
;matrix_driver.c,69 :: 		uint8_t     ch_width = 0;
;matrix_driver.c,72 :: 		uint16_t    x = 0;
; x start address is: 0 (R0)
MOVW	R0, #0
;matrix_driver.c,73 :: 		uint16_t    y = 0;
;matrix_driver.c,75 :: 		uint8_t     temp = 0;
; temp start address is: 20 (R5)
MOVS	R5, #0
;matrix_driver.c,76 :: 		uint8_t     mask = 0;
;matrix_driver.c,81 :: 		if (ch < _font_first_char)
MOVW	R1, #lo_addr(matrix_driver__font_first_char+0)
MOVT	R1, #hi_addr(matrix_driver__font_first_char+0)
LDRH	R1, [R1, #0]
CMP	R2, R1
IT	CS
BCS	L_matrix_driver__char_wr2
; ch end address is: 8 (R2)
; temp end address is: 20 (R5)
; x end address is: 0 (R0)
;matrix_driver.c,83 :: 		return;
IT	AL
BAL	L_end__char_wr
;matrix_driver.c,84 :: 		}
L_matrix_driver__char_wr2:
;matrix_driver.c,86 :: 		if (ch > _font_last_char)
; x start address is: 0 (R0)
; temp start address is: 20 (R5)
; ch start address is: 8 (R2)
MOVW	R1, #lo_addr(matrix_driver__font_last_char+0)
MOVT	R1, #hi_addr(matrix_driver__font_last_char+0)
LDRH	R1, [R1, #0]
CMP	R2, R1
IT	LS
BLS	L_matrix_driver__char_wr3
; ch end address is: 8 (R2)
; temp end address is: 20 (R5)
; x end address is: 0 (R0)
;matrix_driver.c,88 :: 		return;
IT	AL
BAL	L_end__char_wr
;matrix_driver.c,89 :: 		}
L_matrix_driver__char_wr3:
;matrix_driver.c,92 :: 		tmp = (ch - _font_first_char) << 2;
; x start address is: 0 (R0)
; temp start address is: 20 (R5)
; ch start address is: 8 (R2)
MOVW	R1, #lo_addr(matrix_driver__font_first_char+0)
MOVT	R1, #hi_addr(matrix_driver__font_first_char+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
; ch end address is: 8 (R2)
LSLS	R2, R1, #2
UXTH	R2, R2
;matrix_driver.c,93 :: 		ch_table = _font + 8 + tmp;
MOVW	R4, #lo_addr(matrix_driver__font+0)
MOVT	R4, #hi_addr(matrix_driver__font+0)
LDR	R1, [R4, #0]
ADDS	R1, #8
ADDS	R3, R1, R2
;matrix_driver.c,94 :: 		ch_width = *ch_table;
LDRB	R6, [R3, #0]
; ch_width start address is: 24 (R6)
;matrix_driver.c,96 :: 		offset = (uint32_t)ch_table[1] + ((uint32_t)ch_table[2] << 8) + ((uint32_t)ch_table[3] << 16);
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDS	R1, R3, #2
LDRB	R1, [R1, #0]
LSLS	R1, R1, #8
ADDS	R2, R2, R1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
LSLS	R1, R1, #16
ADDS	R2, R2, R1
;matrix_driver.c,97 :: 		ch_bitmap = _font + offset;
MOV	R1, R4
LDR	R1, [R1, #0]
ADDS	R2, R1, R2
; ch_bitmap start address is: 8 (R2)
;matrix_driver.c,99 :: 		if ((_font_orientation == _MATRIXRGB_FONT_HORIZONTAL) || (_font_orientation == _MATRIXRGB_FONT_VERTICAL_COLUMN))
MOVW	R1, #lo_addr(matrix_driver__font_orientation+0)
MOVT	R1, #hi_addr(matrix_driver__font_orientation+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_matrix_driver__char_wr68
MOVW	R1, #lo_addr(matrix_driver__font_orientation+0)
MOVT	R1, #hi_addr(matrix_driver__font_orientation+0)
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	EQ
BEQ	L_matrix_driver__char_wr67
IT	AL
BAL	L_matrix_driver__char_wr6
L_matrix_driver__char_wr68:
L_matrix_driver__char_wr67:
;matrix_driver.c,101 :: 		y = _font_y_cord;
MOVW	R1, #lo_addr(matrix_driver__font_y_cord+0)
MOVT	R1, #hi_addr(matrix_driver__font_y_cord+0)
; y start address is: 36 (R9)
LDRH	R9, [R1, #0]
;matrix_driver.c,103 :: 		for (y_cnt = 0; y_cnt < _font_height; y_cnt++)
; y_cnt start address is: 32 (R8)
MOVW	R8, #0
; temp end address is: 20 (R5)
; x end address is: 0 (R0)
; ch_width end address is: 24 (R6)
; ch_bitmap end address is: 8 (R2)
; y end address is: 36 (R9)
; y_cnt end address is: 32 (R8)
UXTH	R3, R0
UXTB	R0, R5
L_matrix_driver__char_wr7:
; y_cnt start address is: 32 (R8)
; y start address is: 36 (R9)
; ch_bitmap start address is: 8 (R2)
; ch_width start address is: 24 (R6)
; temp start address is: 0 (R0)
; x start address is: 12 (R3)
MOVW	R1, #lo_addr(matrix_driver__font_height+0)
MOVT	R1, #hi_addr(matrix_driver__font_height+0)
LDRH	R1, [R1, #0]
CMP	R8, R1
IT	CS
BCS	L_matrix_driver__char_wr8
; x end address is: 12 (R3)
;matrix_driver.c,105 :: 		x = _font_x_cord;
MOVW	R1, #lo_addr(matrix_driver__font_x_cord+0)
MOVT	R1, #hi_addr(matrix_driver__font_x_cord+0)
; x start address is: 44 (R11)
LDRH	R11, [R1, #0]
;matrix_driver.c,106 :: 		mask = 0;
; mask start address is: 48 (R12)
MOVW	R12, #0
;matrix_driver.c,107 :: 		for (x_cnt = 0; x_cnt < ch_width; x_cnt++)
; x_cnt start address is: 40 (R10)
MOVW	R10, #0
; ch_width end address is: 24 (R6)
; ch_bitmap end address is: 8 (R2)
; temp end address is: 0 (R0)
; x end address is: 44 (R11)
; mask end address is: 48 (R12)
; x_cnt end address is: 40 (R10)
; y end address is: 36 (R9)
; y_cnt end address is: 32 (R8)
L_matrix_driver__char_wr10:
; x_cnt start address is: 40 (R10)
; mask start address is: 48 (R12)
; x start address is: 44 (R11)
; temp start address is: 0 (R0)
; ch_width start address is: 24 (R6)
; ch_bitmap start address is: 8 (R2)
; y start address is: 36 (R9)
; y_cnt start address is: 32 (R8)
CMP	R10, R6
IT	CS
BCS	L_matrix_driver__char_wr11
;matrix_driver.c,109 :: 		if (!mask)
CMP	R12, #0
IT	NE
BNE	L_matrix_driver__char_wr69
; temp end address is: 0 (R0)
; mask end address is: 48 (R12)
;matrix_driver.c,111 :: 		temp = *ch_bitmap++;
LDRB	R0, [R2, #0]
; temp start address is: 0 (R0)
ADDS	R2, R2, #1
;matrix_driver.c,112 :: 		mask = 0x01;
; mask start address is: 48 (R12)
MOVW	R12, #1
; ch_bitmap end address is: 8 (R2)
; temp end address is: 0 (R0)
; mask end address is: 48 (R12)
;matrix_driver.c,113 :: 		}
IT	AL
BAL	L_matrix_driver__char_wr13
L_matrix_driver__char_wr69:
;matrix_driver.c,109 :: 		if (!mask)
;matrix_driver.c,113 :: 		}
L_matrix_driver__char_wr13:
;matrix_driver.c,115 :: 		if (temp & mask)
; mask start address is: 48 (R12)
; ch_bitmap start address is: 8 (R2)
; temp start address is: 0 (R0)
AND	R1, R0, R12, LSL #0
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_matrix_driver__char_wr14
;matrix_driver.c,117 :: 		matrixrgb_writePixel( x, y, _font_color );
MOVW	R1, #lo_addr(matrix_driver__font_color+0)
MOVT	R1, #hi_addr(matrix_driver__font_color+0)
LDRH	R1, [R1, #0]
STRB	R0, [SP, #4]
STR	R2, [SP, #8]
UXTH	R2, R1
UXTH	R1, R9
UXTH	R0, R11
BL	_matrixrgb_writePixel+0
LDR	R2, [SP, #8]
LDRB	R0, [SP, #4]
;matrix_driver.c,118 :: 		Delay_80us();
BL	_Delay_80us+0
;matrix_driver.c,119 :: 		}
L_matrix_driver__char_wr14:
;matrix_driver.c,121 :: 		x++;
ADD	R11, R11, #1
UXTH	R11, R11
;matrix_driver.c,122 :: 		mask <<= 1;
LSL	R1, R12, #1
UXTB	R12, R1
;matrix_driver.c,107 :: 		for (x_cnt = 0; x_cnt < ch_width; x_cnt++)
ADD	R10, R10, #1
UXTB	R10, R10
;matrix_driver.c,123 :: 		}
; mask end address is: 48 (R12)
; x_cnt end address is: 40 (R10)
IT	AL
BAL	L_matrix_driver__char_wr10
L_matrix_driver__char_wr11:
;matrix_driver.c,124 :: 		y++;
ADD	R9, R9, #1
UXTH	R9, R9
;matrix_driver.c,103 :: 		for (y_cnt = 0; y_cnt < _font_height; y_cnt++)
ADD	R8, R8, #1
UXTB	R8, R8
;matrix_driver.c,125 :: 		}
UXTH	R3, R11
; ch_width end address is: 24 (R6)
; ch_bitmap end address is: 8 (R2)
; temp end address is: 0 (R0)
; x end address is: 44 (R11)
; y_cnt end address is: 32 (R8)
IT	AL
BAL	L_matrix_driver__char_wr7
L_matrix_driver__char_wr8:
;matrix_driver.c,127 :: 		if (_font_orientation == _MATRIXRGB_FONT_HORIZONTAL)
; x start address is: 12 (R3)
MOVW	R1, #lo_addr(matrix_driver__font_orientation+0)
MOVT	R1, #hi_addr(matrix_driver__font_orientation+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_matrix_driver__char_wr15
; y end address is: 36 (R9)
;matrix_driver.c,129 :: 		_font_x_cord = x + 1;
ADDS	R2, R3, #1
; x end address is: 12 (R3)
MOVW	R1, #lo_addr(matrix_driver__font_x_cord+0)
MOVT	R1, #hi_addr(matrix_driver__font_x_cord+0)
STRH	R2, [R1, #0]
;matrix_driver.c,130 :: 		}
IT	AL
BAL	L_matrix_driver__char_wr16
L_matrix_driver__char_wr15:
;matrix_driver.c,133 :: 		_font_y_cord = y;
; y start address is: 36 (R9)
MOVW	R1, #lo_addr(matrix_driver__font_y_cord+0)
MOVT	R1, #hi_addr(matrix_driver__font_y_cord+0)
STRH	R9, [R1, #0]
; y end address is: 36 (R9)
;matrix_driver.c,134 :: 		}
L_matrix_driver__char_wr16:
;matrix_driver.c,135 :: 		}
IT	AL
BAL	L_matrix_driver__char_wr17
L_matrix_driver__char_wr6:
;matrix_driver.c,138 :: 		y = _font_x_cord;
; ch_bitmap start address is: 8 (R2)
; ch_width start address is: 24 (R6)
; x start address is: 0 (R0)
; temp start address is: 20 (R5)
MOVW	R1, #lo_addr(matrix_driver__font_x_cord+0)
MOVT	R1, #hi_addr(matrix_driver__font_x_cord+0)
; y start address is: 36 (R9)
LDRH	R9, [R1, #0]
;matrix_driver.c,140 :: 		for (y_cnt = 0; y_cnt < _font_height; y_cnt++)
; y_cnt start address is: 32 (R8)
MOVW	R8, #0
; temp end address is: 20 (R5)
; x end address is: 0 (R0)
; ch_width end address is: 24 (R6)
; ch_bitmap end address is: 8 (R2)
; y end address is: 36 (R9)
; y_cnt end address is: 32 (R8)
UXTB	R3, R5
L_matrix_driver__char_wr18:
; y_cnt start address is: 32 (R8)
; y start address is: 36 (R9)
; ch_bitmap start address is: 8 (R2)
; ch_width start address is: 24 (R6)
; temp start address is: 12 (R3)
; x start address is: 0 (R0)
MOVW	R1, #lo_addr(matrix_driver__font_height+0)
MOVT	R1, #hi_addr(matrix_driver__font_height+0)
LDRH	R1, [R1, #0]
CMP	R8, R1
IT	CS
BCS	L_matrix_driver__char_wr19
; x end address is: 0 (R0)
;matrix_driver.c,142 :: 		x = _font_y_cord;
MOVW	R1, #lo_addr(matrix_driver__font_y_cord+0)
MOVT	R1, #hi_addr(matrix_driver__font_y_cord+0)
; x start address is: 44 (R11)
LDRH	R11, [R1, #0]
;matrix_driver.c,143 :: 		mask = 0;
; mask start address is: 48 (R12)
MOVW	R12, #0
;matrix_driver.c,145 :: 		for (x_cnt = 0; x_cnt < ch_width; x_cnt++)
; x_cnt start address is: 40 (R10)
MOVW	R10, #0
; temp end address is: 12 (R3)
; ch_width end address is: 24 (R6)
; ch_bitmap end address is: 8 (R2)
; x end address is: 44 (R11)
; mask end address is: 48 (R12)
; x_cnt end address is: 40 (R10)
; y end address is: 36 (R9)
; y_cnt end address is: 32 (R8)
UXTB	R0, R3
L_matrix_driver__char_wr21:
; x_cnt start address is: 40 (R10)
; mask start address is: 48 (R12)
; x start address is: 44 (R11)
; temp start address is: 0 (R0)
; ch_width start address is: 24 (R6)
; ch_bitmap start address is: 8 (R2)
; y start address is: 36 (R9)
; y_cnt start address is: 32 (R8)
CMP	R10, R6
IT	CS
BCS	L_matrix_driver__char_wr22
;matrix_driver.c,147 :: 		if (mask == 0)
CMP	R12, #0
IT	NE
BNE	L_matrix_driver__char_wr70
; temp end address is: 0 (R0)
; mask end address is: 48 (R12)
;matrix_driver.c,149 :: 		temp = *ch_bitmap++;
LDRB	R0, [R2, #0]
; temp start address is: 0 (R0)
ADDS	R2, R2, #1
;matrix_driver.c,150 :: 		mask = 0x01;
; mask start address is: 48 (R12)
MOVW	R12, #1
; ch_bitmap end address is: 8 (R2)
; temp end address is: 0 (R0)
; mask end address is: 48 (R12)
;matrix_driver.c,151 :: 		}
IT	AL
BAL	L_matrix_driver__char_wr24
L_matrix_driver__char_wr70:
;matrix_driver.c,147 :: 		if (mask == 0)
;matrix_driver.c,151 :: 		}
L_matrix_driver__char_wr24:
;matrix_driver.c,153 :: 		if (temp & mask)
; mask start address is: 48 (R12)
; ch_bitmap start address is: 8 (R2)
; temp start address is: 0 (R0)
AND	R1, R0, R12, LSL #0
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_matrix_driver__char_wr25
;matrix_driver.c,155 :: 		matrixrgb_writePixel( x, y, _font_color );
MOVW	R1, #lo_addr(matrix_driver__font_color+0)
MOVT	R1, #hi_addr(matrix_driver__font_color+0)
LDRH	R1, [R1, #0]
STRB	R0, [SP, #4]
STR	R2, [SP, #8]
UXTH	R2, R1
UXTH	R1, R9
UXTH	R0, R11
BL	_matrixrgb_writePixel+0
LDR	R2, [SP, #8]
LDRB	R0, [SP, #4]
;matrix_driver.c,156 :: 		Delay_80us();
BL	_Delay_80us+0
;matrix_driver.c,157 :: 		}
L_matrix_driver__char_wr25:
;matrix_driver.c,159 :: 		x--;
SUB	R11, R11, #1
UXTH	R11, R11
;matrix_driver.c,160 :: 		mask <<= 1;
LSL	R1, R12, #1
UXTB	R12, R1
;matrix_driver.c,145 :: 		for (x_cnt = 0; x_cnt < ch_width; x_cnt++)
ADD	R10, R10, #1
UXTB	R10, R10
;matrix_driver.c,161 :: 		}
; mask end address is: 48 (R12)
; x_cnt end address is: 40 (R10)
IT	AL
BAL	L_matrix_driver__char_wr21
L_matrix_driver__char_wr22:
;matrix_driver.c,162 :: 		y++;
ADD	R9, R9, #1
UXTH	R9, R9
;matrix_driver.c,140 :: 		for (y_cnt = 0; y_cnt < _font_height; y_cnt++)
ADD	R8, R8, #1
UXTB	R8, R8
;matrix_driver.c,163 :: 		}
UXTB	R3, R0
; ch_width end address is: 24 (R6)
; ch_bitmap end address is: 8 (R2)
; temp end address is: 0 (R0)
; x end address is: 44 (R11)
; y end address is: 36 (R9)
; y_cnt end address is: 32 (R8)
UXTH	R0, R11
IT	AL
BAL	L_matrix_driver__char_wr18
L_matrix_driver__char_wr19:
;matrix_driver.c,164 :: 		_font_y_cord = x - 1;
; x start address is: 0 (R0)
SUBS	R2, R0, #1
; x end address is: 0 (R0)
MOVW	R1, #lo_addr(matrix_driver__font_y_cord+0)
MOVT	R1, #hi_addr(matrix_driver__font_y_cord+0)
STRH	R2, [R1, #0]
;matrix_driver.c,165 :: 		}
L_matrix_driver__char_wr17:
;matrix_driver.c,166 :: 		}
L_end__char_wr:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of matrix_driver__char_wr
_matrixrgb_deviceReset:
;matrix_driver.c,168 :: 		void matrixrgb_deviceReset()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;matrix_driver.c,170 :: 		hal_gpio_rstSet(1);
MOVS	R0, #1
BL	matrix_driver_hal_gpio_rstSet+0
;matrix_driver.c,171 :: 		Delay_100ms();
BL	_Delay_100ms+0
;matrix_driver.c,172 :: 		hal_gpio_rstSet(0);
MOVS	R0, #0
BL	matrix_driver_hal_gpio_rstSet+0
;matrix_driver.c,173 :: 		Delay_100ms();
BL	_Delay_100ms+0
;matrix_driver.c,174 :: 		hal_gpio_rstSet(1);
MOVS	R0, #1
BL	matrix_driver_hal_gpio_rstSet+0
;matrix_driver.c,175 :: 		Delay_100ms();
BL	_Delay_100ms+0
;matrix_driver.c,176 :: 		}
L_end_matrixrgb_deviceReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _matrixrgb_deviceReset
_matrixrgb_deviceInit:
;matrix_driver.c,179 :: 		matrixrgb_deviceInit( const uint8_t pattern_id )
; pattern_id start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; pattern_id end address is: 0 (R0)
; pattern_id start address is: 0 (R0)
;matrix_driver.c,183 :: 		switch (pattern_id)
IT	AL
BAL	L_matrixrgb_deviceInit26
;matrix_driver.c,185 :: 		case 0: case 1:
L_matrixrgb_deviceInit28:
L_matrixrgb_deviceInit29:
;matrix_driver.c,186 :: 		_pix_w = 32;
MOVS	R2, #32
MOVW	R1, #lo_addr(matrix_driver__pix_w+0)
MOVT	R1, #hi_addr(matrix_driver__pix_w+0)
STRH	R2, [R1, #0]
;matrix_driver.c,187 :: 		_pix_h = 32;
MOVS	R2, #32
MOVW	R1, #lo_addr(matrix_driver__pix_h+0)
MOVT	R1, #hi_addr(matrix_driver__pix_h+0)
STRH	R2, [R1, #0]
;matrix_driver.c,188 :: 		_ram_s = 1024;
MOVW	R2, #1024
MOVW	R1, #lo_addr(matrix_driver__ram_s+0)
MOVT	R1, #hi_addr(matrix_driver__ram_s+0)
STRH	R2, [R1, #0]
;matrix_driver.c,189 :: 		break;
IT	AL
BAL	L_matrixrgb_deviceInit27
;matrix_driver.c,190 :: 		case 2: case 3:
L_matrixrgb_deviceInit30:
L_matrixrgb_deviceInit31:
;matrix_driver.c,191 :: 		_pix_w = 64;
MOVS	R2, #64
MOVW	R1, #lo_addr(matrix_driver__pix_w+0)
MOVT	R1, #hi_addr(matrix_driver__pix_w+0)
STRH	R2, [R1, #0]
;matrix_driver.c,192 :: 		_pix_h = 32;
MOVS	R2, #32
MOVW	R1, #lo_addr(matrix_driver__pix_h+0)
MOVT	R1, #hi_addr(matrix_driver__pix_h+0)
STRH	R2, [R1, #0]
;matrix_driver.c,193 :: 		_ram_s = 2048;
MOVW	R2, #2048
MOVW	R1, #lo_addr(matrix_driver__ram_s+0)
MOVT	R1, #hi_addr(matrix_driver__ram_s+0)
STRH	R2, [R1, #0]
;matrix_driver.c,194 :: 		break;
IT	AL
BAL	L_matrixrgb_deviceInit27
;matrix_driver.c,195 :: 		case 4: case 5:
L_matrixrgb_deviceInit32:
L_matrixrgb_deviceInit33:
;matrix_driver.c,196 :: 		_pix_w = 32;
MOVS	R2, #32
MOVW	R1, #lo_addr(matrix_driver__pix_w+0)
MOVT	R1, #hi_addr(matrix_driver__pix_w+0)
STRH	R2, [R1, #0]
;matrix_driver.c,197 :: 		_pix_h = 64;
MOVS	R2, #64
MOVW	R1, #lo_addr(matrix_driver__pix_h+0)
MOVT	R1, #hi_addr(matrix_driver__pix_h+0)
STRH	R2, [R1, #0]
;matrix_driver.c,198 :: 		_ram_s = 2048;
MOVW	R2, #2048
MOVW	R1, #lo_addr(matrix_driver__ram_s+0)
MOVT	R1, #hi_addr(matrix_driver__ram_s+0)
STRH	R2, [R1, #0]
;matrix_driver.c,199 :: 		break;
IT	AL
BAL	L_matrixrgb_deviceInit27
;matrix_driver.c,200 :: 		case 6: case 7:
L_matrixrgb_deviceInit34:
L_matrixrgb_deviceInit35:
;matrix_driver.c,201 :: 		_pix_w = 96;
MOVS	R2, #96
MOVW	R1, #lo_addr(matrix_driver__pix_w+0)
MOVT	R1, #hi_addr(matrix_driver__pix_w+0)
STRH	R2, [R1, #0]
;matrix_driver.c,202 :: 		_pix_h = 32;
MOVS	R2, #32
MOVW	R1, #lo_addr(matrix_driver__pix_h+0)
MOVT	R1, #hi_addr(matrix_driver__pix_h+0)
STRH	R2, [R1, #0]
;matrix_driver.c,203 :: 		_ram_s = 3072;
MOVW	R2, #3072
MOVW	R1, #lo_addr(matrix_driver__ram_s+0)
MOVT	R1, #hi_addr(matrix_driver__ram_s+0)
STRH	R2, [R1, #0]
;matrix_driver.c,204 :: 		break;
IT	AL
BAL	L_matrixrgb_deviceInit27
;matrix_driver.c,205 :: 		case 8: case 9:
L_matrixrgb_deviceInit36:
L_matrixrgb_deviceInit37:
;matrix_driver.c,206 :: 		_pix_w = 32;
MOVS	R2, #32
MOVW	R1, #lo_addr(matrix_driver__pix_w+0)
MOVT	R1, #hi_addr(matrix_driver__pix_w+0)
STRH	R2, [R1, #0]
;matrix_driver.c,207 :: 		_pix_h = 96;
MOVS	R2, #96
MOVW	R1, #lo_addr(matrix_driver__pix_h+0)
MOVT	R1, #hi_addr(matrix_driver__pix_h+0)
STRH	R2, [R1, #0]
;matrix_driver.c,208 :: 		_ram_s = 3072;
MOVW	R2, #3072
MOVW	R1, #lo_addr(matrix_driver__ram_s+0)
MOVT	R1, #hi_addr(matrix_driver__ram_s+0)
STRH	R2, [R1, #0]
;matrix_driver.c,209 :: 		break;
IT	AL
BAL	L_matrixrgb_deviceInit27
;matrix_driver.c,210 :: 		case 10: case 11:
L_matrixrgb_deviceInit38:
L_matrixrgb_deviceInit39:
;matrix_driver.c,211 :: 		_pix_w = 128;
MOVS	R2, #128
MOVW	R1, #lo_addr(matrix_driver__pix_w+0)
MOVT	R1, #hi_addr(matrix_driver__pix_w+0)
STRH	R2, [R1, #0]
;matrix_driver.c,212 :: 		_pix_h = 32;
MOVS	R2, #32
MOVW	R1, #lo_addr(matrix_driver__pix_h+0)
MOVT	R1, #hi_addr(matrix_driver__pix_h+0)
STRH	R2, [R1, #0]
;matrix_driver.c,213 :: 		_ram_s = 4096;
MOVW	R2, #4096
MOVW	R1, #lo_addr(matrix_driver__ram_s+0)
MOVT	R1, #hi_addr(matrix_driver__ram_s+0)
STRH	R2, [R1, #0]
;matrix_driver.c,214 :: 		break;
IT	AL
BAL	L_matrixrgb_deviceInit27
;matrix_driver.c,215 :: 		case 12: case 13:
L_matrixrgb_deviceInit40:
L_matrixrgb_deviceInit41:
;matrix_driver.c,216 :: 		_pix_w = 32;
MOVS	R2, #32
MOVW	R1, #lo_addr(matrix_driver__pix_w+0)
MOVT	R1, #hi_addr(matrix_driver__pix_w+0)
STRH	R2, [R1, #0]
;matrix_driver.c,217 :: 		_pix_h = 128;
MOVS	R2, #128
MOVW	R1, #lo_addr(matrix_driver__pix_h+0)
MOVT	R1, #hi_addr(matrix_driver__pix_h+0)
STRH	R2, [R1, #0]
;matrix_driver.c,218 :: 		_ram_s = 4096;
MOVW	R2, #4096
MOVW	R1, #lo_addr(matrix_driver__ram_s+0)
MOVT	R1, #hi_addr(matrix_driver__ram_s+0)
STRH	R2, [R1, #0]
;matrix_driver.c,219 :: 		break;
IT	AL
BAL	L_matrixrgb_deviceInit27
;matrix_driver.c,220 :: 		case 14: case 15:
L_matrixrgb_deviceInit42:
L_matrixrgb_deviceInit43:
;matrix_driver.c,221 :: 		_pix_w = 64;
MOVS	R2, #64
MOVW	R1, #lo_addr(matrix_driver__pix_w+0)
MOVT	R1, #hi_addr(matrix_driver__pix_w+0)
STRH	R2, [R1, #0]
;matrix_driver.c,222 :: 		_pix_h = 64;
MOVS	R2, #64
MOVW	R1, #lo_addr(matrix_driver__pix_h+0)
MOVT	R1, #hi_addr(matrix_driver__pix_h+0)
STRH	R2, [R1, #0]
;matrix_driver.c,223 :: 		_ram_s = 4096;
MOVW	R2, #4096
MOVW	R1, #lo_addr(matrix_driver__ram_s+0)
MOVT	R1, #hi_addr(matrix_driver__ram_s+0)
STRH	R2, [R1, #0]
;matrix_driver.c,224 :: 		break;
; pattern_id end address is: 0 (R0)
IT	AL
BAL	L_matrixrgb_deviceInit27
;matrix_driver.c,225 :: 		default :
L_matrixrgb_deviceInit44:
;matrix_driver.c,226 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_matrixrgb_deviceInit
;matrix_driver.c,228 :: 		}
L_matrixrgb_deviceInit26:
; pattern_id start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_matrixrgb_deviceInit28
CMP	R0, #1
IT	EQ
BEQ	L_matrixrgb_deviceInit29
CMP	R0, #2
IT	EQ
BEQ	L_matrixrgb_deviceInit30
CMP	R0, #3
IT	EQ
BEQ	L_matrixrgb_deviceInit31
CMP	R0, #4
IT	EQ
BEQ	L_matrixrgb_deviceInit32
CMP	R0, #5
IT	EQ
BEQ	L_matrixrgb_deviceInit33
CMP	R0, #6
IT	EQ
BEQ	L_matrixrgb_deviceInit34
CMP	R0, #7
IT	EQ
BEQ	L_matrixrgb_deviceInit35
CMP	R0, #8
IT	EQ
BEQ	L_matrixrgb_deviceInit36
CMP	R0, #9
IT	EQ
BEQ	L_matrixrgb_deviceInit37
CMP	R0, #10
IT	EQ
BEQ	L_matrixrgb_deviceInit38
CMP	R0, #11
IT	EQ
BEQ	L_matrixrgb_deviceInit39
CMP	R0, #12
IT	EQ
BEQ	L_matrixrgb_deviceInit40
CMP	R0, #13
IT	EQ
BEQ	L_matrixrgb_deviceInit41
CMP	R0, #14
IT	EQ
BEQ	L_matrixrgb_deviceInit42
CMP	R0, #15
IT	EQ
BEQ	L_matrixrgb_deviceInit43
; pattern_id end address is: 0 (R0)
IT	AL
BAL	L_matrixrgb_deviceInit44
L_matrixrgb_deviceInit27:
;matrix_driver.c,231 :: 		_spi_cmd( _MATRIXRGB_CMD_PAN_SETUP, tmp );
; pattern_id start address is: 0 (R0)
UXTB	R1, R0
; pattern_id end address is: 0 (R0)
MOVS	R0, #16
BL	matrix_driver__spi_cmd+0
;matrix_driver.c,233 :: 		return 0;
MOVS	R0, #0
;matrix_driver.c,234 :: 		}
L_end_matrixrgb_deviceInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _matrixrgb_deviceInit
_matrixrgb_setPower:
;matrix_driver.c,236 :: 		void matrixrgb_setPower( uint8_t powerState )
; powerState start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; powerState end address is: 0 (R0)
; powerState start address is: 0 (R0)
;matrix_driver.c,241 :: 		_spi_cmd( _MATRIXRGB_CMD_POWER, tmp );
UXTB	R1, R0
; powerState end address is: 0 (R0)
MOVS	R0, #1
BL	matrix_driver__spi_cmd+0
;matrix_driver.c,242 :: 		}
L_end_matrixrgb_setPower:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _matrixrgb_setPower
_matrixrgb_setBrightness:
;matrix_driver.c,244 :: 		void matrixrgb_setBrightness( uint8_t brightness )
; brightness start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; brightness end address is: 0 (R0)
; brightness start address is: 0 (R0)
;matrix_driver.c,249 :: 		_spi_cmd( _MATRIXRGB_CMD_BRIGHTNESS, tmp );
UXTB	R1, R0
; brightness end address is: 0 (R0)
MOVS	R0, #2
BL	matrix_driver__spi_cmd+0
;matrix_driver.c,250 :: 		}
L_end_matrixrgb_setBrightness:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _matrixrgb_setBrightness
_matrixrgb_writePixel:
;matrix_driver.c,253 :: 		matrixrgb_writePixel( uint16_t x, uint16_t y, uint16_t color )
; color start address is: 8 (R2)
; y start address is: 4 (R1)
; x start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; color end address is: 8 (R2)
; y end address is: 4 (R1)
; x end address is: 0 (R0)
; x start address is: 0 (R0)
; y start address is: 4 (R1)
; color start address is: 8 (R2)
;matrix_driver.c,259 :: 		if (( x >= _pix_w ) || ( y >= _pix_h ))
MOVW	R3, #lo_addr(matrix_driver__pix_w+0)
MOVT	R3, #hi_addr(matrix_driver__pix_w+0)
LDRH	R3, [R3, #0]
CMP	R0, R3
IT	CS
BCS	L__matrixrgb_writePixel65
MOVW	R3, #lo_addr(matrix_driver__pix_h+0)
MOVT	R3, #hi_addr(matrix_driver__pix_h+0)
LDRH	R3, [R3, #0]
CMP	R1, R3
IT	CS
BCS	L__matrixrgb_writePixel64
IT	AL
BAL	L_matrixrgb_writePixel47
; x end address is: 0 (R0)
; y end address is: 4 (R1)
; color end address is: 8 (R2)
L__matrixrgb_writePixel65:
L__matrixrgb_writePixel64:
;matrix_driver.c,261 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_matrixrgb_writePixel
;matrix_driver.c,262 :: 		}
L_matrixrgb_writePixel47:
;matrix_driver.c,264 :: 		cmd = _MATRIXRGB_CMD_LOAD_PIX;
; color start address is: 8 (R2)
; y start address is: 4 (R1)
; x start address is: 0 (R0)
MOVS	R3, #4
STRB	R3, [SP, #4]
;matrix_driver.c,265 :: 		pos = ((y * _pix_w) + x);
MOVW	R3, #lo_addr(matrix_driver__pix_w+0)
MOVT	R3, #hi_addr(matrix_driver__pix_w+0)
LDRH	R3, [R3, #0]
MULS	R3, R1, R3
UXTH	R3, R3
; y end address is: 4 (R1)
ADDS	R3, R3, R0
; x end address is: 0 (R0)
; pos start address is: 0 (R0)
UXTH	R0, R3
;matrix_driver.c,267 :: 		tmp[0] = color;
ADD	R5, SP, #5
STRB	R2, [R5, #0]
;matrix_driver.c,268 :: 		tmp[1] = color >> 8;
ADDS	R4, R5, #1
LSRS	R3, R2, #8
; color end address is: 8 (R2)
STRB	R3, [R4, #0]
;matrix_driver.c,269 :: 		tmp[2] = pos;
ADDS	R3, R5, #2
STRB	R0, [R3, #0]
;matrix_driver.c,270 :: 		tmp[3] = pos >> 8;
ADDS	R4, R5, #3
LSRS	R3, R0, #8
; pos end address is: 0 (R0)
STRB	R3, [R4, #0]
;matrix_driver.c,272 :: 		hal_gpio_csSet( 0 );
MOVS	R0, #0
BL	matrix_driver_hal_gpio_csSet+0
;matrix_driver.c,273 :: 		hal_spiWrite( &cmd, 1 );
ADD	R3, SP, #4
MOVS	R1, #1
MOV	R0, R3
BL	matrix_driver_hal_spiWrite+0
;matrix_driver.c,274 :: 		hal_spiWrite( tmp, 4 );
ADD	R3, SP, #5
MOVS	R1, #4
MOV	R0, R3
BL	matrix_driver_hal_spiWrite+0
;matrix_driver.c,275 :: 		hal_gpio_csSet( 1 );
MOVS	R0, #1
BL	matrix_driver_hal_gpio_csSet+0
;matrix_driver.c,276 :: 		Delay_ms(1);
MOVW	R7, #55998
MOVT	R7, #0
NOP
NOP
L_matrixrgb_writePixel48:
SUBS	R7, R7, #1
BNE	L_matrixrgb_writePixel48
NOP
NOP
NOP
;matrix_driver.c,278 :: 		return 0;
MOVS	R0, #0
;matrix_driver.c,279 :: 		}
L_end_matrixrgb_writePixel:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _matrixrgb_writePixel
_matrixrgb_fillScreen:
;matrix_driver.c,281 :: 		void matrixrgb_fillScreen( uint16_t color )
; color start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; color end address is: 0 (R0)
; color start address is: 0 (R0)
;matrix_driver.c,287 :: 		cmd = _MATRIXRGB_CMD_LOAD_IMG;
MOVS	R1, #3
STRB	R1, [SP, #4]
;matrix_driver.c,288 :: 		tmp[0] = color;
ADD	R1, SP, #5
STRB	R0, [R1, #0]
;matrix_driver.c,289 :: 		tmp[1] = color >> 8;
ADDS	R2, R1, #1
LSRS	R1, R0, #8
; color end address is: 0 (R0)
STRB	R1, [R2, #0]
;matrix_driver.c,291 :: 		hal_gpio_csSet( 0 );
MOVS	R0, #0
BL	matrix_driver_hal_gpio_csSet+0
;matrix_driver.c,292 :: 		hal_spiWrite( &cmd, 1 );
ADD	R1, SP, #4
MOV	R0, R1
MOVS	R1, #1
BL	matrix_driver_hal_spiWrite+0
;matrix_driver.c,294 :: 		for (pos = 0; pos < _ram_s; pos++)
; pos start address is: 24 (R6)
MOVS	R6, #0
; pos end address is: 24 (R6)
L_matrixrgb_fillScreen50:
; pos start address is: 24 (R6)
MOVW	R1, #lo_addr(matrix_driver__ram_s+0)
MOVT	R1, #hi_addr(matrix_driver__ram_s+0)
LDRH	R1, [R1, #0]
CMP	R6, R1
IT	CS
BCS	L_matrixrgb_fillScreen51
;matrix_driver.c,296 :: 		hal_spiWrite( tmp, 2 );
ADD	R1, SP, #5
MOV	R0, R1
MOVS	R1, #2
BL	matrix_driver_hal_spiWrite+0
;matrix_driver.c,297 :: 		Delay_1ms();
BL	_Delay_1ms+0
;matrix_driver.c,294 :: 		for (pos = 0; pos < _ram_s; pos++)
ADDS	R6, R6, #1
UXTH	R6, R6
;matrix_driver.c,298 :: 		}
; pos end address is: 24 (R6)
IT	AL
BAL	L_matrixrgb_fillScreen50
L_matrixrgb_fillScreen51:
;matrix_driver.c,300 :: 		hal_gpio_csSet( 1 );
MOVS	R0, #1
BL	matrix_driver_hal_gpio_csSet+0
;matrix_driver.c,301 :: 		Delay_1ms();
BL	_Delay_1ms+0
;matrix_driver.c,302 :: 		}
L_end_matrixrgb_fillScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _matrixrgb_fillScreen
_matrixrgb_drawImage:
;matrix_driver.c,304 :: 		void matrixrgb_drawImage( const uint8_t *img )
; img start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOV	R6, R0
; img end address is: 0 (R0)
; img start address is: 24 (R6)
;matrix_driver.c,310 :: 		cmd = _MATRIXRGB_CMD_LOAD_IMG;
MOVS	R1, #3
STRB	R1, [SP, #8]
;matrix_driver.c,313 :: 		hal_gpio_csSet( 0 );
MOVS	R0, #0
BL	matrix_driver_hal_gpio_csSet+0
;matrix_driver.c,314 :: 		hal_spiWrite( &cmd, 1 );
ADD	R1, SP, #8
MOV	R0, R1
MOVS	R1, #1
BL	matrix_driver_hal_spiWrite+0
;matrix_driver.c,316 :: 		for (pos = 0; pos < _ram_s; pos++)
; pos start address is: 28 (R7)
MOVS	R7, #0
; pos end address is: 28 (R7)
L_matrixrgb_drawImage53:
; pos start address is: 28 (R7)
; img start address is: 24 (R6)
; img end address is: 24 (R6)
MOVW	R1, #lo_addr(matrix_driver__ram_s+0)
MOVT	R1, #hi_addr(matrix_driver__ram_s+0)
LDRH	R1, [R1, #0]
CMP	R7, R1
IT	CS
BCS	L_matrixrgb_drawImage54
; img end address is: 24 (R6)
;matrix_driver.c,318 :: 		tmp[ 0 ] = img[ pos * 2 ];
; img start address is: 24 (R6)
ADD	R3, SP, #9
LSLS	R1, R7, #1
UXTH	R1, R1
ADDS	R1, R6, R1
LDRB	R1, [R1, #0]
STRB	R1, [R3, #0]
;matrix_driver.c,319 :: 		tmp[ 1 ] = img[ pos * 2 + 1 ];
ADDS	R2, R3, #1
LSLS	R1, R7, #1
UXTH	R1, R1
ADDS	R1, R1, #1
UXTH	R1, R1
ADDS	R1, R6, R1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;matrix_driver.c,320 :: 		hal_spiWrite( tmp, 2 );
MOVS	R1, #2
MOV	R0, R3
BL	matrix_driver_hal_spiWrite+0
;matrix_driver.c,321 :: 		Delay_us(100);
STRH	R7, [SP, #4]
MOVW	R7, #5598
MOVT	R7, #0
NOP
NOP
L_matrixrgb_drawImage56:
SUBS	R7, R7, #1
BNE	L_matrixrgb_drawImage56
NOP
NOP
NOP
LDRH	R7, [SP, #4]
;matrix_driver.c,316 :: 		for (pos = 0; pos < _ram_s; pos++)
ADDS	R7, R7, #1
UXTH	R7, R7
;matrix_driver.c,322 :: 		}
; img end address is: 24 (R6)
; pos end address is: 28 (R7)
IT	AL
BAL	L_matrixrgb_drawImage53
L_matrixrgb_drawImage54:
;matrix_driver.c,324 :: 		hal_gpio_csSet( 1 );
MOVS	R0, #1
BL	matrix_driver_hal_gpio_csSet+0
;matrix_driver.c,325 :: 		Delay_1ms();
BL	_Delay_1ms+0
;matrix_driver.c,326 :: 		}
L_end_matrixrgb_drawImage:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _matrixrgb_drawImage
_matrixrgb_setFont:
;matrix_driver.c,328 :: 		void matrixrgb_setFont( uint8_t *font, uint16_t color, uint8_t orientation )
; orientation start address is: 8 (R2)
; color start address is: 4 (R1)
; font start address is: 0 (R0)
SUB	SP, SP, #4
; orientation end address is: 8 (R2)
; color end address is: 4 (R1)
; font end address is: 0 (R0)
; font start address is: 0 (R0)
; color start address is: 4 (R1)
; orientation start address is: 8 (R2)
;matrix_driver.c,330 :: 		_font               = font;
MOVW	R3, #lo_addr(matrix_driver__font+0)
MOVT	R3, #hi_addr(matrix_driver__font+0)
STR	R0, [R3, #0]
;matrix_driver.c,331 :: 		_font_first_char    = font[2] + (font[3] << 8);
ADDS	R3, R0, #2
LDRB	R4, [R3, #0]
ADDS	R3, R0, #3
LDRB	R3, [R3, #0]
LSLS	R3, R3, #8
UXTH	R3, R3
ADDS	R4, R4, R3
MOVW	R3, #lo_addr(matrix_driver__font_first_char+0)
MOVT	R3, #hi_addr(matrix_driver__font_first_char+0)
STRH	R4, [R3, #0]
;matrix_driver.c,332 :: 		_font_last_char     = font[4] + (font[5] << 8);
ADDS	R3, R0, #4
LDRB	R4, [R3, #0]
ADDS	R3, R0, #5
LDRB	R3, [R3, #0]
LSLS	R3, R3, #8
UXTH	R3, R3
ADDS	R4, R4, R3
MOVW	R3, #lo_addr(matrix_driver__font_last_char+0)
MOVT	R3, #hi_addr(matrix_driver__font_last_char+0)
STRH	R4, [R3, #0]
;matrix_driver.c,333 :: 		_font_height        = font[6];
ADDS	R3, R0, #6
; font end address is: 0 (R0)
LDRB	R4, [R3, #0]
MOVW	R3, #lo_addr(matrix_driver__font_height+0)
MOVT	R3, #hi_addr(matrix_driver__font_height+0)
STRH	R4, [R3, #0]
;matrix_driver.c,334 :: 		_font_color         = color;
MOVW	R3, #lo_addr(matrix_driver__font_color+0)
MOVT	R3, #hi_addr(matrix_driver__font_color+0)
STRH	R1, [R3, #0]
; color end address is: 4 (R1)
;matrix_driver.c,335 :: 		_font_orientation   = orientation ;
MOVW	R3, #lo_addr(matrix_driver__font_orientation+0)
MOVT	R3, #hi_addr(matrix_driver__font_orientation+0)
STRB	R2, [R3, #0]
; orientation end address is: 8 (R2)
;matrix_driver.c,336 :: 		}
L_end_matrixrgb_setFont:
ADD	SP, SP, #4
BX	LR
; end of _matrixrgb_setFont
_matrixrgb_writeText:
;matrix_driver.c,339 :: 		matrixrgb_writeText( char *text, uint16_t x, uint16_t y )
; y start address is: 8 (R2)
; x start address is: 4 (R1)
; text start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; y end address is: 8 (R2)
; x end address is: 4 (R1)
; text end address is: 0 (R0)
; text start address is: 0 (R0)
; x start address is: 4 (R1)
; y start address is: 8 (R2)
;matrix_driver.c,343 :: 		if (( x >= _pix_w ) || ( y >= _pix_h ))
MOVW	R3, #lo_addr(matrix_driver__pix_w+0)
MOVT	R3, #hi_addr(matrix_driver__pix_w+0)
LDRH	R3, [R3, #0]
CMP	R1, R3
IT	CS
BCS	L__matrixrgb_writeText73
MOVW	R3, #lo_addr(matrix_driver__pix_h+0)
MOVT	R3, #hi_addr(matrix_driver__pix_h+0)
LDRH	R3, [R3, #0]
CMP	R2, R3
IT	CS
BCS	L__matrixrgb_writeText72
IT	AL
BAL	L_matrixrgb_writeText60
; x end address is: 4 (R1)
; y end address is: 8 (R2)
; text end address is: 0 (R0)
L__matrixrgb_writeText73:
L__matrixrgb_writeText72:
;matrix_driver.c,345 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_matrixrgb_writeText
;matrix_driver.c,346 :: 		}
L_matrixrgb_writeText60:
;matrix_driver.c,348 :: 		i = 0;
; text start address is: 0 (R0)
; i start address is: 16 (R4)
; y start address is: 8 (R2)
; x start address is: 4 (R1)
MOVS	R4, #0
;matrix_driver.c,350 :: 		_font_x_cord = x;
MOVW	R3, #lo_addr(matrix_driver__font_x_cord+0)
MOVT	R3, #hi_addr(matrix_driver__font_x_cord+0)
STRH	R1, [R3, #0]
; x end address is: 4 (R1)
;matrix_driver.c,351 :: 		_font_y_cord = y;
MOVW	R3, #lo_addr(matrix_driver__font_y_cord+0)
MOVT	R3, #hi_addr(matrix_driver__font_y_cord+0)
STRH	R2, [R3, #0]
; y end address is: 8 (R2)
; i end address is: 16 (R4)
; text end address is: 0 (R0)
UXTH	R1, R4
;matrix_driver.c,353 :: 		while( text[i] )
L_matrixrgb_writeText61:
; i start address is: 4 (R1)
; text start address is: 0 (R0)
ADDS	R3, R0, R1
LDRB	R3, [R3, #0]
CMP	R3, #0
IT	EQ
BEQ	L_matrixrgb_writeText62
;matrix_driver.c,355 :: 		_char_wr( text[i] );
ADDS	R3, R0, R1
LDRB	R3, [R3, #0]
STR	R0, [SP, #4]
STRH	R1, [SP, #8]
UXTH	R0, R3
BL	matrix_driver__char_wr+0
LDRH	R1, [SP, #8]
LDR	R0, [SP, #4]
;matrix_driver.c,356 :: 		i++;
ADDS	R1, R1, #1
UXTH	R1, R1
;matrix_driver.c,357 :: 		}
; text end address is: 0 (R0)
; i end address is: 4 (R1)
IT	AL
BAL	L_matrixrgb_writeText61
L_matrixrgb_writeText62:
;matrix_driver.c,359 :: 		return 0;
MOVS	R0, #0
;matrix_driver.c,360 :: 		}
L_end_matrixrgb_writeText:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _matrixrgb_writeText
