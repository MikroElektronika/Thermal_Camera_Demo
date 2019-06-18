ThermalCameraDemo_main_g2c_configTimer:
;demo_timer.h,14 :: 		static void g2c_configTimer()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;demo_timer.h,16 :: 		RCC_APB1ENR.TIM2EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
_SX	[R0, ByteOffset(RCC_APB1ENR+0)]
;demo_timer.h,17 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
_SX	[R0, ByteOffset(TIM2_CR1+0)]
;demo_timer.h,18 :: 		TIM2_PSC = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;demo_timer.h,19 :: 		TIM2_ARR = 55999;
MOVW	R1, #55999
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;demo_timer.h,20 :: 		NVIC_IntEnable(IVT_INT_TIM2);
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;demo_timer.h,21 :: 		TIM2_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
_SX	[R0, ByteOffset(TIM2_DIER+0)]
;demo_timer.h,22 :: 		TIM2_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
_SX	[R0, ByteOffset(TIM2_CR1+0)]
;demo_timer.h,23 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;demo_timer.h,24 :: 		}
L_end_g2c_configTimer:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of ThermalCameraDemo_main_g2c_configTimer
_Timer_interrupt:
;demo_timer.h,26 :: 		void Timer_interrupt() iv IVT_INT_TIM2
SUB	SP, SP, #4
STR	LR, [SP, #0]
;demo_timer.h,28 :: 		g2c_tick();
BL	_g2c_tick+0
;demo_timer.h,29 :: 		taskTime++;
MOVW	R1, #lo_addr(_taskTime+0)
MOVT	R1, #hi_addr(_taskTime+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;demo_timer.h,30 :: 		g2c_process();
BL	_g2c_process+0
;demo_timer.h,31 :: 		TIM2_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
_SX	[R0, ByteOffset(TIM2_SR+0)]
;demo_timer.h,32 :: 		}
L_end_Timer_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer_interrupt
_g2c_default_handler:
;ThermalCameraDemo_main.c,94 :: 		void g2c_default_handler( uint8_t *rsp, uint8_t *evArgs )
;ThermalCameraDemo_main.c,97 :: 		}
L_end_g2c_default_handler:
BX	LR
; end of _g2c_default_handler
_g2c_packCmd:
;ThermalCameraDemo_main.c,99 :: 		void g2c_packCmd(uint8_t *cmd, uint8_t *mid, uint8_t *_end)
; _end start address is: 8 (R2)
; mid start address is: 4 (R1)
; cmd start address is: 0 (R0)
SUB	SP, SP, #116
STR	LR, [SP, #0]
MOV	R8, R0
MOV	R6, R1
MOV	R7, R2
; _end end address is: 8 (R2)
; mid end address is: 4 (R1)
; cmd end address is: 0 (R0)
; cmd start address is: 32 (R8)
; mid start address is: 24 (R6)
; _end start address is: 28 (R7)
;ThermalCameraDemo_main.c,101 :: 		char cmd_param[ 10 ] = "=\"";
ADD	R11, SP, #84
ADD	R10, R11, #30
MOVW	R12, #lo_addr(?ICSg2c_packCmd_cmd_param_L0+0)
MOVT	R12, #hi_addr(?ICSg2c_packCmd_cmd_param_L0+0)
BL	___CC2DW+0
;ThermalCameraDemo_main.c,102 :: 		char mid_param[ 10 ] = "\",\"";
;ThermalCameraDemo_main.c,103 :: 		char end_param[ 10 ] = "\"";
;ThermalCameraDemo_main.c,106 :: 		memset(&tmpBuf[ 0 ], 0, 50);
ADD	R3, SP, #4
MOVS	R2, #50
SXTH	R2, R2
MOVS	R1, #0
MOV	R0, R3
BL	_memset+0
;ThermalCameraDemo_main.c,108 :: 		strcat ( &tmpBuf[ 0 ], cmd );
ADD	R3, SP, #4
MOV	R1, R8
; cmd end address is: 32 (R8)
MOV	R0, R3
BL	_strcat+0
;ThermalCameraDemo_main.c,109 :: 		strcat ( &tmpBuf[ 0 ], &cmd_param[0] );
ADD	R4, SP, #84
ADD	R3, SP, #4
MOV	R1, R4
MOV	R0, R3
BL	_strcat+0
;ThermalCameraDemo_main.c,110 :: 		strcat ( &tmpBuf[ 0 ], mid );
ADD	R3, SP, #4
MOV	R1, R6
; mid end address is: 24 (R6)
MOV	R0, R3
BL	_strcat+0
;ThermalCameraDemo_main.c,111 :: 		strcat ( &tmpBuf[ 0 ], &mid_param[0] );
ADD	R4, SP, #94
ADD	R3, SP, #4
MOV	R1, R4
MOV	R0, R3
BL	_strcat+0
;ThermalCameraDemo_main.c,112 :: 		strcat ( &tmpBuf[ 0 ], _end );
ADD	R3, SP, #4
MOV	R1, R7
; _end end address is: 28 (R7)
MOV	R0, R3
BL	_strcat+0
;ThermalCameraDemo_main.c,113 :: 		strcat ( &tmpBuf[ 0 ], &end_param[0] );
ADD	R4, SP, #104
ADD	R3, SP, #4
MOV	R1, R4
MOV	R0, R3
BL	_strcat+0
;ThermalCameraDemo_main.c,115 :: 		g2c_cmdSingle( &tmpBuf[ 0 ] );
ADD	R3, SP, #4
MOV	R0, R3
BL	_g2c_cmdSingle+0
;ThermalCameraDemo_main.c,116 :: 		}
L_end_g2c_packCmd:
LDR	LR, [SP, #0]
ADD	SP, SP, #116
BX	LR
; end of _g2c_packCmd
_systemInit:
;ThermalCameraDemo_main.c,120 :: 		void systemInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ThermalCameraDemo_main.c,122 :: 		Delay_80us();
BL	_Delay_80us+0
;ThermalCameraDemo_main.c,125 :: 		mikrobus_gpioInit( _MIKROBUS3, _MIKROBUS_INT_PIN, _GPIO_INPUT );
MOVS	R2, #1
MOVS	R1, #7
MOVS	R0, #2
BL	_mikrobus_gpioInit+0
;ThermalCameraDemo_main.c,126 :: 		mikrobus_gpioInit( _MIKROBUS3, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
MOVS	R2, #0
MOVS	R1, #2
MOVS	R0, #2
BL	_mikrobus_gpioInit+0
;ThermalCameraDemo_main.c,127 :: 		mikrobus_gpioInit( _MIKROBUS3, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );
MOVS	R2, #0
MOVS	R1, #1
MOVS	R0, #2
BL	_mikrobus_gpioInit+0
;ThermalCameraDemo_main.c,128 :: 		mikrobus_spiInit( _MIKROBUS3, &_MATRIXRGB_SPI_CFG[0] );
MOVW	R0, #lo_addr(__MATRIXRGB_SPI_CFG+0)
MOVT	R0, #hi_addr(__MATRIXRGB_SPI_CFG+0)
MOV	R1, R0
MOVS	R0, #2
BL	_mikrobus_spiInit+0
;ThermalCameraDemo_main.c,131 :: 		mikrobus_i2cInit( _MIKROBUS2, &_IRGRID2_I2C_CFG[0] );
MOVW	R0, #lo_addr(__IRGRID2_I2C_CFG+0)
MOVT	R0, #hi_addr(__IRGRID2_I2C_CFG+0)
MOV	R1, R0
MOVS	R0, #1
BL	_mikrobus_i2cInit+0
;ThermalCameraDemo_main.c,134 :: 		mikrobus_gpioInit( _MIKROBUS5, _MIKROBUS_INT_PIN, _GPIO_INPUT );
MOVS	R2, #1
MOVS	R1, #7
MOVS	R0, #4
BL	_mikrobus_gpioInit+0
;ThermalCameraDemo_main.c,135 :: 		mikrobus_i2cInit( _MIKROBUS5, &_PROXFUSION2_I2C_CFG[0] );
MOVW	R0, #lo_addr(__PROXFUSION2_I2C_CFG+0)
MOVT	R0, #hi_addr(__PROXFUSION2_I2C_CFG+0)
MOV	R1, R0
MOVS	R0, #4
BL	_mikrobus_i2cInit+0
;ThermalCameraDemo_main.c,136 :: 		Delay_ms( 100 );
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_systemInit0:
SUBS	R7, R7, #1
BNE	L_systemInit0
NOP
NOP
NOP
;ThermalCameraDemo_main.c,139 :: 		mikrobus_gpioInit( _MIKROBUS4, _MIKROBUS_INT_PIN, _GPIO_INPUT );
MOVS	R2, #1
MOVS	R1, #7
MOVS	R0, #3
BL	_mikrobus_gpioInit+0
;ThermalCameraDemo_main.c,140 :: 		mikrobus_gpioInit( _MIKROBUS4, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );
MOVS	R2, #0
MOVS	R1, #1
MOVS	R0, #3
BL	_mikrobus_gpioInit+0
;ThermalCameraDemo_main.c,141 :: 		mikrobus_gpioInit( _MIKROBUS4, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
MOVS	R2, #0
MOVS	R1, #2
MOVS	R0, #3
BL	_mikrobus_gpioInit+0
;ThermalCameraDemo_main.c,142 :: 		mikrobus_uartInit( _MIKROBUS4, &_G2C_UART_CFG[0] );
MOVW	R0, #lo_addr(__G2C_UART_CFG+0)
MOVT	R0, #hi_addr(__G2C_UART_CFG+0)
MOV	R1, R0
MOVS	R0, #3
BL	_mikrobus_uartInit+0
;ThermalCameraDemo_main.c,144 :: 		}
L_end_systemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _systemInit
_applicationInit:
;ThermalCameraDemo_main.c,146 :: 		void applicationInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ThermalCameraDemo_main.c,149 :: 		g2c_configTimer();
BL	ThermalCameraDemo_main_g2c_configTimer+0
;ThermalCameraDemo_main.c,152 :: 		g2c_uartDriverInit((T_G2C_P)&_MIKROBUS4_GPIO, (T_G2C_P)&_MIKROBUS4_UART);
MOVW	R1, #lo_addr(__MIKROBUS4_UART+0)
MOVT	R1, #hi_addr(__MIKROBUS4_UART+0)
MOVW	R0, #lo_addr(__MIKROBUS4_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS4_GPIO+0)
BL	_g2c_uartDriverInit+0
;ThermalCameraDemo_main.c,153 :: 		g2c_coreInit( g2c_default_handler, 1500 );
MOVW	R0, #lo_addr(_g2c_default_handler+0)
MOVT	R0, #hi_addr(_g2c_default_handler+0)
MOVW	R1, #1500
BL	_g2c_coreInit+0
;ThermalCameraDemo_main.c,154 :: 		g2c_modulePower( 0 );
MOVS	R0, #0
BL	_g2c_modulePower+0
;ThermalCameraDemo_main.c,155 :: 		g2c_moduleReset();
BL	_g2c_moduleReset+0
;ThermalCameraDemo_main.c,158 :: 		g2c_cmdSingle( &_ATE[0] );
MOVW	R0, #lo_addr(ThermalCameraDemo_main__ATE+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_main__ATE+0)
BL	_g2c_cmdSingle+0
;ThermalCameraDemo_main.c,159 :: 		g2c_cmdSingle( &_AT[0] );
MOVW	R0, #lo_addr(ThermalCameraDemo_main__AT+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_main__AT+0)
BL	_g2c_cmdSingle+0
;ThermalCameraDemo_main.c,160 :: 		g2c_cmdSingle( &_AT_CEN[0] );
MOVW	R0, #lo_addr(ThermalCameraDemo_main__AT_CEN+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_main__AT_CEN+0)
BL	_g2c_cmdSingle+0
;ThermalCameraDemo_main.c,161 :: 		Delay_ms(1000);
MOVW	R7, #32254
MOVT	R7, #854
NOP
NOP
L_applicationInit2:
SUBS	R7, R7, #1
BNE	L_applicationInit2
NOP
NOP
NOP
;ThermalCameraDemo_main.c,162 :: 		g2c_cmdSingle  ( "AT+NWCR=\"MikroE Public\",\"mikroe.guest\"");
MOVW	R0, #lo_addr(?lstr1_ThermalCameraDemo_main+0)
MOVT	R0, #hi_addr(?lstr1_ThermalCameraDemo_main+0)
BL	_g2c_cmdSingle+0
;ThermalCameraDemo_main.c,163 :: 		Delay_ms(1000);
MOVW	R7, #32254
MOVT	R7, #854
NOP
NOP
L_applicationInit4:
SUBS	R7, R7, #1
BNE	L_applicationInit4
NOP
NOP
NOP
;ThermalCameraDemo_main.c,164 :: 		g2c_cmdSingle( &_AT_NWC[0] );
MOVW	R0, #lo_addr(ThermalCameraDemo_main__AT_NWC+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_main__AT_NWC+0)
BL	_g2c_cmdSingle+0
;ThermalCameraDemo_main.c,165 :: 		Delay_ms(1000);
MOVW	R7, #32254
MOVT	R7, #854
NOP
NOP
L_applicationInit6:
SUBS	R7, R7, #1
BNE	L_applicationInit6
NOP
NOP
NOP
;ThermalCameraDemo_main.c,166 :: 		g2c_cmdSingle ( "AT+BRCR=\"9rms0hfizvktyw5d\",\"45c6e643-2cc2-4257-bbab-cf89db804af6\"" );
MOVW	R0, #lo_addr(?lstr2_ThermalCameraDemo_main+0)
MOVT	R0, #hi_addr(?lstr2_ThermalCameraDemo_main+0)
BL	_g2c_cmdSingle+0
;ThermalCameraDemo_main.c,167 :: 		Delay_ms(1000);
MOVW	R7, #32254
MOVT	R7, #854
NOP
NOP
L_applicationInit8:
SUBS	R7, R7, #1
BNE	L_applicationInit8
NOP
NOP
NOP
;ThermalCameraDemo_main.c,168 :: 		g2c_cmdSingle( &_AT_BRC[0] );
MOVW	R0, #lo_addr(ThermalCameraDemo_main__AT_BRC+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_main__AT_BRC+0)
BL	_g2c_cmdSingle+0
;ThermalCameraDemo_main.c,169 :: 		Delay_ms(1000);
MOVW	R7, #32254
MOVT	R7, #854
NOP
NOP
L_applicationInit10:
SUBS	R7, R7, #1
BNE	L_applicationInit10
NOP
NOP
NOP
;ThermalCameraDemo_main.c,171 :: 		taskTime = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_taskTime+0)
MOVT	R0, #hi_addr(_taskTime+0)
STRH	R1, [R0, #0]
;ThermalCameraDemo_main.c,174 :: 		matrixrgb_spiDriverInit( (T_MATRIXRGB_P)&_MIKROBUS3_GPIO, (T_MATRIXRGB_P)&_MIKROBUS3_SPI );
MOVW	R1, #lo_addr(__MIKROBUS3_SPI+0)
MOVT	R1, #hi_addr(__MIKROBUS3_SPI+0)
MOVW	R0, #lo_addr(__MIKROBUS3_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS3_GPIO+0)
BL	_matrixrgb_spiDriverInit+0
;ThermalCameraDemo_main.c,175 :: 		matrixrgb_deviceReset();
BL	_matrixrgb_deviceReset+0
;ThermalCameraDemo_main.c,177 :: 		matrixrgb_deviceInit( _MATRIXRGB_PATTERN_4S_MAP_6MM );
MOVS	R0, #15
BL	_matrixrgb_deviceInit+0
;ThermalCameraDemo_main.c,178 :: 		matrixrgb_setPower( 1 );
MOVS	R0, #1
BL	_matrixrgb_setPower+0
;ThermalCameraDemo_main.c,179 :: 		Delay_1sec();
BL	_Delay_1sec+0
;ThermalCameraDemo_main.c,181 :: 		matrixrgb_setBrightness( 2 );
MOVS	R0, #2
BL	_matrixrgb_setBrightness+0
;ThermalCameraDemo_main.c,182 :: 		matrixrgb_drawImage(TMP_IMAGE3_bmp);
MOVW	R0, #lo_addr(_TMP_IMAGE3_bmp+0)
MOVT	R0, #hi_addr(_TMP_IMAGE3_bmp+0)
BL	_matrixrgb_drawImage+0
;ThermalCameraDemo_main.c,185 :: 		irgrid2_i2cDriverInit( (T_IRGRID2_P)&_MIKROBUS2_GPIO, (T_IRGRID2_P)&_MIKROBUS2_I2C, 0x33 );
MOVS	R2, #51
MOVW	R1, #lo_addr(__MIKROBUS2_I2C+0)
MOVT	R1, #hi_addr(__MIKROBUS2_I2C+0)
MOVW	R0, #lo_addr(__MIKROBUS2_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS2_GPIO+0)
BL	_irgrid2_i2cDriverInit+0
;ThermalCameraDemo_main.c,187 :: 		irgrid2_readEEPROM(eeMLX90640);
MOVW	R0, #lo_addr(_eeMLX90640+0)
MOVT	R0, #hi_addr(_eeMLX90640+0)
BL	_irgrid2_readEEPROM+0
;ThermalCameraDemo_main.c,188 :: 		irgrid2_ExtractParameters(eeMLX90640, &mlx90640);
MOVW	R1, #lo_addr(_mlx90640+0)
MOVT	R1, #hi_addr(_mlx90640+0)
MOVW	R0, #lo_addr(_eeMLX90640+0)
MOVT	R0, #hi_addr(_eeMLX90640+0)
BL	_irgrid2_ExtractParameters+0
;ThermalCameraDemo_main.c,189 :: 		irgrid2_setRefreshRate( 0x03 ); // 4 Hz
MOVS	R0, #3
BL	_irgrid2_setRefreshRate+0
;ThermalCameraDemo_main.c,192 :: 		proxfusion2_i2cDriverInit( (T_PROXFUSION2_P)&_MIKROBUS5_GPIO, (T_PROXFUSION2_P)&_MIKROBUS5_I2C, 0x44 );
MOVS	R2, #68
MOVW	R1, #lo_addr(__MIKROBUS5_I2C+0)
MOVT	R1, #hi_addr(__MIKROBUS5_I2C+0)
MOVW	R0, #lo_addr(__MIKROBUS5_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS5_GPIO+0)
BL	_proxfusion2_i2cDriverInit+0
;ThermalCameraDemo_main.c,193 :: 		proxfusion2_init();
BL	_proxfusion2_init+0
;ThermalCameraDemo_main.c,194 :: 		proxfusion2_defaultConfig();
BL	_proxfusion2_defaultConfig+0
;ThermalCameraDemo_main.c,195 :: 		Delay_100ms();
BL	_Delay_100ms+0
;ThermalCameraDemo_main.c,197 :: 		Delay_ms( 1000 );
MOVW	R7, #32254
MOVT	R7, #854
NOP
NOP
L_applicationInit12:
SUBS	R7, R7, #1
BNE	L_applicationInit12
NOP
NOP
NOP
;ThermalCameraDemo_main.c,198 :: 		}
L_end_applicationInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationInit
_g2cTask:
;ThermalCameraDemo_main.c,200 :: 		void g2cTask()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ThermalCameraDemo_main.c,203 :: 		if( taskTime > 1500 )
MOVW	R0, #lo_addr(_taskTime+0)
MOVT	R0, #hi_addr(_taskTime+0)
LDRH	R1, [R0, #0]
MOVW	R0, #1500
CMP	R1, R0
IT	LS
BLS	L_g2cTask14
;ThermalCameraDemo_main.c,205 :: 		taskTime = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_taskTime+0)
MOVT	R0, #hi_addr(_taskTime+0)
STRH	R1, [R0, #0]
;ThermalCameraDemo_main.c,207 :: 		g2c_packCmd( &_AT_DSET[0], &g2c_sRef_tempMin[0], &G2C_min_pxBuffer[0]);
MOVW	R2, #lo_addr(_G2C_min_pxBuffer+0)
MOVT	R2, #hi_addr(_G2C_min_pxBuffer+0)
MOVW	R1, #lo_addr(ThermalCameraDemo_main_g2c_sRef_tempMin+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_main_g2c_sRef_tempMin+0)
MOVW	R0, #lo_addr(ThermalCameraDemo_main__AT_DSET+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_main__AT_DSET+0)
BL	_g2c_packCmd+0
;ThermalCameraDemo_main.c,208 :: 		g2c_packCmd( &_AT_DSET[0], &g2c_sRef_tempMax[0], &G2C_max_pxBuffer[0]);
MOVW	R2, #lo_addr(_G2C_max_pxBuffer+0)
MOVT	R2, #hi_addr(_G2C_max_pxBuffer+0)
MOVW	R1, #lo_addr(ThermalCameraDemo_main_g2c_sRef_tempMax+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_main_g2c_sRef_tempMax+0)
MOVW	R0, #lo_addr(ThermalCameraDemo_main__AT_DSET+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_main__AT_DSET+0)
BL	_g2c_packCmd+0
;ThermalCameraDemo_main.c,209 :: 		g2c_packCmd( &_AT_DSET[0], &g2c_sRef_tempAvg[0], &G2C_avg_pxBuffer[0]);
MOVW	R2, #lo_addr(_G2C_avg_pxBuffer+0)
MOVT	R2, #hi_addr(_G2C_avg_pxBuffer+0)
MOVW	R1, #lo_addr(ThermalCameraDemo_main_g2c_sRef_tempAvg+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_main_g2c_sRef_tempAvg+0)
MOVW	R0, #lo_addr(ThermalCameraDemo_main__AT_DSET+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_main__AT_DSET+0)
BL	_g2c_packCmd+0
;ThermalCameraDemo_main.c,210 :: 		g2c_packCmd( &_AT_DSET[0], &g2c_sRef_tempAmb[0], &G2C_ambient_tempBuffer[0]);
MOVW	R2, #lo_addr(_G2C_ambient_tempBuffer+0)
MOVT	R2, #hi_addr(_G2C_ambient_tempBuffer+0)
MOVW	R1, #lo_addr(ThermalCameraDemo_main_g2c_sRef_tempAmb+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_main_g2c_sRef_tempAmb+0)
MOVW	R0, #lo_addr(ThermalCameraDemo_main__AT_DSET+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_main__AT_DSET+0)
BL	_g2c_packCmd+0
;ThermalCameraDemo_main.c,211 :: 		g2c_cmdSingle( &_AT_PUB[0] );
MOVW	R0, #lo_addr(ThermalCameraDemo_main__AT_PUB+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_main__AT_PUB+0)
BL	_g2c_cmdSingle+0
;ThermalCameraDemo_main.c,212 :: 		}
L_g2cTask14:
;ThermalCameraDemo_main.c,213 :: 		}
L_end_g2cTask:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _g2cTask
_create_martixImage:
;ThermalCameraDemo_main.c,215 :: 		void create_martixImage()
SUB	SP, SP, #12
STR	LR, [SP, #0]
;ThermalCameraDemo_main.c,221 :: 		To_avg_pixels = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_To_avg_pixels+0)
MOVT	R0, #hi_addr(_To_avg_pixels+0)
VSTR	#1, S0, [R0, #0]
;ThermalCameraDemo_main.c,222 :: 		To_min_pixels = 50;
MOVW	R0, #0
MOVT	R0, #16968
VMOV	S0, R0
MOVW	R0, #lo_addr(_To_min_pixels+0)
MOVT	R0, #hi_addr(_To_min_pixels+0)
VSTR	#1, S0, [R0, #0]
;ThermalCameraDemo_main.c,223 :: 		To_max_pixels = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_To_max_pixels+0)
MOVT	R0, #hi_addr(_To_max_pixels+0)
VSTR	#1, S0, [R0, #0]
;ThermalCameraDemo_main.c,225 :: 		matrix_cnt = 16 * 64;
MOVW	R1, #1024
MOVW	R0, #lo_addr(_matrix_cnt+0)
MOVT	R0, #hi_addr(_matrix_cnt+0)
STRH	R1, [R0, #0]
;ThermalCameraDemo_main.c,226 :: 		for (rc = 0; rc < 24; rc++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_rc+0)
MOVT	R0, #hi_addr(_rc+0)
STRB	R1, [R0, #0]
L_create_martixImage15:
MOVW	R0, #lo_addr(_rc+0)
MOVT	R0, #hi_addr(_rc+0)
LDRB	R0, [R0, #0]
CMP	R0, #24
IT	CS
BCS	L_create_martixImage16
;ThermalCameraDemo_main.c,228 :: 		for (rcnt = 0; rcnt < 2; rcnt++)
; rcnt start address is: 20 (R5)
MOVS	R5, #0
; rcnt end address is: 20 (R5)
L_create_martixImage18:
; rcnt start address is: 20 (R5)
CMP	R5, #2
IT	CS
BCS	L_create_martixImage19
;ThermalCameraDemo_main.c,230 :: 		for (cc = 0; cc < 32; cc++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_cc+0)
MOVT	R0, #hi_addr(_cc+0)
STRB	R1, [R0, #0]
; rcnt end address is: 20 (R5)
L_create_martixImage21:
; rcnt start address is: 20 (R5)
MOVW	R0, #lo_addr(_cc+0)
MOVT	R0, #hi_addr(_cc+0)
LDRB	R0, [R0, #0]
CMP	R0, #32
IT	CS
BCS	L_create_martixImage22
;ThermalCameraDemo_main.c,232 :: 		temp_pixels = GET_PIX_NOR(rc, cc);
MOVW	R0, #lo_addr(_rc+0)
MOVT	R0, #hi_addr(_rc+0)
LDRB	R0, [R0, #0]
LSLS	R1, R0, #5
SXTH	R1, R1
MOVW	R0, #lo_addr(_cc+0)
MOVT	R0, #hi_addr(_cc+0)
LDRB	R0, [R0, #0]
ADDS	R0, R1, R0
SXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_mlx90640To+0)
MOVT	R0, #hi_addr(_mlx90640To+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
; temp_pixels start address is: 4 (R1)
VMOV.F32	S1, S0
;ThermalCameraDemo_main.c,234 :: 		color = color_scale_rgb_conversion( temp_pixels );
VSTR	#1, S1, [SP, #4]
STRB	R5, [SP, #8]
BL	_color_scale_rgb_conversion+0
LDRB	R5, [SP, #8]
VLDR	#1, S1, [SP, #4]
MOVW	R4, #lo_addr(_color+0)
MOVT	R4, #hi_addr(_color+0)
STRH	R0, [R4, #0]
;ThermalCameraDemo_main.c,235 :: 		pos = matrix_cnt;
MOVW	R3, #lo_addr(_matrix_cnt+0)
MOVT	R3, #hi_addr(_matrix_cnt+0)
; pos start address is: 24 (R6)
LDRH	R6, [R3, #0]
;ThermalCameraDemo_main.c,236 :: 		gImage_matrixImage[pos] = (uint8_t)(color & 0x00FF);
MOV	R1, R3
LDRB	R2, [R1, #0]
MOVW	R1, #lo_addr(_gImage_matrixImage+0)
MOVT	R1, #hi_addr(_gImage_matrixImage+0)
ADDS	R1, R1, R2
AND	R0, R0, #255
UXTB	R0, R0
STRB	R0, [R1, #0]
;ThermalCameraDemo_main.c,237 :: 		gImage_matrixImage[pos + 1 ] = (uint8_t)(color >> 8);
ADDS	R1, R6, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_gImage_matrixImage+0)
MOVT	R0, #hi_addr(_gImage_matrixImage+0)
ADDS	R1, R0, R1
MOV	R0, R4
LDRH	R0, [R0, #0]
LSRS	R0, R0, #8
UXTB	R0, R0
STRB	R0, [R1, #0]
;ThermalCameraDemo_main.c,238 :: 		gImage_matrixImage[pos + 2 ] = (uint8_t)(color & 0x00FF);
ADDS	R1, R6, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_gImage_matrixImage+0)
MOVT	R0, #hi_addr(_gImage_matrixImage+0)
ADDS	R1, R0, R1
MOV	R0, R4
LDRH	R0, [R0, #0]
AND	R0, R0, #255
UXTB	R0, R0
STRB	R0, [R1, #0]
;ThermalCameraDemo_main.c,239 :: 		gImage_matrixImage[pos + 3 ] = (uint8_t)(color >> 8);
ADDS	R1, R6, #3
SXTH	R1, R1
; pos end address is: 24 (R6)
MOVW	R0, #lo_addr(_gImage_matrixImage+0)
MOVT	R0, #hi_addr(_gImage_matrixImage+0)
ADDS	R1, R0, R1
MOV	R0, R4
LDRH	R0, [R0, #0]
LSRS	R0, R0, #8
UXTB	R0, R0
STRB	R0, [R1, #0]
;ThermalCameraDemo_main.c,240 :: 		matrix_cnt += 4;
MOV	R0, R3
LDRH	R0, [R0, #0]
ADDS	R0, R0, #4
STRH	R0, [R3, #0]
;ThermalCameraDemo_main.c,242 :: 		if(rcnt == 0)
CMP	R5, #0
IT	NE
BNE	L_create_martixImage24
;ThermalCameraDemo_main.c,244 :: 		if( temp_pixels < To_min_pixels && temp_pixels != 0) To_min_pixels = temp_pixels;
MOVW	R0, #lo_addr(_To_min_pixels+0)
MOVT	R0, #hi_addr(_To_min_pixels+0)
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	GE
BGE	L__create_martixImage48
VCMPE.F32	S1, #0
VMRS	#60, FPSCR
IT	EQ
BEQ	L__create_martixImage47
L__create_martixImage46:
MOVW	R0, #lo_addr(_To_min_pixels+0)
MOVT	R0, #hi_addr(_To_min_pixels+0)
VSTR	#1, S1, [R0, #0]
L__create_martixImage48:
L__create_martixImage47:
;ThermalCameraDemo_main.c,245 :: 		if( temp_pixels > To_max_pixels ) To_max_pixels = temp_pixels;
MOVW	R0, #lo_addr(_To_max_pixels+0)
MOVT	R0, #hi_addr(_To_max_pixels+0)
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_create_martixImage28
MOVW	R0, #lo_addr(_To_max_pixels+0)
MOVT	R0, #hi_addr(_To_max_pixels+0)
VSTR	#1, S1, [R0, #0]
L_create_martixImage28:
;ThermalCameraDemo_main.c,246 :: 		To_avg_pixels += temp_pixels;
MOVW	R0, #lo_addr(_To_avg_pixels+0)
MOVT	R0, #hi_addr(_To_avg_pixels+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
; temp_pixels end address is: 4 (R1)
VSTR	#1, S0, [R0, #0]
;ThermalCameraDemo_main.c,247 :: 		}
L_create_martixImage24:
;ThermalCameraDemo_main.c,230 :: 		for (cc = 0; cc < 32; cc++)
MOVW	R1, #lo_addr(_cc+0)
MOVT	R1, #hi_addr(_cc+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;ThermalCameraDemo_main.c,248 :: 		}
IT	AL
BAL	L_create_martixImage21
L_create_martixImage22:
;ThermalCameraDemo_main.c,228 :: 		for (rcnt = 0; rcnt < 2; rcnt++)
ADDS	R5, R5, #1
UXTB	R5, R5
;ThermalCameraDemo_main.c,249 :: 		}
; rcnt end address is: 20 (R5)
IT	AL
BAL	L_create_martixImage18
L_create_martixImage19:
;ThermalCameraDemo_main.c,226 :: 		for (rc = 0; rc < 24; rc++)
MOVW	R1, #lo_addr(_rc+0)
MOVT	R1, #hi_addr(_rc+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;ThermalCameraDemo_main.c,250 :: 		}
IT	AL
BAL	L_create_martixImage15
L_create_martixImage16:
;ThermalCameraDemo_main.c,251 :: 		To_avg_pixels /= 768.0;
MOVW	R1, #lo_addr(_To_avg_pixels+0)
MOVT	R1, #hi_addr(_To_avg_pixels+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #0
MOVT	R0, #17472
VMOV	S0, R0
VDIV.F32	S0, S1, S0
VSTR	#1, S0, [R1, #0]
;ThermalCameraDemo_main.c,253 :: 		FloatToStr(To_min_pixels, G2C_min_pxBuffer);
MOVW	R0, #lo_addr(_To_min_pixels+0)
MOVT	R0, #hi_addr(_To_min_pixels+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_G2C_min_pxBuffer+0)
MOVT	R0, #hi_addr(_G2C_min_pxBuffer+0)
BL	_FloatToStr+0
;ThermalCameraDemo_main.c,254 :: 		LTrim(G2C_min_pxBuffer);
MOVW	R0, #lo_addr(_G2C_min_pxBuffer+0)
MOVT	R0, #hi_addr(_G2C_min_pxBuffer+0)
BL	_Ltrim+0
;ThermalCameraDemo_main.c,255 :: 		FloatToStr(To_max_pixels, G2C_max_pxBuffer);
MOVW	R0, #lo_addr(_To_max_pixels+0)
MOVT	R0, #hi_addr(_To_max_pixels+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_G2C_max_pxBuffer+0)
MOVT	R0, #hi_addr(_G2C_max_pxBuffer+0)
BL	_FloatToStr+0
;ThermalCameraDemo_main.c,256 :: 		LTrim(G2C_max_pxBuffer);
MOVW	R0, #lo_addr(_G2C_max_pxBuffer+0)
MOVT	R0, #hi_addr(_G2C_max_pxBuffer+0)
BL	_Ltrim+0
;ThermalCameraDemo_main.c,257 :: 		FloatToStr(To_avg_pixels, G2C_avg_pxBuffer);
MOVW	R0, #lo_addr(_To_avg_pixels+0)
MOVT	R0, #hi_addr(_To_avg_pixels+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_G2C_avg_pxBuffer+0)
MOVT	R0, #hi_addr(_G2C_avg_pxBuffer+0)
BL	_FloatToStr+0
;ThermalCameraDemo_main.c,258 :: 		LTrim(G2C_avg_pxBuffer);
MOVW	R0, #lo_addr(_G2C_avg_pxBuffer+0)
MOVT	R0, #hi_addr(_G2C_avg_pxBuffer+0)
BL	_Ltrim+0
;ThermalCameraDemo_main.c,259 :: 		FloatToStr(Ta - 5, G2C_ambient_tempBuffer);
MOVW	R0, #lo_addr(_Ta+0)
MOVT	R0, #hi_addr(_Ta+0)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #5
VSUB.F32	S0, S1, S0
MOVW	R0, #lo_addr(_G2C_ambient_tempBuffer+0)
MOVT	R0, #hi_addr(_G2C_ambient_tempBuffer+0)
BL	_FloatToStr+0
;ThermalCameraDemo_main.c,260 :: 		LTrim(G2C_avg_pxBuffer);
MOVW	R0, #lo_addr(_G2C_avg_pxBuffer+0)
MOVT	R0, #hi_addr(_G2C_avg_pxBuffer+0)
BL	_Ltrim+0
;ThermalCameraDemo_main.c,261 :: 		}
L_end_create_martixImage:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _create_martixImage
__TempValue:
;ThermalCameraDemo_main.c,263 :: 		void _TempValue()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ThermalCameraDemo_main.c,265 :: 		IntToStr(_min_value, demoText);
MOVW	R0, #lo_addr(__min_value+0)
MOVT	R0, #hi_addr(__min_value+0)
LDRSB	R0, [R0, #0]
MOVW	R1, #lo_addr(_demoText+0)
MOVT	R1, #hi_addr(_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_main.c,266 :: 		TFT_Set_Font(&Tahoma40x40, 0x0000, FO_HORIZONTAL);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Tahoma40x40+0)
MOVT	R0, #hi_addr(_Tahoma40x40+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_main.c,267 :: 		TFT_Write_Text(demoText, 180, 75);
MOVS	R2, #75
MOVS	R1, #180
MOVW	R0, #lo_addr(_demoText+0)
MOVT	R0, #hi_addr(_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_main.c,269 :: 		IntToStr(_low_value, demoText);
MOVW	R0, #lo_addr(__low_value+0)
MOVT	R0, #hi_addr(__low_value+0)
LDRSB	R0, [R0, #0]
MOVW	R1, #lo_addr(_demoText+0)
MOVT	R1, #hi_addr(_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_main.c,270 :: 		TFT_Set_Font(&Tahoma40x40, 0x0000, FO_HORIZONTAL);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Tahoma40x40+0)
MOVT	R0, #hi_addr(_Tahoma40x40+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_main.c,271 :: 		TFT_Write_Text(demoText, 180, 155);
MOVS	R2, #155
MOVS	R1, #180
MOVW	R0, #lo_addr(_demoText+0)
MOVT	R0, #hi_addr(_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_main.c,273 :: 		IntToStr(_med_value, demoText);
MOVW	R0, #lo_addr(__med_value+0)
MOVT	R0, #hi_addr(__med_value+0)
LDRSB	R0, [R0, #0]
MOVW	R1, #lo_addr(_demoText+0)
MOVT	R1, #hi_addr(_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_main.c,274 :: 		TFT_Set_Font(&Tahoma40x40, 0x0000, FO_HORIZONTAL);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Tahoma40x40+0)
MOVT	R0, #hi_addr(_Tahoma40x40+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_main.c,275 :: 		TFT_Write_Text(demoText, 180, 235);
MOVS	R2, #235
MOVS	R1, #180
MOVW	R0, #lo_addr(_demoText+0)
MOVT	R0, #hi_addr(_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_main.c,277 :: 		IntToStr(_high_value, demoText);
MOVW	R0, #lo_addr(__high_value+0)
MOVT	R0, #hi_addr(__high_value+0)
LDRSB	R0, [R0, #0]
MOVW	R1, #lo_addr(_demoText+0)
MOVT	R1, #hi_addr(_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_main.c,278 :: 		TFT_Set_Font(&Tahoma40x40, 0x0000, FO_HORIZONTAL);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Tahoma40x40+0)
MOVT	R0, #hi_addr(_Tahoma40x40+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_main.c,279 :: 		TFT_Write_Text(demoText, 180, 310);
MOVW	R2, #310
MOVS	R1, #180
MOVW	R0, #lo_addr(_demoText+0)
MOVT	R0, #hi_addr(_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_main.c,281 :: 		IntToStr(_max_value, demoText);
MOVW	R0, #lo_addr(__max_value+0)
MOVT	R0, #hi_addr(__max_value+0)
LDRSB	R0, [R0, #0]
MOVW	R1, #lo_addr(_demoText+0)
MOVT	R1, #hi_addr(_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_main.c,282 :: 		TFT_Set_Font(&Tahoma40x40, 0x0000, FO_HORIZONTAL);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Tahoma40x40+0)
MOVT	R0, #hi_addr(_Tahoma40x40+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_main.c,283 :: 		TFT_Write_Text(demoText, 180, 390);
MOVW	R2, #390
MOVS	R1, #180
MOVW	R0, #lo_addr(_demoText+0)
MOVT	R0, #hi_addr(_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_main.c,284 :: 		}
L_end__TempValue:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of __TempValue
__TObject:
;ThermalCameraDemo_main.c,286 :: 		void _TObject()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ThermalCameraDemo_main.c,288 :: 		TFT_Set_Font(&Tahoma40x40, 0xFFFF, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Tahoma40x40+0)
MOVT	R0, #hi_addr(_Tahoma40x40+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_main.c,289 :: 		TFT_Write_Text(To_min_pxBuffer, 565, 170);
MOVS	R2, #170
MOVW	R1, #565
MOVW	R0, #lo_addr(_To_min_pxBuffer+0)
MOVT	R0, #hi_addr(_To_min_pxBuffer+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_main.c,290 :: 		FloatToStr(To_min_pixels, To_min_pxBuffer);
MOVW	R0, #lo_addr(_To_min_pixels+0)
MOVT	R0, #hi_addr(_To_min_pixels+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_To_min_pxBuffer+0)
MOVT	R0, #hi_addr(_To_min_pxBuffer+0)
BL	_FloatToStr+0
;ThermalCameraDemo_main.c,291 :: 		TFT_Set_Font(&Tahoma40x40, 0x0000, FO_HORIZONTAL);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Tahoma40x40+0)
MOVT	R0, #hi_addr(_Tahoma40x40+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_main.c,292 :: 		TFT_Write_Text(To_min_pxBuffer, 565, 170);
MOVS	R2, #170
MOVW	R1, #565
MOVW	R0, #lo_addr(_To_min_pxBuffer+0)
MOVT	R0, #hi_addr(_To_min_pxBuffer+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_main.c,294 :: 		TFT_Set_Font(&Tahoma40x40, 0xFFFF, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Tahoma40x40+0)
MOVT	R0, #hi_addr(_Tahoma40x40+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_main.c,295 :: 		TFT_Write_Text(To_max_pxBuffer, 565, 280);
MOVW	R2, #280
MOVW	R1, #565
MOVW	R0, #lo_addr(_To_max_pxBuffer+0)
MOVT	R0, #hi_addr(_To_max_pxBuffer+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_main.c,296 :: 		FloatToStr(To_max_pixels, To_max_pxBuffer);
MOVW	R0, #lo_addr(_To_max_pixels+0)
MOVT	R0, #hi_addr(_To_max_pixels+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_To_max_pxBuffer+0)
MOVT	R0, #hi_addr(_To_max_pxBuffer+0)
BL	_FloatToStr+0
;ThermalCameraDemo_main.c,297 :: 		TFT_Set_Font(&Tahoma40x40, 0x0000, FO_HORIZONTAL);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Tahoma40x40+0)
MOVT	R0, #hi_addr(_Tahoma40x40+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_main.c,298 :: 		TFT_Write_Text(To_max_pxBuffer, 565, 280);
MOVW	R2, #280
MOVW	R1, #565
MOVW	R0, #lo_addr(_To_max_pxBuffer+0)
MOVT	R0, #hi_addr(_To_max_pxBuffer+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_main.c,300 :: 		TFT_Set_Font(&Tahoma40x40, 0xFFFF, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Tahoma40x40+0)
MOVT	R0, #hi_addr(_Tahoma40x40+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_main.c,301 :: 		TFT_Write_Text(To_avg_pxBuffer, 565, 385);
MOVW	R2, #385
MOVW	R1, #565
MOVW	R0, #lo_addr(_To_avg_pxBuffer+0)
MOVT	R0, #hi_addr(_To_avg_pxBuffer+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_main.c,302 :: 		FloatToStr(To_avg_pixels, To_avg_pxBuffer);
MOVW	R0, #lo_addr(_To_avg_pixels+0)
MOVT	R0, #hi_addr(_To_avg_pixels+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_To_avg_pxBuffer+0)
MOVT	R0, #hi_addr(_To_avg_pxBuffer+0)
BL	_FloatToStr+0
;ThermalCameraDemo_main.c,303 :: 		TFT_Set_Font(&Tahoma40x40, 0x0000, FO_HORIZONTAL);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Tahoma40x40+0)
MOVT	R0, #hi_addr(_Tahoma40x40+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_main.c,304 :: 		TFT_Write_Text(To_avg_pxBuffer, 565, 385);
MOVW	R2, #385
MOVW	R1, #565
MOVW	R0, #lo_addr(_To_avg_pxBuffer+0)
MOVT	R0, #hi_addr(_To_avg_pxBuffer+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_main.c,305 :: 		}
L_end__TObject:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of __TObject
_applicationTask:
;ThermalCameraDemo_main.c,307 :: 		void applicationTask()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ThermalCameraDemo_main.c,309 :: 		g2cTask();
BL	_g2cTask+0
;ThermalCameraDemo_main.c,310 :: 		if(fScreen == 0)
MOVW	R0, #lo_addr(_fScreen+0)
MOVT	R0, #hi_addr(_fScreen+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_applicationTask29
;ThermalCameraDemo_main.c,313 :: 		irgrid2_getFrameData(mlx90640Frame);
MOVW	R0, #lo_addr(_mlx90640Frame+0)
MOVT	R0, #hi_addr(_mlx90640Frame+0)
BL	_irgrid2_getFrameData+0
;ThermalCameraDemo_main.c,314 :: 		Ta = irgrid2_GetTa(mlx90640Frame, &mlx90640);
MOVW	R1, #lo_addr(_mlx90640+0)
MOVT	R1, #hi_addr(_mlx90640+0)
MOVW	R0, #lo_addr(_mlx90640Frame+0)
MOVT	R0, #hi_addr(_mlx90640Frame+0)
BL	_irgrid2_GetTa+0
MOVW	R0, #lo_addr(_Ta+0)
MOVT	R0, #hi_addr(_Ta+0)
VSTR	#1, S0, [R0, #0]
;ThermalCameraDemo_main.c,315 :: 		tr = Ta - TA_SHIFT;
VMOV.F32	S1, #9
VSUB.F32	S0, S0, S1
MOVW	R0, #lo_addr(_tr+0)
MOVT	R0, #hi_addr(_tr+0)
VSTR	#1, S0, [R0, #0]
;ThermalCameraDemo_main.c,316 :: 		irgrid2_CalculateTo(mlx90640Frame, &mlx90640, emissivity, tr, mlx90640To);
VMOV.F32	S1, S0
MOVW	R0, #lo_addr(_emissivity+0)
MOVT	R0, #hi_addr(_emissivity+0)
VLDR	#1, S0, [R0, #0]
MOVW	R2, #lo_addr(_mlx90640To+0)
MOVT	R2, #hi_addr(_mlx90640To+0)
MOVW	R1, #lo_addr(_mlx90640+0)
MOVT	R1, #hi_addr(_mlx90640+0)
MOVW	R0, #lo_addr(_mlx90640Frame+0)
MOVT	R0, #hi_addr(_mlx90640Frame+0)
BL	_irgrid2_CalculateTo+0
;ThermalCameraDemo_main.c,317 :: 		color_scale_init(Ta);
MOVW	R0, #lo_addr(_Ta+0)
MOVT	R0, #hi_addr(_Ta+0)
VLDR	#1, S0, [R0, #0]
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
UXTB	R0, R0
BL	_color_scale_init+0
;ThermalCameraDemo_main.c,320 :: 		TFT_Set_Font(&Tahoma40x40, 0x0679, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #1657
MOVW	R0, #lo_addr(_Tahoma40x40+0)
MOVT	R0, #hi_addr(_Tahoma40x40+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_main.c,321 :: 		TFT_Write_Text(demoText, 75, 389);
MOVW	R2, #389
MOVS	R1, #75
MOVW	R0, #lo_addr(_demoText+0)
MOVT	R0, #hi_addr(_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_main.c,322 :: 		TFT_Set_Font(&Tahoma40x40, 0x632C, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #25388
MOVW	R0, #lo_addr(_Tahoma40x40+0)
MOVT	R0, #hi_addr(_Tahoma40x40+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_main.c,323 :: 		FloatToStr(Ta - 5.0, demoText);
MOVW	R0, #lo_addr(_Ta+0)
MOVT	R0, #hi_addr(_Ta+0)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #5
VSUB.F32	S0, S1, S0
MOVW	R0, #lo_addr(_demoText+0)
MOVT	R0, #hi_addr(_demoText+0)
BL	_FloatToStr+0
;ThermalCameraDemo_main.c,324 :: 		TFT_Write_Text(demoText, 75, 389);
MOVW	R2, #389
MOVS	R1, #75
MOVW	R0, #lo_addr(_demoText+0)
MOVT	R0, #hi_addr(_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_main.c,327 :: 		create_martixImage();
BL	_create_martixImage+0
;ThermalCameraDemo_main.c,328 :: 		matrixrgb_drawImage(gImage_matrixImage);
MOVW	R0, #lo_addr(_gImage_matrixImage+0)
MOVT	R0, #hi_addr(_gImage_matrixImage+0)
BL	_matrixrgb_drawImage+0
;ThermalCameraDemo_main.c,329 :: 		Delay_ms( 400 );
MOVW	R7, #52222
MOVT	R7, #341
NOP
NOP
L_applicationTask30:
SUBS	R7, R7, #1
BNE	L_applicationTask30
NOP
NOP
NOP
;ThermalCameraDemo_main.c,332 :: 		Touch_new = proxfusion2_readByte(0x13);
MOVS	R0, #19
BL	_proxfusion2_readByte+0
MOVW	R1, #lo_addr(_Touch_new+0)
MOVT	R1, #hi_addr(_Touch_new+0)
STRB	R0, [R1, #0]
;ThermalCameraDemo_main.c,333 :: 		Touch_new &= 0x02;
AND	R0, R0, #2
UXTB	R0, R0
STRB	R0, [R1, #0]
;ThermalCameraDemo_main.c,335 :: 		if (Touch_new == 0x02 && Touch_old != 0x02)
CMP	R0, #2
IT	NE
BNE	L__applicationTask52
MOVW	R0, #lo_addr(_Touch_old+0)
MOVT	R0, #hi_addr(_Touch_old+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L__applicationTask51
L__applicationTask50:
;ThermalCameraDemo_main.c,337 :: 		fScreen = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_fScreen+0)
MOVT	R0, #hi_addr(_fScreen+0)
STRH	R1, [R0, #0]
;ThermalCameraDemo_main.c,338 :: 		DrawScreen(&Screen2);
MOVW	R0, #lo_addr(_Screen2+0)
MOVT	R0, #hi_addr(_Screen2+0)
BL	_DrawScreen+0
;ThermalCameraDemo_main.c,339 :: 		fMessage = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fMessage+0)
MOVT	R0, #hi_addr(_fMessage+0)
STRB	R1, [R0, #0]
;ThermalCameraDemo_main.c,340 :: 		Delay_ms( 500 );
MOVW	R7, #16126
MOVT	R7, #427
NOP
NOP
L_applicationTask35:
SUBS	R7, R7, #1
BNE	L_applicationTask35
NOP
NOP
NOP
;ThermalCameraDemo_main.c,335 :: 		if (Touch_new == 0x02 && Touch_old != 0x02)
L__applicationTask52:
L__applicationTask51:
;ThermalCameraDemo_main.c,342 :: 		Touch_old = Touch_new;
MOVW	R0, #lo_addr(_Touch_new+0)
MOVT	R0, #hi_addr(_Touch_new+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_Touch_old+0)
MOVT	R0, #hi_addr(_Touch_old+0)
STRB	R1, [R0, #0]
;ThermalCameraDemo_main.c,343 :: 		}
IT	AL
BAL	L_applicationTask37
L_applicationTask29:
;ThermalCameraDemo_main.c,346 :: 		Check_TP();
BL	_Check_TP+0
;ThermalCameraDemo_main.c,349 :: 		if(fMessage == 0)
MOVW	R0, #lo_addr(_fMessage+0)
MOVT	R0, #hi_addr(_fMessage+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_applicationTask38
;ThermalCameraDemo_main.c,351 :: 		_TempValue();
BL	__TempValue+0
;ThermalCameraDemo_main.c,352 :: 		_TObject();
BL	__TObject+0
;ThermalCameraDemo_main.c,353 :: 		matrixrgb_drawImage(TMP_IMAGE1_bmp);
MOVW	R0, #lo_addr(_TMP_IMAGE1_bmp+0)
MOVT	R0, #hi_addr(_TMP_IMAGE1_bmp+0)
BL	_matrixrgb_drawImage+0
;ThermalCameraDemo_main.c,354 :: 		fMessage = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fMessage+0)
MOVT	R0, #hi_addr(_fMessage+0)
STRB	R1, [R0, #0]
;ThermalCameraDemo_main.c,355 :: 		}
L_applicationTask38:
;ThermalCameraDemo_main.c,358 :: 		Touch_new = proxfusion2_readByte(0x13);
MOVS	R0, #19
BL	_proxfusion2_readByte+0
MOVW	R1, #lo_addr(_Touch_new+0)
MOVT	R1, #hi_addr(_Touch_new+0)
STRB	R0, [R1, #0]
;ThermalCameraDemo_main.c,359 :: 		Touch_new &= 0x02;
AND	R0, R0, #2
UXTB	R0, R0
STRB	R0, [R1, #0]
;ThermalCameraDemo_main.c,360 :: 		if (Touch_new == 0x02 && Touch_old != 0x02)
CMP	R0, #2
IT	NE
BNE	L__applicationTask54
MOVW	R0, #lo_addr(_Touch_old+0)
MOVT	R0, #hi_addr(_Touch_old+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L__applicationTask53
L__applicationTask49:
;ThermalCameraDemo_main.c,362 :: 		fScreen = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_fScreen+0)
MOVT	R0, #hi_addr(_fScreen+0)
STRH	R1, [R0, #0]
;ThermalCameraDemo_main.c,363 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;ThermalCameraDemo_main.c,364 :: 		Delay_ms( 500 );
MOVW	R7, #16126
MOVT	R7, #427
NOP
NOP
L_applicationTask42:
SUBS	R7, R7, #1
BNE	L_applicationTask42
NOP
NOP
NOP
;ThermalCameraDemo_main.c,360 :: 		if (Touch_new == 0x02 && Touch_old != 0x02)
L__applicationTask54:
L__applicationTask53:
;ThermalCameraDemo_main.c,366 :: 		Touch_old = Touch_new;
MOVW	R0, #lo_addr(_Touch_new+0)
MOVT	R0, #hi_addr(_Touch_new+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_Touch_old+0)
MOVT	R0, #hi_addr(_Touch_old+0)
STRB	R1, [R0, #0]
;ThermalCameraDemo_main.c,367 :: 		}
L_applicationTask37:
;ThermalCameraDemo_main.c,368 :: 		}
L_end_applicationTask:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationTask
_main:
;ThermalCameraDemo_main.c,370 :: 		void main()
;ThermalCameraDemo_main.c,372 :: 		systemInit();
BL	_systemInit+0
;ThermalCameraDemo_main.c,373 :: 		applicationInit();
BL	_applicationInit+0
;ThermalCameraDemo_main.c,374 :: 		Start_TP();
BL	_Start_TP+0
;ThermalCameraDemo_main.c,376 :: 		while (1)
L_main44:
;ThermalCameraDemo_main.c,378 :: 		applicationTask();
BL	_applicationTask+0
;ThermalCameraDemo_main.c,379 :: 		}
IT	AL
BAL	L_main44
;ThermalCameraDemo_main.c,380 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
