_Write_to_Data_Lines:
;ThermalCameraDemo_driver.c,57 :: 		void Write_to_Data_Lines(unsigned char _hi, unsigned char _lo) {
; _lo start address is: 4 (R1)
; _hi start address is: 0 (R0)
; _lo end address is: 4 (R1)
; _hi end address is: 0 (R0)
; _hi start address is: 0 (R0)
; _lo start address is: 4 (R1)
;ThermalCameraDemo_driver.c,58 :: 		GPIOG_ODR = (unsigned int) (_lo | (_hi << 8));
LSLS	R2, R0, #8
UXTH	R2, R2
; _hi end address is: 0 (R0)
ORR	R3, R1, R2, LSL #0
UXTH	R3, R3
; _lo end address is: 4 (R1)
MOVW	R2, #lo_addr(GPIOG_ODR+0)
MOVT	R2, #hi_addr(GPIOG_ODR+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,59 :: 		}
L_end_Write_to_Data_Lines:
BX	LR
; end of _Write_to_Data_Lines
_Set_Index:
;ThermalCameraDemo_driver.c,61 :: 		void Set_Index(unsigned short index) {
; index start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; index end address is: 0 (R0)
; index start address is: 0 (R0)
;ThermalCameraDemo_driver.c,62 :: 		TFT_RS = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;ThermalCameraDemo_driver.c,63 :: 		Write_to_Data_Lines(0, index);
UXTB	R1, R0
; index end address is: 0 (R0)
MOVS	R0, #0
BL	_Write_to_Data_Lines+0
;ThermalCameraDemo_driver.c,64 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;ThermalCameraDemo_driver.c,65 :: 		asm nop;
NOP
;ThermalCameraDemo_driver.c,66 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;ThermalCameraDemo_driver.c,67 :: 		}
L_end_Set_Index:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_Index
_Write_Command:
;ThermalCameraDemo_driver.c,69 :: 		void Write_Command(unsigned short cmd) {
; cmd start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; cmd end address is: 0 (R0)
; cmd start address is: 0 (R0)
;ThermalCameraDemo_driver.c,70 :: 		TFT_RS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;ThermalCameraDemo_driver.c,71 :: 		Write_to_Data_Lines(0, cmd);
UXTB	R1, R0
; cmd end address is: 0 (R0)
MOVS	R0, #0
BL	_Write_to_Data_Lines+0
;ThermalCameraDemo_driver.c,72 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;ThermalCameraDemo_driver.c,73 :: 		asm nop;
NOP
;ThermalCameraDemo_driver.c,74 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;ThermalCameraDemo_driver.c,75 :: 		}
L_end_Write_Command:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Write_Command
_Write_Data:
;ThermalCameraDemo_driver.c,77 :: 		void Write_Data(unsigned int _data) {
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRH	R0, [SP, #4]
;ThermalCameraDemo_driver.c,78 :: 		TFT_RS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;ThermalCameraDemo_driver.c,79 :: 		Write_to_Data_Lines(Hi(_data), Lo(_data));
ADD	R3, SP, #4
LDRB	R1, [R3, #0]
UXTB	R2, R1
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
UXTB	R0, R1
UXTB	R1, R2
BL	_Write_to_Data_Lines+0
;ThermalCameraDemo_driver.c,80 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;ThermalCameraDemo_driver.c,81 :: 		asm nop;
NOP
;ThermalCameraDemo_driver.c,82 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;ThermalCameraDemo_driver.c,83 :: 		}
L_end_Write_Data:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Write_Data
_TFT_Get_Data:
;ThermalCameraDemo_driver.c,86 :: 		char *TFT_Get_Data(unsigned long fPos, unsigned long bytesToGet, unsigned long *pBytesGot) {
; pBytesGot start address is: 8 (R2)
; bytesToGet start address is: 4 (R1)
; fPos start address is: 0 (R0)
SUB	SP, SP, #16
STR	LR, [SP, #0]
STR	R1, [SP, #4]
MOV	R1, R2
MOV	R2, R0
LDR	R0, [SP, #4]
; pBytesGot end address is: 8 (R2)
; bytesToGet end address is: 4 (R1)
; fPos end address is: 0 (R0)
; fPos start address is: 8 (R2)
; bytesToGet start address is: 0 (R0)
; pBytesGot start address is: 4 (R1)
;ThermalCameraDemo_driver.c,89 :: 		*pBytesGot = 0;
MOVS	R3, #0
STR	R3, [R1, #0]
;ThermalCameraDemo_driver.c,91 :: 		if (rfHandle < 0) {
MOVW	R3, #lo_addr(_rfHandle+0)
MOVT	R3, #hi_addr(_rfHandle+0)
LDRSB	R3, [R3, #0]
CMP	R3, #0
IT	GE
BGE	L_TFT_Get_Data0
; fPos end address is: 8 (R2)
; bytesToGet end address is: 0 (R0)
; pBytesGot end address is: 4 (R1)
;ThermalCameraDemo_driver.c,92 :: 		return 0; // return with nil if handle was bad.
MOVS	R0, #0
IT	AL
BAL	L_end_TFT_Get_Data
;ThermalCameraDemo_driver.c,93 :: 		}
L_TFT_Get_Data0:
;ThermalCameraDemo_driver.c,101 :: 		f32_sector.fSectNum = rfStartSect + fPos / 512;
; pBytesGot start address is: 4 (R1)
; bytesToGet start address is: 0 (R0)
; fPos start address is: 8 (R2)
LSRS	R4, R2, #9
MOVW	R3, #lo_addr(_rfStartSect+0)
MOVT	R3, #hi_addr(_rfStartSect+0)
LDR	R3, [R3, #0]
ADDS	R4, R3, R4
MOVW	R3, #lo_addr(_f32_sector+0)
MOVT	R3, #hi_addr(_f32_sector+0)
STR	R4, [R3, #0]
;ThermalCameraDemo_driver.c,102 :: 		Mmc_Read_Sector(f32_sector.fSectNum, f32_sector.fSect);
MOV	R3, R4
STR	R1, [SP, #4]
STR	R0, [SP, #8]
STR	R2, [SP, #12]
MOVW	R1, #lo_addr(_f32_sector+4)
MOVT	R1, #hi_addr(_f32_sector+4)
MOV	R0, R3
BL	_Mmc_Read_Sector+0
LDR	R2, [SP, #12]
LDR	R0, [SP, #8]
LDR	R1, [SP, #4]
;ThermalCameraDemo_driver.c,105 :: 		scOffset = fPos % 512;
MOVW	R3, #511
AND	R3, R2, R3, LSL #0
; fPos end address is: 8 (R2)
; scOffset start address is: 8 (R2)
UXTH	R2, R3
;ThermalCameraDemo_driver.c,106 :: 		if(bytesToGet > 512-scOffset)
UXTH	R3, R3
RSB	R3, R3, #512
UXTH	R3, R3
CMP	R0, R3
IT	LS
BLS	L_TFT_Get_Data1
; bytesToGet end address is: 0 (R0)
;ThermalCameraDemo_driver.c,107 :: 		*pBytesGot = 512-scOffset;
RSB	R3, R2, #512
UXTH	R3, R3
STR	R3, [R1, #0]
; pBytesGot end address is: 4 (R1)
IT	AL
BAL	L_TFT_Get_Data2
L_TFT_Get_Data1:
;ThermalCameraDemo_driver.c,109 :: 		*pBytesGot = bytesToGet;
; pBytesGot start address is: 4 (R1)
; bytesToGet start address is: 0 (R0)
STR	R0, [R1, #0]
; bytesToGet end address is: 0 (R0)
; pBytesGot end address is: 4 (R1)
L_TFT_Get_Data2:
;ThermalCameraDemo_driver.c,111 :: 		return &f32_sector.fSect + scOffset;
MOVW	R3, #lo_addr(_f32_sector+4)
MOVT	R3, #hi_addr(_f32_sector+4)
ADDS	R3, R3, R2
; scOffset end address is: 8 (R2)
MOV	R0, R3
;ThermalCameraDemo_driver.c,112 :: 		}
L_end_TFT_Get_Data:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _TFT_Get_Data
ThermalCameraDemo_driver_InitializeTouchPanel:
;ThermalCameraDemo_driver.c,113 :: 		static void InitializeTouchPanel() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ThermalCameraDemo_driver.c,114 :: 		TFT_Set_Active(Set_Index, Write_Command, Write_Data);
MOVW	R2, #lo_addr(_Write_Data+0)
MOVT	R2, #hi_addr(_Write_Data+0)
MOVW	R1, #lo_addr(_Write_Command+0)
MOVT	R1, #hi_addr(_Write_Command+0)
MOVW	R0, #lo_addr(_Set_Index+0)
MOVT	R0, #hi_addr(_Set_Index+0)
BL	_TFT_Set_Active+0
;ThermalCameraDemo_driver.c,115 :: 		TFT_Init_SSD1963_Board_50(800, 480);
MOVW	R1, #480
MOVW	R0, #800
BL	_TFT_Init_SSD1963_Board_50+0
;ThermalCameraDemo_driver.c,116 :: 		TFT_Set_Ext_Buffer(TFT_Get_Data);
MOVW	R0, #lo_addr(_TFT_Get_Data+0)
MOVT	R0, #hi_addr(_TFT_Get_Data+0)
BL	_TFT_Set_Ext_Buffer+0
;ThermalCameraDemo_driver.c,118 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;ThermalCameraDemo_driver.c,120 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,121 :: 		PressedObject = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PressedObject+0)
MOVT	R0, #hi_addr(_PressedObject+0)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,122 :: 		PressedObjectType = -1;
MOVW	R1, #65535
SXTH	R1, R1
MOVW	R0, #lo_addr(_PressedObjectType+0)
MOVT	R0, #hi_addr(_PressedObjectType+0)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,123 :: 		}
L_end_InitializeTouchPanel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of ThermalCameraDemo_driver_InitializeTouchPanel
ThermalCameraDemo_driver_InitializeObjects:
;ThermalCameraDemo_driver.c,200 :: 		static void InitializeObjects() {
;ThermalCameraDemo_driver.c,201 :: 		Screen1.Color                     = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,202 :: 		Screen1.Width                     = 800;
MOVW	R1, #800
MOVW	R0, #lo_addr(_Screen1+2)
MOVT	R0, #hi_addr(_Screen1+2)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,203 :: 		Screen1.Height                    = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Screen1+4)
MOVT	R0, #hi_addr(_Screen1+4)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,204 :: 		Screen1.ButtonsCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+8)
MOVT	R0, #hi_addr(_Screen1+8)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,205 :: 		Screen1.LabelsCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen1+16)
MOVT	R0, #hi_addr(_Screen1+16)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,206 :: 		Screen1.Labels                    = Screen1_Labels;
MOVW	R1, #lo_addr(_Screen1_Labels+0)
MOVT	R1, #hi_addr(_Screen1_Labels+0)
MOVW	R0, #lo_addr(_Screen1+20)
MOVT	R0, #hi_addr(_Screen1+20)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,207 :: 		Screen1.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen1+24)
MOVT	R0, #hi_addr(_Screen1+24)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,208 :: 		Screen1.Images                    = Screen1_Images;
MOVW	R1, #lo_addr(_Screen1_Images+0)
MOVT	R1, #hi_addr(_Screen1_Images+0)
MOVW	R0, #lo_addr(_Screen1+28)
MOVT	R0, #hi_addr(_Screen1+28)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,209 :: 		Screen1.BoxesCount                = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen1+32)
MOVT	R0, #hi_addr(_Screen1+32)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,210 :: 		Screen1.Boxes                     = Screen1_Boxes;
MOVW	R1, #lo_addr(_Screen1_Boxes+0)
MOVT	R1, #hi_addr(_Screen1_Boxes+0)
MOVW	R0, #lo_addr(_Screen1+36)
MOVT	R0, #hi_addr(_Screen1+36)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,211 :: 		Screen1.ObjectsCount              = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Screen1+6)
MOVT	R0, #hi_addr(_Screen1+6)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,212 :: 		Screen1.OnSwipeUpPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+48)
MOVT	R0, #hi_addr(_Screen1+48)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,213 :: 		Screen1.OnSwipeDownPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+52)
MOVT	R0, #hi_addr(_Screen1+52)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,214 :: 		Screen1.OnSwipeLeftPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+40)
MOVT	R0, #hi_addr(_Screen1+40)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,215 :: 		Screen1.OnSwipeRightPtr = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+44)
MOVT	R0, #hi_addr(_Screen1+44)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,216 :: 		Screen1.OnZoomInPtr     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+56)
MOVT	R0, #hi_addr(_Screen1+56)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,217 :: 		Screen1.OnZoomOutPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+60)
MOVT	R0, #hi_addr(_Screen1+60)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,219 :: 		Screen2.Color                     = 0x5AEB;
MOVW	R1, #23275
MOVW	R0, #lo_addr(_Screen2+0)
MOVT	R0, #hi_addr(_Screen2+0)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,220 :: 		Screen2.Width                     = 800;
MOVW	R1, #800
MOVW	R0, #lo_addr(_Screen2+2)
MOVT	R0, #hi_addr(_Screen2+2)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,221 :: 		Screen2.Height                    = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Screen2+4)
MOVT	R0, #hi_addr(_Screen2+4)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,222 :: 		Screen2.ButtonsCount              = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Screen2+8)
MOVT	R0, #hi_addr(_Screen2+8)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,223 :: 		Screen2.Buttons                   = Screen2_Buttons;
MOVW	R1, #lo_addr(_Screen2_Buttons+0)
MOVT	R1, #hi_addr(_Screen2_Buttons+0)
MOVW	R0, #lo_addr(_Screen2+12)
MOVT	R0, #hi_addr(_Screen2+12)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,224 :: 		Screen2.LabelsCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+16)
MOVT	R0, #hi_addr(_Screen2+16)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,225 :: 		Screen2.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen2+24)
MOVT	R0, #hi_addr(_Screen2+24)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,226 :: 		Screen2.Images                    = Screen2_Images;
MOVW	R1, #lo_addr(_Screen2_Images+0)
MOVT	R1, #hi_addr(_Screen2_Images+0)
MOVW	R0, #lo_addr(_Screen2+28)
MOVT	R0, #hi_addr(_Screen2+28)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,227 :: 		Screen2.BoxesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+32)
MOVT	R0, #hi_addr(_Screen2+32)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,228 :: 		Screen2.ObjectsCount              = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Screen2+6)
MOVT	R0, #hi_addr(_Screen2+6)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,229 :: 		Screen2.OnSwipeUpPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+48)
MOVT	R0, #hi_addr(_Screen2+48)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,230 :: 		Screen2.OnSwipeDownPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+52)
MOVT	R0, #hi_addr(_Screen2+52)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,231 :: 		Screen2.OnSwipeLeftPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+40)
MOVT	R0, #hi_addr(_Screen2+40)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,232 :: 		Screen2.OnSwipeRightPtr = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+44)
MOVT	R0, #hi_addr(_Screen2+44)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,233 :: 		Screen2.OnZoomInPtr     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+56)
MOVT	R0, #hi_addr(_Screen2+56)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,234 :: 		Screen2.OnZoomOutPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+60)
MOVT	R0, #hi_addr(_Screen2+60)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,237 :: 		Image1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Image1+0)
MOVT	R0, #hi_addr(_Image1+0)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,238 :: 		Image1.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+4)
MOVT	R0, #hi_addr(_Image1+4)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,239 :: 		Image1.Left            = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+6)
MOVT	R0, #hi_addr(_Image1+6)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,240 :: 		Image1.Top             = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+8)
MOVT	R0, #hi_addr(_Image1+8)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,241 :: 		Image1.Width           = 800;
MOVW	R1, #800
MOVW	R0, #lo_addr(_Image1+10)
MOVT	R0, #hi_addr(_Image1+10)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,242 :: 		Image1.Height          = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image1+12)
MOVT	R0, #hi_addr(_Image1+12)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,243 :: 		Image1.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+22)
MOVT	R0, #hi_addr(_Image1+22)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,244 :: 		Image1.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+23)
MOVT	R0, #hi_addr(_Image1+23)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,245 :: 		Image1.Picture_Name    = featured_banner_bmp_bmp;
MOVW	R1, #12850
MOVW	R0, #lo_addr(_Image1+16)
MOVT	R0, #hi_addr(_Image1+16)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,246 :: 		Image1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+20)
MOVT	R0, #hi_addr(_Image1+20)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,247 :: 		Image1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+21)
MOVT	R0, #hi_addr(_Image1+21)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,249 :: 		Box1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Box1+0)
MOVT	R0, #hi_addr(_Box1+0)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,250 :: 		Box1.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+4)
MOVT	R0, #hi_addr(_Box1+4)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,251 :: 		Box1.Left            = 44;
MOVS	R1, #44
MOVW	R0, #lo_addr(_Box1+6)
MOVT	R0, #hi_addr(_Box1+6)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,252 :: 		Box1.Top             = 378;
MOVW	R1, #378
MOVW	R0, #lo_addr(_Box1+8)
MOVT	R0, #hi_addr(_Box1+8)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,253 :: 		Box1.Width           = 214;
MOVS	R1, #214
MOVW	R0, #lo_addr(_Box1+10)
MOVT	R0, #hi_addr(_Box1+10)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,254 :: 		Box1.Height          = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Box1+12)
MOVT	R0, #hi_addr(_Box1+12)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,255 :: 		Box1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+14)
MOVT	R0, #hi_addr(_Box1+14)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,256 :: 		Box1.Pen_Color       = 0xCE79;
MOVW	R1, #52857
MOVW	R0, #lo_addr(_Box1+16)
MOVT	R0, #hi_addr(_Box1+16)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,257 :: 		Box1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+18)
MOVT	R0, #hi_addr(_Box1+18)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,258 :: 		Box1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+19)
MOVT	R0, #hi_addr(_Box1+19)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,259 :: 		Box1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+20)
MOVT	R0, #hi_addr(_Box1+20)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,260 :: 		Box1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+21)
MOVT	R0, #hi_addr(_Box1+21)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,261 :: 		Box1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+22)
MOVT	R0, #hi_addr(_Box1+22)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,262 :: 		Box1.Gradient_Start_Color = 0x0679;
MOVW	R1, #1657
MOVW	R0, #lo_addr(_Box1+24)
MOVT	R0, #hi_addr(_Box1+24)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,263 :: 		Box1.Gradient_End_Color = 0x0679;
MOVW	R1, #1657
MOVW	R0, #lo_addr(_Box1+26)
MOVT	R0, #hi_addr(_Box1+26)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,264 :: 		Box1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box1+28)
MOVT	R0, #hi_addr(_Box1+28)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,265 :: 		Box1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+30)
MOVT	R0, #hi_addr(_Box1+30)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,266 :: 		Box1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box1+32)
MOVT	R0, #hi_addr(_Box1+32)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,268 :: 		Label1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,269 :: 		Label1.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label1+4)
MOVT	R0, #hi_addr(_Label1+4)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,270 :: 		Label1.Left            = 60;
MOVS	R1, #60
MOVW	R0, #lo_addr(_Label1+6)
MOVT	R0, #hi_addr(_Label1+6)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,271 :: 		Label1.Top             = 389;
MOVW	R1, #389
MOVW	R0, #lo_addr(_Label1+8)
MOVT	R0, #hi_addr(_Label1+8)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,272 :: 		Label1.Width           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Label1+10)
MOVT	R0, #hi_addr(_Label1+10)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,273 :: 		Label1.Height          = 44;
MOVS	R1, #44
MOVW	R0, #lo_addr(_Label1+12)
MOVT	R0, #hi_addr(_Label1+12)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,274 :: 		Label1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+27)
MOVT	R0, #hi_addr(_Label1+27)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,275 :: 		Label1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+28)
MOVT	R0, #hi_addr(_Label1+28)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,276 :: 		Label1.Caption         = Label1_Caption;
MOVW	R1, #lo_addr(_Label1_Caption+0)
MOVT	R1, #hi_addr(_Label1_Caption+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,277 :: 		Label1.FontName        = Tahoma40x40_Bold;
MOVS	R1, #139
MOVW	R0, #lo_addr(_Label1+20)
MOVT	R0, #hi_addr(_Label1+20)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,278 :: 		Label1.Font_Color      = 0x632C;
MOVW	R1, #25388
MOVW	R0, #lo_addr(_Label1+24)
MOVT	R0, #hi_addr(_Label1+24)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,279 :: 		Label1.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+26)
MOVT	R0, #hi_addr(_Label1+26)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,281 :: 		Image2.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Image2+0)
MOVT	R0, #hi_addr(_Image2+0)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,282 :: 		Image2.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+4)
MOVT	R0, #hi_addr(_Image2+4)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,283 :: 		Image2.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+6)
MOVT	R0, #hi_addr(_Image2+6)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,284 :: 		Image2.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+8)
MOVT	R0, #hi_addr(_Image2+8)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,285 :: 		Image2.Width           = 800;
MOVW	R1, #800
MOVW	R0, #lo_addr(_Image2+10)
MOVT	R0, #hi_addr(_Image2+10)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,286 :: 		Image2.Height          = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image2+12)
MOVT	R0, #hi_addr(_Image2+12)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,287 :: 		Image2.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+22)
MOVT	R0, #hi_addr(_Image2+22)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,288 :: 		Image2.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+23)
MOVT	R0, #hi_addr(_Image2+23)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,289 :: 		Image2.Picture_Name    = screen2_bg_bmp;
MOVW	R1, #59960
MOVT	R1, #11
MOVW	R0, #lo_addr(_Image2+16)
MOVT	R0, #hi_addr(_Image2+16)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,290 :: 		Image2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+20)
MOVT	R0, #hi_addr(_Image2+20)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,291 :: 		Image2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+21)
MOVT	R0, #hi_addr(_Image2+21)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,293 :: 		Button_min_p.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Button_min_p+0)
MOVT	R0, #hi_addr(_Button_min_p+0)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,294 :: 		Button_min_p.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_min_p+4)
MOVT	R0, #hi_addr(_Button_min_p+4)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,295 :: 		Button_min_p.Left            = 327;
MOVW	R1, #327
MOVW	R0, #lo_addr(_Button_min_p+6)
MOVT	R0, #hi_addr(_Button_min_p+6)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,296 :: 		Button_min_p.Top             = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Button_min_p+8)
MOVT	R0, #hi_addr(_Button_min_p+8)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,297 :: 		Button_min_p.Width           = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Button_min_p+10)
MOVT	R0, #hi_addr(_Button_min_p+10)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,298 :: 		Button_min_p.Height          = 59;
MOVS	R1, #59
MOVW	R0, #lo_addr(_Button_min_p+12)
MOVT	R0, #hi_addr(_Button_min_p+12)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,299 :: 		Button_min_p.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_min_p+14)
MOVT	R0, #hi_addr(_Button_min_p+14)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,300 :: 		Button_min_p.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_min_p+16)
MOVT	R0, #hi_addr(_Button_min_p+16)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,301 :: 		Button_min_p.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_min_p+18)
MOVT	R0, #hi_addr(_Button_min_p+18)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,302 :: 		Button_min_p.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_min_p+19)
MOVT	R0, #hi_addr(_Button_min_p+19)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,303 :: 		Button_min_p.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_min_p+20)
MOVT	R0, #hi_addr(_Button_min_p+20)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,304 :: 		Button_min_p.Caption         = Button_min_p_Caption;
MOVW	R1, #lo_addr(_Button_min_p_Caption+0)
MOVT	R1, #hi_addr(_Button_min_p_Caption+0)
MOVW	R0, #lo_addr(_Button_min_p+24)
MOVT	R0, #hi_addr(_Button_min_p+24)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,305 :: 		Button_min_p.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_min_p+28)
MOVT	R0, #hi_addr(_Button_min_p+28)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,306 :: 		Button_min_p.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_min_p+29)
MOVT	R0, #hi_addr(_Button_min_p+29)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,307 :: 		Button_min_p.FontName        = Tahoma11x13_Regular;
MOVW	R1, #11171
MOVW	R0, #lo_addr(_Button_min_p+32)
MOVT	R0, #hi_addr(_Button_min_p+32)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,308 :: 		Button_min_p.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_min_p+48)
MOVT	R0, #hi_addr(_Button_min_p+48)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,309 :: 		Button_min_p.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_min_p+36)
MOVT	R0, #hi_addr(_Button_min_p+36)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,310 :: 		Button_min_p.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_min_p+38)
MOVT	R0, #hi_addr(_Button_min_p+38)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,311 :: 		Button_min_p.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_min_p+39)
MOVT	R0, #hi_addr(_Button_min_p+39)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,312 :: 		Button_min_p.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_min_p+40)
MOVT	R0, #hi_addr(_Button_min_p+40)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,313 :: 		Button_min_p.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button_min_p+42)
MOVT	R0, #hi_addr(_Button_min_p+42)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,314 :: 		Button_min_p.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button_min_p+44)
MOVT	R0, #hi_addr(_Button_min_p+44)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,315 :: 		Button_min_p.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button_min_p+46)
MOVT	R0, #hi_addr(_Button_min_p+46)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,316 :: 		Button_min_p.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button_min_p+50)
MOVT	R0, #hi_addr(_Button_min_p+50)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,317 :: 		Button_min_p.OnClickPtr      = Button_min_pOnClick;
MOVW	R1, #lo_addr(_Button_min_pOnClick+0)
MOVT	R1, #hi_addr(_Button_min_pOnClick+0)
MOVW	R0, #lo_addr(_Button_min_p+60)
MOVT	R0, #hi_addr(_Button_min_p+60)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,319 :: 		Button_min_m.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Button_min_m+0)
MOVT	R0, #hi_addr(_Button_min_m+0)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,320 :: 		Button_min_m.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Button_min_m+4)
MOVT	R0, #hi_addr(_Button_min_m+4)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,321 :: 		Button_min_m.Left            = 416;
MOVW	R1, #416
MOVW	R0, #lo_addr(_Button_min_m+6)
MOVT	R0, #hi_addr(_Button_min_m+6)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,322 :: 		Button_min_m.Top             = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Button_min_m+8)
MOVT	R0, #hi_addr(_Button_min_m+8)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,323 :: 		Button_min_m.Width           = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Button_min_m+10)
MOVT	R0, #hi_addr(_Button_min_m+10)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,324 :: 		Button_min_m.Height          = 59;
MOVS	R1, #59
MOVW	R0, #lo_addr(_Button_min_m+12)
MOVT	R0, #hi_addr(_Button_min_m+12)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,325 :: 		Button_min_m.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_min_m+14)
MOVT	R0, #hi_addr(_Button_min_m+14)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,326 :: 		Button_min_m.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_min_m+16)
MOVT	R0, #hi_addr(_Button_min_m+16)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,327 :: 		Button_min_m.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_min_m+18)
MOVT	R0, #hi_addr(_Button_min_m+18)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,328 :: 		Button_min_m.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_min_m+19)
MOVT	R0, #hi_addr(_Button_min_m+19)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,329 :: 		Button_min_m.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_min_m+20)
MOVT	R0, #hi_addr(_Button_min_m+20)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,330 :: 		Button_min_m.Caption         = Button_min_m_Caption;
MOVW	R1, #lo_addr(_Button_min_m_Caption+0)
MOVT	R1, #hi_addr(_Button_min_m_Caption+0)
MOVW	R0, #lo_addr(_Button_min_m+24)
MOVT	R0, #hi_addr(_Button_min_m+24)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,331 :: 		Button_min_m.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_min_m+28)
MOVT	R0, #hi_addr(_Button_min_m+28)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,332 :: 		Button_min_m.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_min_m+29)
MOVT	R0, #hi_addr(_Button_min_m+29)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,333 :: 		Button_min_m.FontName        = Tahoma11x13_Regular;
MOVW	R1, #11171
MOVW	R0, #lo_addr(_Button_min_m+32)
MOVT	R0, #hi_addr(_Button_min_m+32)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,334 :: 		Button_min_m.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_min_m+48)
MOVT	R0, #hi_addr(_Button_min_m+48)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,335 :: 		Button_min_m.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_min_m+36)
MOVT	R0, #hi_addr(_Button_min_m+36)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,336 :: 		Button_min_m.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_min_m+38)
MOVT	R0, #hi_addr(_Button_min_m+38)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,337 :: 		Button_min_m.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_min_m+39)
MOVT	R0, #hi_addr(_Button_min_m+39)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,338 :: 		Button_min_m.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_min_m+40)
MOVT	R0, #hi_addr(_Button_min_m+40)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,339 :: 		Button_min_m.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button_min_m+42)
MOVT	R0, #hi_addr(_Button_min_m+42)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,340 :: 		Button_min_m.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button_min_m+44)
MOVT	R0, #hi_addr(_Button_min_m+44)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,341 :: 		Button_min_m.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button_min_m+46)
MOVT	R0, #hi_addr(_Button_min_m+46)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,342 :: 		Button_min_m.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button_min_m+50)
MOVT	R0, #hi_addr(_Button_min_m+50)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,343 :: 		Button_min_m.OnClickPtr      = Button_min_mOnClick;
MOVW	R1, #lo_addr(_Button_min_mOnClick+0)
MOVT	R1, #hi_addr(_Button_min_mOnClick+0)
MOVW	R0, #lo_addr(_Button_min_m+60)
MOVT	R0, #hi_addr(_Button_min_m+60)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,345 :: 		Button_low_p.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Button_low_p+0)
MOVT	R0, #hi_addr(_Button_low_p+0)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,346 :: 		Button_low_p.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Button_low_p+4)
MOVT	R0, #hi_addr(_Button_low_p+4)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,347 :: 		Button_low_p.Left            = 327;
MOVW	R1, #327
MOVW	R0, #lo_addr(_Button_low_p+6)
MOVT	R0, #hi_addr(_Button_low_p+6)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,348 :: 		Button_low_p.Top             = 146;
MOVS	R1, #146
MOVW	R0, #lo_addr(_Button_low_p+8)
MOVT	R0, #hi_addr(_Button_low_p+8)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,349 :: 		Button_low_p.Width           = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Button_low_p+10)
MOVT	R0, #hi_addr(_Button_low_p+10)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,350 :: 		Button_low_p.Height          = 59;
MOVS	R1, #59
MOVW	R0, #lo_addr(_Button_low_p+12)
MOVT	R0, #hi_addr(_Button_low_p+12)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,351 :: 		Button_low_p.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_low_p+14)
MOVT	R0, #hi_addr(_Button_low_p+14)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,352 :: 		Button_low_p.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_low_p+16)
MOVT	R0, #hi_addr(_Button_low_p+16)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,353 :: 		Button_low_p.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_low_p+18)
MOVT	R0, #hi_addr(_Button_low_p+18)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,354 :: 		Button_low_p.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_low_p+19)
MOVT	R0, #hi_addr(_Button_low_p+19)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,355 :: 		Button_low_p.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_low_p+20)
MOVT	R0, #hi_addr(_Button_low_p+20)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,356 :: 		Button_low_p.Caption         = Button_low_p_Caption;
MOVW	R1, #lo_addr(_Button_low_p_Caption+0)
MOVT	R1, #hi_addr(_Button_low_p_Caption+0)
MOVW	R0, #lo_addr(_Button_low_p+24)
MOVT	R0, #hi_addr(_Button_low_p+24)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,357 :: 		Button_low_p.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_low_p+28)
MOVT	R0, #hi_addr(_Button_low_p+28)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,358 :: 		Button_low_p.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_low_p+29)
MOVT	R0, #hi_addr(_Button_low_p+29)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,359 :: 		Button_low_p.FontName        = Tahoma11x13_Regular;
MOVW	R1, #11171
MOVW	R0, #lo_addr(_Button_low_p+32)
MOVT	R0, #hi_addr(_Button_low_p+32)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,360 :: 		Button_low_p.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_low_p+48)
MOVT	R0, #hi_addr(_Button_low_p+48)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,361 :: 		Button_low_p.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_low_p+36)
MOVT	R0, #hi_addr(_Button_low_p+36)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,362 :: 		Button_low_p.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_low_p+38)
MOVT	R0, #hi_addr(_Button_low_p+38)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,363 :: 		Button_low_p.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_low_p+39)
MOVT	R0, #hi_addr(_Button_low_p+39)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,364 :: 		Button_low_p.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_low_p+40)
MOVT	R0, #hi_addr(_Button_low_p+40)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,365 :: 		Button_low_p.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button_low_p+42)
MOVT	R0, #hi_addr(_Button_low_p+42)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,366 :: 		Button_low_p.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button_low_p+44)
MOVT	R0, #hi_addr(_Button_low_p+44)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,367 :: 		Button_low_p.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button_low_p+46)
MOVT	R0, #hi_addr(_Button_low_p+46)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,368 :: 		Button_low_p.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button_low_p+50)
MOVT	R0, #hi_addr(_Button_low_p+50)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,369 :: 		Button_low_p.OnClickPtr      = Button_low_pOnClick;
MOVW	R1, #lo_addr(_Button_low_pOnClick+0)
MOVT	R1, #hi_addr(_Button_low_pOnClick+0)
MOVW	R0, #lo_addr(_Button_low_p+60)
MOVT	R0, #hi_addr(_Button_low_p+60)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,371 :: 		Button_low_m.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Button_low_m+0)
MOVT	R0, #hi_addr(_Button_low_m+0)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,372 :: 		Button_low_m.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Button_low_m+4)
MOVT	R0, #hi_addr(_Button_low_m+4)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,373 :: 		Button_low_m.Left            = 415;
MOVW	R1, #415
MOVW	R0, #lo_addr(_Button_low_m+6)
MOVT	R0, #hi_addr(_Button_low_m+6)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,374 :: 		Button_low_m.Top             = 144;
MOVS	R1, #144
MOVW	R0, #lo_addr(_Button_low_m+8)
MOVT	R0, #hi_addr(_Button_low_m+8)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,375 :: 		Button_low_m.Width           = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Button_low_m+10)
MOVT	R0, #hi_addr(_Button_low_m+10)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,376 :: 		Button_low_m.Height          = 59;
MOVS	R1, #59
MOVW	R0, #lo_addr(_Button_low_m+12)
MOVT	R0, #hi_addr(_Button_low_m+12)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,377 :: 		Button_low_m.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_low_m+14)
MOVT	R0, #hi_addr(_Button_low_m+14)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,378 :: 		Button_low_m.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_low_m+16)
MOVT	R0, #hi_addr(_Button_low_m+16)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,379 :: 		Button_low_m.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_low_m+18)
MOVT	R0, #hi_addr(_Button_low_m+18)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,380 :: 		Button_low_m.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_low_m+19)
MOVT	R0, #hi_addr(_Button_low_m+19)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,381 :: 		Button_low_m.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_low_m+20)
MOVT	R0, #hi_addr(_Button_low_m+20)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,382 :: 		Button_low_m.Caption         = Button_low_m_Caption;
MOVW	R1, #lo_addr(_Button_low_m_Caption+0)
MOVT	R1, #hi_addr(_Button_low_m_Caption+0)
MOVW	R0, #lo_addr(_Button_low_m+24)
MOVT	R0, #hi_addr(_Button_low_m+24)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,383 :: 		Button_low_m.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_low_m+28)
MOVT	R0, #hi_addr(_Button_low_m+28)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,384 :: 		Button_low_m.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_low_m+29)
MOVT	R0, #hi_addr(_Button_low_m+29)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,385 :: 		Button_low_m.FontName        = Tahoma11x13_Regular;
MOVW	R1, #11171
MOVW	R0, #lo_addr(_Button_low_m+32)
MOVT	R0, #hi_addr(_Button_low_m+32)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,386 :: 		Button_low_m.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_low_m+48)
MOVT	R0, #hi_addr(_Button_low_m+48)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,387 :: 		Button_low_m.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_low_m+36)
MOVT	R0, #hi_addr(_Button_low_m+36)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,388 :: 		Button_low_m.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_low_m+38)
MOVT	R0, #hi_addr(_Button_low_m+38)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,389 :: 		Button_low_m.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_low_m+39)
MOVT	R0, #hi_addr(_Button_low_m+39)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,390 :: 		Button_low_m.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_low_m+40)
MOVT	R0, #hi_addr(_Button_low_m+40)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,391 :: 		Button_low_m.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button_low_m+42)
MOVT	R0, #hi_addr(_Button_low_m+42)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,392 :: 		Button_low_m.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button_low_m+44)
MOVT	R0, #hi_addr(_Button_low_m+44)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,393 :: 		Button_low_m.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button_low_m+46)
MOVT	R0, #hi_addr(_Button_low_m+46)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,394 :: 		Button_low_m.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button_low_m+50)
MOVT	R0, #hi_addr(_Button_low_m+50)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,395 :: 		Button_low_m.OnClickPtr      = Button_low_mOnClick;
MOVW	R1, #lo_addr(_Button_low_mOnClick+0)
MOVT	R1, #hi_addr(_Button_low_mOnClick+0)
MOVW	R0, #lo_addr(_Button_low_m+60)
MOVT	R0, #hi_addr(_Button_low_m+60)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,397 :: 		Button_med_p.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Button_med_p+0)
MOVT	R0, #hi_addr(_Button_med_p+0)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,398 :: 		Button_med_p.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Button_med_p+4)
MOVT	R0, #hi_addr(_Button_med_p+4)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,399 :: 		Button_med_p.Left            = 327;
MOVW	R1, #327
MOVW	R0, #lo_addr(_Button_med_p+6)
MOVT	R0, #hi_addr(_Button_med_p+6)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,400 :: 		Button_med_p.Top             = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_Button_med_p+8)
MOVT	R0, #hi_addr(_Button_med_p+8)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,401 :: 		Button_med_p.Width           = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Button_med_p+10)
MOVT	R0, #hi_addr(_Button_med_p+10)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,402 :: 		Button_med_p.Height          = 59;
MOVS	R1, #59
MOVW	R0, #lo_addr(_Button_med_p+12)
MOVT	R0, #hi_addr(_Button_med_p+12)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,403 :: 		Button_med_p.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_med_p+14)
MOVT	R0, #hi_addr(_Button_med_p+14)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,404 :: 		Button_med_p.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_med_p+16)
MOVT	R0, #hi_addr(_Button_med_p+16)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,405 :: 		Button_med_p.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_med_p+18)
MOVT	R0, #hi_addr(_Button_med_p+18)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,406 :: 		Button_med_p.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_med_p+19)
MOVT	R0, #hi_addr(_Button_med_p+19)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,407 :: 		Button_med_p.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_med_p+20)
MOVT	R0, #hi_addr(_Button_med_p+20)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,408 :: 		Button_med_p.Caption         = Button_med_p_Caption;
MOVW	R1, #lo_addr(_Button_med_p_Caption+0)
MOVT	R1, #hi_addr(_Button_med_p_Caption+0)
MOVW	R0, #lo_addr(_Button_med_p+24)
MOVT	R0, #hi_addr(_Button_med_p+24)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,409 :: 		Button_med_p.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_med_p+28)
MOVT	R0, #hi_addr(_Button_med_p+28)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,410 :: 		Button_med_p.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_med_p+29)
MOVT	R0, #hi_addr(_Button_med_p+29)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,411 :: 		Button_med_p.FontName        = Tahoma11x13_Regular;
MOVW	R1, #11171
MOVW	R0, #lo_addr(_Button_med_p+32)
MOVT	R0, #hi_addr(_Button_med_p+32)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,412 :: 		Button_med_p.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_med_p+48)
MOVT	R0, #hi_addr(_Button_med_p+48)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,413 :: 		Button_med_p.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_med_p+36)
MOVT	R0, #hi_addr(_Button_med_p+36)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,414 :: 		Button_med_p.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_med_p+38)
MOVT	R0, #hi_addr(_Button_med_p+38)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,415 :: 		Button_med_p.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_med_p+39)
MOVT	R0, #hi_addr(_Button_med_p+39)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,416 :: 		Button_med_p.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_med_p+40)
MOVT	R0, #hi_addr(_Button_med_p+40)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,417 :: 		Button_med_p.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button_med_p+42)
MOVT	R0, #hi_addr(_Button_med_p+42)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,418 :: 		Button_med_p.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button_med_p+44)
MOVT	R0, #hi_addr(_Button_med_p+44)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,419 :: 		Button_med_p.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button_med_p+46)
MOVT	R0, #hi_addr(_Button_med_p+46)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,420 :: 		Button_med_p.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button_med_p+50)
MOVT	R0, #hi_addr(_Button_med_p+50)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,421 :: 		Button_med_p.OnClickPtr      = Button_med_pOnClick;
MOVW	R1, #lo_addr(_Button_med_pOnClick+0)
MOVT	R1, #hi_addr(_Button_med_pOnClick+0)
MOVW	R0, #lo_addr(_Button_med_p+60)
MOVT	R0, #hi_addr(_Button_med_p+60)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,423 :: 		Button_med_m.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Button_med_m+0)
MOVT	R0, #hi_addr(_Button_med_m+0)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,424 :: 		Button_med_m.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Button_med_m+4)
MOVT	R0, #hi_addr(_Button_med_m+4)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,425 :: 		Button_med_m.Left            = 415;
MOVW	R1, #415
MOVW	R0, #lo_addr(_Button_med_m+6)
MOVT	R0, #hi_addr(_Button_med_m+6)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,426 :: 		Button_med_m.Top             = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_Button_med_m+8)
MOVT	R0, #hi_addr(_Button_med_m+8)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,427 :: 		Button_med_m.Width           = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Button_med_m+10)
MOVT	R0, #hi_addr(_Button_med_m+10)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,428 :: 		Button_med_m.Height          = 59;
MOVS	R1, #59
MOVW	R0, #lo_addr(_Button_med_m+12)
MOVT	R0, #hi_addr(_Button_med_m+12)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,429 :: 		Button_med_m.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_med_m+14)
MOVT	R0, #hi_addr(_Button_med_m+14)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,430 :: 		Button_med_m.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_med_m+16)
MOVT	R0, #hi_addr(_Button_med_m+16)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,431 :: 		Button_med_m.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_med_m+18)
MOVT	R0, #hi_addr(_Button_med_m+18)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,432 :: 		Button_med_m.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_med_m+19)
MOVT	R0, #hi_addr(_Button_med_m+19)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,433 :: 		Button_med_m.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_med_m+20)
MOVT	R0, #hi_addr(_Button_med_m+20)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,434 :: 		Button_med_m.Caption         = Button_med_m_Caption;
MOVW	R1, #lo_addr(_Button_med_m_Caption+0)
MOVT	R1, #hi_addr(_Button_med_m_Caption+0)
MOVW	R0, #lo_addr(_Button_med_m+24)
MOVT	R0, #hi_addr(_Button_med_m+24)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,435 :: 		Button_med_m.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_med_m+28)
MOVT	R0, #hi_addr(_Button_med_m+28)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,436 :: 		Button_med_m.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_med_m+29)
MOVT	R0, #hi_addr(_Button_med_m+29)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,437 :: 		Button_med_m.FontName        = Tahoma11x13_Regular;
MOVW	R1, #11171
MOVW	R0, #lo_addr(_Button_med_m+32)
MOVT	R0, #hi_addr(_Button_med_m+32)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,438 :: 		Button_med_m.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_med_m+48)
MOVT	R0, #hi_addr(_Button_med_m+48)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,439 :: 		Button_med_m.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_med_m+36)
MOVT	R0, #hi_addr(_Button_med_m+36)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,440 :: 		Button_med_m.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_med_m+38)
MOVT	R0, #hi_addr(_Button_med_m+38)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,441 :: 		Button_med_m.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_med_m+39)
MOVT	R0, #hi_addr(_Button_med_m+39)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,442 :: 		Button_med_m.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_med_m+40)
MOVT	R0, #hi_addr(_Button_med_m+40)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,443 :: 		Button_med_m.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button_med_m+42)
MOVT	R0, #hi_addr(_Button_med_m+42)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,444 :: 		Button_med_m.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button_med_m+44)
MOVT	R0, #hi_addr(_Button_med_m+44)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,445 :: 		Button_med_m.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button_med_m+46)
MOVT	R0, #hi_addr(_Button_med_m+46)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,446 :: 		Button_med_m.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button_med_m+50)
MOVT	R0, #hi_addr(_Button_med_m+50)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,447 :: 		Button_med_m.OnClickPtr      = Button_med_mOnClick;
MOVW	R1, #lo_addr(_Button_med_mOnClick+0)
MOVT	R1, #hi_addr(_Button_med_mOnClick+0)
MOVW	R0, #lo_addr(_Button_med_m+60)
MOVT	R0, #hi_addr(_Button_med_m+60)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,449 :: 		Button_high_p.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Button_high_p+0)
MOVT	R0, #hi_addr(_Button_high_p+0)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,450 :: 		Button_high_p.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Button_high_p+4)
MOVT	R0, #hi_addr(_Button_high_p+4)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,451 :: 		Button_high_p.Left            = 327;
MOVW	R1, #327
MOVW	R0, #lo_addr(_Button_high_p+6)
MOVT	R0, #hi_addr(_Button_high_p+6)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,452 :: 		Button_high_p.Top             = 309;
MOVW	R1, #309
MOVW	R0, #lo_addr(_Button_high_p+8)
MOVT	R0, #hi_addr(_Button_high_p+8)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,453 :: 		Button_high_p.Width           = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Button_high_p+10)
MOVT	R0, #hi_addr(_Button_high_p+10)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,454 :: 		Button_high_p.Height          = 59;
MOVS	R1, #59
MOVW	R0, #lo_addr(_Button_high_p+12)
MOVT	R0, #hi_addr(_Button_high_p+12)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,455 :: 		Button_high_p.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_high_p+14)
MOVT	R0, #hi_addr(_Button_high_p+14)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,456 :: 		Button_high_p.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_high_p+16)
MOVT	R0, #hi_addr(_Button_high_p+16)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,457 :: 		Button_high_p.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_high_p+18)
MOVT	R0, #hi_addr(_Button_high_p+18)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,458 :: 		Button_high_p.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_high_p+19)
MOVT	R0, #hi_addr(_Button_high_p+19)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,459 :: 		Button_high_p.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_high_p+20)
MOVT	R0, #hi_addr(_Button_high_p+20)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,460 :: 		Button_high_p.Caption         = Button_high_p_Caption;
MOVW	R1, #lo_addr(_Button_high_p_Caption+0)
MOVT	R1, #hi_addr(_Button_high_p_Caption+0)
MOVW	R0, #lo_addr(_Button_high_p+24)
MOVT	R0, #hi_addr(_Button_high_p+24)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,461 :: 		Button_high_p.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_high_p+28)
MOVT	R0, #hi_addr(_Button_high_p+28)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,462 :: 		Button_high_p.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_high_p+29)
MOVT	R0, #hi_addr(_Button_high_p+29)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,463 :: 		Button_high_p.FontName        = Tahoma11x13_Regular;
MOVW	R1, #11171
MOVW	R0, #lo_addr(_Button_high_p+32)
MOVT	R0, #hi_addr(_Button_high_p+32)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,464 :: 		Button_high_p.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_high_p+48)
MOVT	R0, #hi_addr(_Button_high_p+48)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,465 :: 		Button_high_p.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_high_p+36)
MOVT	R0, #hi_addr(_Button_high_p+36)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,466 :: 		Button_high_p.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_high_p+38)
MOVT	R0, #hi_addr(_Button_high_p+38)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,467 :: 		Button_high_p.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_high_p+39)
MOVT	R0, #hi_addr(_Button_high_p+39)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,468 :: 		Button_high_p.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_high_p+40)
MOVT	R0, #hi_addr(_Button_high_p+40)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,469 :: 		Button_high_p.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button_high_p+42)
MOVT	R0, #hi_addr(_Button_high_p+42)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,470 :: 		Button_high_p.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button_high_p+44)
MOVT	R0, #hi_addr(_Button_high_p+44)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,471 :: 		Button_high_p.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button_high_p+46)
MOVT	R0, #hi_addr(_Button_high_p+46)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,472 :: 		Button_high_p.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button_high_p+50)
MOVT	R0, #hi_addr(_Button_high_p+50)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,473 :: 		Button_high_p.OnClickPtr      = Button_high_pOnClick;
MOVW	R1, #lo_addr(_Button_high_pOnClick+0)
MOVT	R1, #hi_addr(_Button_high_pOnClick+0)
MOVW	R0, #lo_addr(_Button_high_p+60)
MOVT	R0, #hi_addr(_Button_high_p+60)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,475 :: 		Button_high_m.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Button_high_m+0)
MOVT	R0, #hi_addr(_Button_high_m+0)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,476 :: 		Button_high_m.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Button_high_m+4)
MOVT	R0, #hi_addr(_Button_high_m+4)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,477 :: 		Button_high_m.Left            = 416;
MOVW	R1, #416
MOVW	R0, #lo_addr(_Button_high_m+6)
MOVT	R0, #hi_addr(_Button_high_m+6)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,478 :: 		Button_high_m.Top             = 309;
MOVW	R1, #309
MOVW	R0, #lo_addr(_Button_high_m+8)
MOVT	R0, #hi_addr(_Button_high_m+8)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,479 :: 		Button_high_m.Width           = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Button_high_m+10)
MOVT	R0, #hi_addr(_Button_high_m+10)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,480 :: 		Button_high_m.Height          = 59;
MOVS	R1, #59
MOVW	R0, #lo_addr(_Button_high_m+12)
MOVT	R0, #hi_addr(_Button_high_m+12)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,481 :: 		Button_high_m.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_high_m+14)
MOVT	R0, #hi_addr(_Button_high_m+14)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,482 :: 		Button_high_m.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_high_m+16)
MOVT	R0, #hi_addr(_Button_high_m+16)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,483 :: 		Button_high_m.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_high_m+18)
MOVT	R0, #hi_addr(_Button_high_m+18)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,484 :: 		Button_high_m.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_high_m+19)
MOVT	R0, #hi_addr(_Button_high_m+19)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,485 :: 		Button_high_m.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_high_m+20)
MOVT	R0, #hi_addr(_Button_high_m+20)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,486 :: 		Button_high_m.Caption         = Button_high_m_Caption;
MOVW	R1, #lo_addr(_Button_high_m_Caption+0)
MOVT	R1, #hi_addr(_Button_high_m_Caption+0)
MOVW	R0, #lo_addr(_Button_high_m+24)
MOVT	R0, #hi_addr(_Button_high_m+24)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,487 :: 		Button_high_m.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_high_m+28)
MOVT	R0, #hi_addr(_Button_high_m+28)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,488 :: 		Button_high_m.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_high_m+29)
MOVT	R0, #hi_addr(_Button_high_m+29)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,489 :: 		Button_high_m.FontName        = Tahoma11x13_Regular;
MOVW	R1, #11171
MOVW	R0, #lo_addr(_Button_high_m+32)
MOVT	R0, #hi_addr(_Button_high_m+32)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,490 :: 		Button_high_m.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_high_m+48)
MOVT	R0, #hi_addr(_Button_high_m+48)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,491 :: 		Button_high_m.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_high_m+36)
MOVT	R0, #hi_addr(_Button_high_m+36)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,492 :: 		Button_high_m.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_high_m+38)
MOVT	R0, #hi_addr(_Button_high_m+38)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,493 :: 		Button_high_m.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_high_m+39)
MOVT	R0, #hi_addr(_Button_high_m+39)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,494 :: 		Button_high_m.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_high_m+40)
MOVT	R0, #hi_addr(_Button_high_m+40)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,495 :: 		Button_high_m.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button_high_m+42)
MOVT	R0, #hi_addr(_Button_high_m+42)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,496 :: 		Button_high_m.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button_high_m+44)
MOVT	R0, #hi_addr(_Button_high_m+44)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,497 :: 		Button_high_m.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button_high_m+46)
MOVT	R0, #hi_addr(_Button_high_m+46)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,498 :: 		Button_high_m.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button_high_m+50)
MOVT	R0, #hi_addr(_Button_high_m+50)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,499 :: 		Button_high_m.OnClickPtr      = Button_high_mOnClick;
MOVW	R1, #lo_addr(_Button_high_mOnClick+0)
MOVT	R1, #hi_addr(_Button_high_mOnClick+0)
MOVW	R0, #lo_addr(_Button_high_m+60)
MOVT	R0, #hi_addr(_Button_high_m+60)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,501 :: 		Button_max_p.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Button_max_p+0)
MOVT	R0, #hi_addr(_Button_max_p+0)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,502 :: 		Button_max_p.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Button_max_p+4)
MOVT	R0, #hi_addr(_Button_max_p+4)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,503 :: 		Button_max_p.Left            = 327;
MOVW	R1, #327
MOVW	R0, #lo_addr(_Button_max_p+6)
MOVT	R0, #hi_addr(_Button_max_p+6)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,504 :: 		Button_max_p.Top             = 381;
MOVW	R1, #381
MOVW	R0, #lo_addr(_Button_max_p+8)
MOVT	R0, #hi_addr(_Button_max_p+8)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,505 :: 		Button_max_p.Width           = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Button_max_p+10)
MOVT	R0, #hi_addr(_Button_max_p+10)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,506 :: 		Button_max_p.Height          = 59;
MOVS	R1, #59
MOVW	R0, #lo_addr(_Button_max_p+12)
MOVT	R0, #hi_addr(_Button_max_p+12)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,507 :: 		Button_max_p.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_max_p+14)
MOVT	R0, #hi_addr(_Button_max_p+14)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,508 :: 		Button_max_p.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_max_p+16)
MOVT	R0, #hi_addr(_Button_max_p+16)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,509 :: 		Button_max_p.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_max_p+18)
MOVT	R0, #hi_addr(_Button_max_p+18)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,510 :: 		Button_max_p.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_max_p+19)
MOVT	R0, #hi_addr(_Button_max_p+19)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,511 :: 		Button_max_p.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_max_p+20)
MOVT	R0, #hi_addr(_Button_max_p+20)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,512 :: 		Button_max_p.Caption         = Button_max_p_Caption;
MOVW	R1, #lo_addr(_Button_max_p_Caption+0)
MOVT	R1, #hi_addr(_Button_max_p_Caption+0)
MOVW	R0, #lo_addr(_Button_max_p+24)
MOVT	R0, #hi_addr(_Button_max_p+24)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,513 :: 		Button_max_p.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_max_p+28)
MOVT	R0, #hi_addr(_Button_max_p+28)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,514 :: 		Button_max_p.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_max_p+29)
MOVT	R0, #hi_addr(_Button_max_p+29)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,515 :: 		Button_max_p.FontName        = Tahoma11x13_Regular;
MOVW	R1, #11171
MOVW	R0, #lo_addr(_Button_max_p+32)
MOVT	R0, #hi_addr(_Button_max_p+32)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,516 :: 		Button_max_p.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_max_p+48)
MOVT	R0, #hi_addr(_Button_max_p+48)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,517 :: 		Button_max_p.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_max_p+36)
MOVT	R0, #hi_addr(_Button_max_p+36)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,518 :: 		Button_max_p.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_max_p+38)
MOVT	R0, #hi_addr(_Button_max_p+38)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,519 :: 		Button_max_p.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_max_p+39)
MOVT	R0, #hi_addr(_Button_max_p+39)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,520 :: 		Button_max_p.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_max_p+40)
MOVT	R0, #hi_addr(_Button_max_p+40)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,521 :: 		Button_max_p.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button_max_p+42)
MOVT	R0, #hi_addr(_Button_max_p+42)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,522 :: 		Button_max_p.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button_max_p+44)
MOVT	R0, #hi_addr(_Button_max_p+44)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,523 :: 		Button_max_p.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button_max_p+46)
MOVT	R0, #hi_addr(_Button_max_p+46)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,524 :: 		Button_max_p.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button_max_p+50)
MOVT	R0, #hi_addr(_Button_max_p+50)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,525 :: 		Button_max_p.OnClickPtr      = Button_max_pOnClick;
MOVW	R1, #lo_addr(_Button_max_pOnClick+0)
MOVT	R1, #hi_addr(_Button_max_pOnClick+0)
MOVW	R0, #lo_addr(_Button_max_p+60)
MOVT	R0, #hi_addr(_Button_max_p+60)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,527 :: 		Button_max_m.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Button_max_m+0)
MOVT	R0, #hi_addr(_Button_max_m+0)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,528 :: 		Button_max_m.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Button_max_m+4)
MOVT	R0, #hi_addr(_Button_max_m+4)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,529 :: 		Button_max_m.Left            = 418;
MOVW	R1, #418
MOVW	R0, #lo_addr(_Button_max_m+6)
MOVT	R0, #hi_addr(_Button_max_m+6)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,530 :: 		Button_max_m.Top             = 381;
MOVW	R1, #381
MOVW	R0, #lo_addr(_Button_max_m+8)
MOVT	R0, #hi_addr(_Button_max_m+8)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,531 :: 		Button_max_m.Width           = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Button_max_m+10)
MOVT	R0, #hi_addr(_Button_max_m+10)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,532 :: 		Button_max_m.Height          = 59;
MOVS	R1, #59
MOVW	R0, #lo_addr(_Button_max_m+12)
MOVT	R0, #hi_addr(_Button_max_m+12)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,533 :: 		Button_max_m.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_max_m+14)
MOVT	R0, #hi_addr(_Button_max_m+14)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,534 :: 		Button_max_m.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_max_m+16)
MOVT	R0, #hi_addr(_Button_max_m+16)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,535 :: 		Button_max_m.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_max_m+18)
MOVT	R0, #hi_addr(_Button_max_m+18)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,536 :: 		Button_max_m.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_max_m+19)
MOVT	R0, #hi_addr(_Button_max_m+19)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,537 :: 		Button_max_m.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_max_m+20)
MOVT	R0, #hi_addr(_Button_max_m+20)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,538 :: 		Button_max_m.Caption         = Button_max_m_Caption;
MOVW	R1, #lo_addr(_Button_max_m_Caption+0)
MOVT	R1, #hi_addr(_Button_max_m_Caption+0)
MOVW	R0, #lo_addr(_Button_max_m+24)
MOVT	R0, #hi_addr(_Button_max_m+24)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,539 :: 		Button_max_m.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_max_m+28)
MOVT	R0, #hi_addr(_Button_max_m+28)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,540 :: 		Button_max_m.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_max_m+29)
MOVT	R0, #hi_addr(_Button_max_m+29)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,541 :: 		Button_max_m.FontName        = Tahoma11x13_Regular;
MOVW	R1, #11171
MOVW	R0, #lo_addr(_Button_max_m+32)
MOVT	R0, #hi_addr(_Button_max_m+32)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,542 :: 		Button_max_m.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_max_m+48)
MOVT	R0, #hi_addr(_Button_max_m+48)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,543 :: 		Button_max_m.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_max_m+36)
MOVT	R0, #hi_addr(_Button_max_m+36)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,544 :: 		Button_max_m.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_max_m+38)
MOVT	R0, #hi_addr(_Button_max_m+38)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,545 :: 		Button_max_m.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button_max_m+39)
MOVT	R0, #hi_addr(_Button_max_m+39)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,546 :: 		Button_max_m.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button_max_m+40)
MOVT	R0, #hi_addr(_Button_max_m+40)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,547 :: 		Button_max_m.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button_max_m+42)
MOVT	R0, #hi_addr(_Button_max_m+42)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,548 :: 		Button_max_m.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button_max_m+44)
MOVT	R0, #hi_addr(_Button_max_m+44)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,549 :: 		Button_max_m.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button_max_m+46)
MOVT	R0, #hi_addr(_Button_max_m+46)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,550 :: 		Button_max_m.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button_max_m+50)
MOVT	R0, #hi_addr(_Button_max_m+50)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,551 :: 		Button_max_m.OnClickPtr      = Button_max_mOnClick;
MOVW	R1, #lo_addr(_Button_max_mOnClick+0)
MOVT	R1, #hi_addr(_Button_max_mOnClick+0)
MOVW	R0, #lo_addr(_Button_max_m+60)
MOVT	R0, #hi_addr(_Button_max_m+60)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,552 :: 		}
L_end_InitializeObjects:
BX	LR
; end of ThermalCameraDemo_driver_InitializeObjects
ThermalCameraDemo_driver_IsInsideObject:
;ThermalCameraDemo_driver.c,554 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
; Top start address is: 12 (R3)
; Left start address is: 8 (R2)
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
; Top end address is: 12 (R3)
; Left end address is: 8 (R2)
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
; Left start address is: 8 (R2)
; Top start address is: 12 (R3)
; Width start address is: 20 (R5)
LDRH	R5, [SP, #0]
; Height start address is: 24 (R6)
LDRH	R6, [SP, #4]
;ThermalCameraDemo_driver.c,555 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
CMP	R2, R0
IT	HI
BHI	L_ThermalCameraDemo_driver_IsInsideObject158
ADDS	R4, R2, R5
UXTH	R4, R4
; Left end address is: 8 (R2)
; Width end address is: 20 (R5)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R0
IT	CC
BCC	L_ThermalCameraDemo_driver_IsInsideObject157
; X end address is: 0 (R0)
;ThermalCameraDemo_driver.c,556 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
CMP	R3, R1
IT	HI
BHI	L_ThermalCameraDemo_driver_IsInsideObject156
ADDS	R4, R3, R6
UXTH	R4, R4
; Top end address is: 12 (R3)
; Height end address is: 24 (R6)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R1
IT	CC
BCC	L_ThermalCameraDemo_driver_IsInsideObject155
; Y end address is: 4 (R1)
L_ThermalCameraDemo_driver_IsInsideObject154:
;ThermalCameraDemo_driver.c,557 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_IsInsideObject
;ThermalCameraDemo_driver.c,555 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
L_ThermalCameraDemo_driver_IsInsideObject158:
L_ThermalCameraDemo_driver_IsInsideObject157:
;ThermalCameraDemo_driver.c,556 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
L_ThermalCameraDemo_driver_IsInsideObject156:
L_ThermalCameraDemo_driver_IsInsideObject155:
;ThermalCameraDemo_driver.c,559 :: 		return 0;
MOVS	R0, #0
;ThermalCameraDemo_driver.c,560 :: 		}
L_end_IsInsideObject:
BX	LR
; end of ThermalCameraDemo_driver_IsInsideObject
_DrawButton:
;ThermalCameraDemo_driver.c,568 :: 		void DrawButton(TButton *Abutton) {
; Abutton start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Abutton end address is: 0 (R0)
; Abutton start address is: 0 (R0)
;ThermalCameraDemo_driver.c,570 :: 		if (Abutton->Visible != 0) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawButton7
;ThermalCameraDemo_driver.c,571 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawButton8
;ThermalCameraDemo_driver.c,572 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;ThermalCameraDemo_driver.c,573 :: 		TFT_Set_Brush(Abutton->Transparent, Abutton->Press_Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_End_Color, Abutton->Gradient_Start_Color);
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #40
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #50
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;ThermalCameraDemo_driver.c,574 :: 		}
IT	AL
BAL	L_DrawButton9
L_DrawButton8:
;ThermalCameraDemo_driver.c,576 :: 		TFT_Set_Brush(Abutton->Transparent, Abutton->Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_Start_Color, Abutton->Gradient_End_Color);
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #40
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #46
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;ThermalCameraDemo_driver.c,577 :: 		}
L_DrawButton9:
;ThermalCameraDemo_driver.c,578 :: 		TFT_Set_Pen(Abutton->Pen_Color, Abutton->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;ThermalCameraDemo_driver.c,579 :: 		TFT_Rectangle(Abutton->Left, Abutton->Top, Abutton->Left + Abutton->Width - 1, Abutton->Top + Abutton->Height - 1);
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #1
SXTH	R2, R2
SXTH	R1, R4
STR	R0, [SP, #4]
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
LDR	R0, [SP, #4]
;ThermalCameraDemo_driver.c,580 :: 		if (Abutton->VerticalText != 0)
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawButton10
;ThermalCameraDemo_driver.c,581 :: 		TFT_Set_Ext_Font(Abutton->FontName, Abutton->Font_Color, FO_VERTICAL_COLUMN);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #2
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #4]
IT	AL
BAL	L_DrawButton11
L_DrawButton10:
;ThermalCameraDemo_driver.c,583 :: 		TFT_Set_Ext_Font(Abutton->FontName, Abutton->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #4]
L_DrawButton11:
;ThermalCameraDemo_driver.c,584 :: 		TFT_Write_Text_Return_Pos(Abutton->Caption, Abutton->Left, Abutton->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;ThermalCameraDemo_driver.c,585 :: 		if (Abutton->TextAlign == _taLeft)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawButton12
;ThermalCameraDemo_driver.c,586 :: 		ALeft = Abutton->Left + 4;
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R1, R1, #4
STRH	R1, [SP, #8]
IT	AL
BAL	L_DrawButton13
L_DrawButton12:
;ThermalCameraDemo_driver.c,587 :: 		else if (Abutton->TextAlign == _taCenter)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawButton14
;ThermalCameraDemo_driver.c,588 :: 		ALeft = Abutton->Left + (Abutton->Width - caption_length) / 2;
ADDS	R1, R0, #6
LDRH	R3, [R1, #0]
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R1, R3, R1
STRH	R1, [SP, #8]
IT	AL
BAL	L_DrawButton15
L_DrawButton14:
;ThermalCameraDemo_driver.c,589 :: 		else if (Abutton->TextAlign == _taRight)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawButton16
;ThermalCameraDemo_driver.c,590 :: 		ALeft = Abutton->Left + Abutton->Width - caption_length - 4;
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R2, R2, R1
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
SUBS	R1, R1, #4
STRH	R1, [SP, #8]
L_DrawButton16:
L_DrawButton15:
L_DrawButton13:
;ThermalCameraDemo_driver.c,592 :: 		if (Abutton->TextAlignVertical == _tavTop)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawButton17
;ThermalCameraDemo_driver.c,593 :: 		ATop = Abutton->Top + 4;
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R1, R1, #4
STRH	R1, [SP, #10]
IT	AL
BAL	L_DrawButton18
L_DrawButton17:
;ThermalCameraDemo_driver.c,594 :: 		else if (Abutton->TextAlignVertical == _tavMiddle)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawButton19
;ThermalCameraDemo_driver.c,595 :: 		ATop = Abutton->Top + ((Abutton->Height - caption_height) / 2);
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R1, R3, R1
STRH	R1, [SP, #10]
IT	AL
BAL	L_DrawButton20
L_DrawButton19:
;ThermalCameraDemo_driver.c,596 :: 		else if (Abutton->TextAlignVertical == _tavBottom)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawButton21
;ThermalCameraDemo_driver.c,597 :: 		ATop = Abutton->Top + (Abutton->Height - caption_height - 4);
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
SUBS	R1, R1, #4
UXTH	R1, R1
ADDS	R1, R3, R1
STRH	R1, [SP, #10]
L_DrawButton21:
L_DrawButton20:
L_DrawButton18:
;ThermalCameraDemo_driver.c,599 :: 		TFT_Write_Text(Abutton->Caption, ALeft, ATop);
ADDW	R1, R0, #24
; Abutton end address is: 0 (R0)
LDR	R1, [R1, #0]
LDRH	R2, [SP, #10]
MOV	R0, R1
LDRH	R1, [SP, #8]
BL	_TFT_Write_Text+0
;ThermalCameraDemo_driver.c,600 :: 		}
L_DrawButton7:
;ThermalCameraDemo_driver.c,601 :: 		}
L_end_DrawButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DrawButton
_DrawLabel:
;ThermalCameraDemo_driver.c,603 :: 		void DrawLabel(TLabel *ALabel) {
; ALabel start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ALabel end address is: 0 (R0)
; ALabel start address is: 0 (R0)
;ThermalCameraDemo_driver.c,604 :: 		if (ALabel->Visible != 0) {
ADDW	R1, R0, #27
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawLabel22
;ThermalCameraDemo_driver.c,605 :: 		if (ALabel->VerticalText != 0)
ADDW	R1, R0, #26
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawLabel23
;ThermalCameraDemo_driver.c,606 :: 		TFT_Set_Ext_Font(ALabel->FontName, ALabel->Font_Color, FO_VERTICAL_COLUMN);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #2
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #4]
IT	AL
BAL	L_DrawLabel24
L_DrawLabel23:
;ThermalCameraDemo_driver.c,608 :: 		TFT_Set_Ext_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #4]
L_DrawLabel24:
;ThermalCameraDemo_driver.c,609 :: 		TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #16
; ALabel end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
;ThermalCameraDemo_driver.c,610 :: 		}
L_DrawLabel22:
;ThermalCameraDemo_driver.c,611 :: 		}
L_end_DrawLabel:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawLabel
_DrawImage:
;ThermalCameraDemo_driver.c,613 :: 		void DrawImage(TImage *AImage) {
; AImage start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; AImage end address is: 0 (R0)
; AImage start address is: 0 (R0)
;ThermalCameraDemo_driver.c,614 :: 		if (AImage->Visible != 0) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawImage25
;ThermalCameraDemo_driver.c,615 :: 		TFT_Ext_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
ADDW	R1, R0, #23
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
MOV	R3, R1
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDS	R1, R0, #6
; AImage end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
MOV	R2, R3
UXTB	R3, R4
BL	_TFT_Ext_Image+0
;ThermalCameraDemo_driver.c,616 :: 		}
L_DrawImage25:
;ThermalCameraDemo_driver.c,617 :: 		}
L_end_DrawImage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DrawImage
_DrawBox:
;ThermalCameraDemo_driver.c,619 :: 		void DrawBox(TBox *ABox) {
; ABox start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ABox end address is: 0 (R0)
; ABox start address is: 0 (R0)
;ThermalCameraDemo_driver.c,620 :: 		if (ABox->Visible != 0) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawBox26
;ThermalCameraDemo_driver.c,621 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawBox27
;ThermalCameraDemo_driver.c,622 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;ThermalCameraDemo_driver.c,623 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #32
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;ThermalCameraDemo_driver.c,624 :: 		}
IT	AL
BAL	L_DrawBox28
L_DrawBox27:
;ThermalCameraDemo_driver.c,626 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #28
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;ThermalCameraDemo_driver.c,627 :: 		}
L_DrawBox28:
;ThermalCameraDemo_driver.c,628 :: 		TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;ThermalCameraDemo_driver.c,629 :: 		TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
; ABox end address is: 0 (R0)
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #1
SXTH	R2, R2
SXTH	R1, R4
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
;ThermalCameraDemo_driver.c,630 :: 		}
L_DrawBox26:
;ThermalCameraDemo_driver.c,631 :: 		}
L_end_DrawBox:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawBox
_DrawScreen:
;ThermalCameraDemo_driver.c,633 :: 		void DrawScreen(TScreen *aScreen) {
; aScreen start address is: 0 (R0)
SUB	SP, SP, #44
STR	LR, [SP, #0]
; aScreen end address is: 0 (R0)
; aScreen start address is: 0 (R0)
;ThermalCameraDemo_driver.c,646 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;ThermalCameraDemo_driver.c,647 :: 		order = 0;
MOVS	R1, #0
STRH	R1, [SP, #8]
;ThermalCameraDemo_driver.c,648 :: 		button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #10]
;ThermalCameraDemo_driver.c,649 :: 		label_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #16]
;ThermalCameraDemo_driver.c,650 :: 		image_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #24]
;ThermalCameraDemo_driver.c,651 :: 		box_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #32]
;ThermalCameraDemo_driver.c,652 :: 		CurrentScreen = aScreen;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
STR	R0, [R1, #0]
; aScreen end address is: 0 (R0)
;ThermalCameraDemo_driver.c,654 :: 		for (it = 255; it >= 0; it--)
; it start address is: 8 (R2)
MOVS	R2, #255
SXTH	R2, R2
; it end address is: 8 (R2)
SXTH	R0, R2
L_DrawScreen29:
; it start address is: 0 (R0)
CMP	R0, #0
IT	LT
BLT	L_DrawScreen30
;ThermalCameraDemo_driver.c,656 :: 		TFT_Set_DBC_SSD1963(it);
STRH	R0, [SP, #4]
UXTB	R0, R0
BL	_TFT_Set_DBC_SSD1963+0
LDRSH	R0, [SP, #4]
;ThermalCameraDemo_driver.c,657 :: 		Delay_1ms( );
BL	_Delay_1ms+0
;ThermalCameraDemo_driver.c,654 :: 		for (it = 255; it >= 0; it--)
SUBS	R1, R0, #1
; it end address is: 0 (R0)
; it start address is: 8 (R2)
SXTH	R2, R1
;ThermalCameraDemo_driver.c,658 :: 		}
SXTH	R0, R2
; it end address is: 8 (R2)
IT	AL
BAL	L_DrawScreen29
L_DrawScreen30:
;ThermalCameraDemo_driver.c,659 :: 		if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen161
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen160
IT	AL
BAL	L_DrawScreen34
L__DrawScreen161:
L__DrawScreen160:
;ThermalCameraDemo_driver.c,660 :: 		save_bled = TFT_BLED;
MOVW	R2, #lo_addr(GPIOF_ODR+0)
MOVT	R2, #hi_addr(GPIOF_ODR+0)
_LX	[R2, ByteOffset(GPIOF_ODR+0)]
STRB	R1, [SP, #40]
;ThermalCameraDemo_driver.c,661 :: 		TFT_BLED           = 0;
MOVS	R1, #0
SXTB	R1, R1
_SX	[R2, ByteOffset(GPIOF_ODR+0)]
;ThermalCameraDemo_driver.c,662 :: 		TFT_Set_Active(Set_Index, Write_Command, Write_Data);
MOVW	R3, #lo_addr(_Write_Data+0)
MOVT	R3, #hi_addr(_Write_Data+0)
MOVW	R2, #lo_addr(_Write_Command+0)
MOVT	R2, #hi_addr(_Write_Command+0)
MOVW	R1, #lo_addr(_Set_Index+0)
MOVT	R1, #hi_addr(_Set_Index+0)
MOV	R0, R1
MOV	R1, R2
MOV	R2, R3
BL	_TFT_Set_Active+0
;ThermalCameraDemo_driver.c,663 :: 		TFT_Init_SSD1963_Board_50(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_TFT_Init_SSD1963_Board_50+0
;ThermalCameraDemo_driver.c,664 :: 		FT5XX6_SetSize(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_FT5XX6_SetSize+0
;ThermalCameraDemo_driver.c,665 :: 		TFT_Set_Ext_Buffer(TFT_Get_Data);
MOVW	R1, #lo_addr(_TFT_Get_Data+0)
MOVT	R1, #hi_addr(_TFT_Get_Data+0)
MOV	R0, R1
BL	_TFT_Set_Ext_Buffer+0
;ThermalCameraDemo_driver.c,666 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
;ThermalCameraDemo_driver.c,667 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;ThermalCameraDemo_driver.c,668 :: 		display_width = CurrentScreen->Width;
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #2
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
STRH	R2, [R1, #0]
;ThermalCameraDemo_driver.c,669 :: 		display_height = CurrentScreen->Height;
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
STRH	R2, [R1, #0]
;ThermalCameraDemo_driver.c,670 :: 		TFT_BLED           = save_bled;
LDRB	R2, [SP, #40]
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;ThermalCameraDemo_driver.c,671 :: 		}
IT	AL
BAL	L_DrawScreen35
L_DrawScreen34:
;ThermalCameraDemo_driver.c,673 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
L_DrawScreen35:
;ThermalCameraDemo_driver.c,676 :: 		while (order < CurrentScreen->ObjectsCount) {
L_DrawScreen36:
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #6
LDRH	R2, [R1, #0]
LDRH	R1, [SP, #8]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen37
;ThermalCameraDemo_driver.c,677 :: 		if (button_idx < CurrentScreen->ButtonsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #8
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #10]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen38
;ThermalCameraDemo_driver.c,678 :: 		local_button = GetButton(button_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #12
LDR	R2, [R1, #0]
LDRB	R1, [SP, #10]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #12]
;ThermalCameraDemo_driver.c,679 :: 		if (order == local_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #8]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen39
;ThermalCameraDemo_driver.c,680 :: 		button_idx++;
LDRB	R1, [SP, #10]
ADDS	R1, R1, #1
STRB	R1, [SP, #10]
;ThermalCameraDemo_driver.c,681 :: 		order++;
LDRH	R1, [SP, #8]
ADDS	R1, R1, #1
STRH	R1, [SP, #8]
;ThermalCameraDemo_driver.c,682 :: 		DrawButton(local_button);
LDR	R0, [SP, #12]
BL	_DrawButton+0
;ThermalCameraDemo_driver.c,683 :: 		}
L_DrawScreen39:
;ThermalCameraDemo_driver.c,684 :: 		}
L_DrawScreen38:
;ThermalCameraDemo_driver.c,686 :: 		if (label_idx < CurrentScreen->LabelsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #16
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #16]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen40
;ThermalCameraDemo_driver.c,687 :: 		local_label = GetLabel(label_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #20
LDR	R2, [R1, #0]
LDRB	R1, [SP, #16]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #20]
;ThermalCameraDemo_driver.c,688 :: 		if (order == local_label->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #8]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen41
;ThermalCameraDemo_driver.c,689 :: 		label_idx++;
LDRB	R1, [SP, #16]
ADDS	R1, R1, #1
STRB	R1, [SP, #16]
;ThermalCameraDemo_driver.c,690 :: 		order++;
LDRH	R1, [SP, #8]
ADDS	R1, R1, #1
STRH	R1, [SP, #8]
;ThermalCameraDemo_driver.c,691 :: 		DrawLabel(local_label);
LDR	R0, [SP, #20]
BL	_DrawLabel+0
;ThermalCameraDemo_driver.c,692 :: 		}
L_DrawScreen41:
;ThermalCameraDemo_driver.c,693 :: 		}
L_DrawScreen40:
;ThermalCameraDemo_driver.c,695 :: 		if (box_idx < CurrentScreen->BoxesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #32
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #32]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen42
;ThermalCameraDemo_driver.c,696 :: 		local_box = GetBox(box_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #36
LDR	R2, [R1, #0]
LDRB	R1, [SP, #32]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #36]
;ThermalCameraDemo_driver.c,697 :: 		if (order == local_box->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #8]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen43
;ThermalCameraDemo_driver.c,698 :: 		box_idx++;
LDRB	R1, [SP, #32]
ADDS	R1, R1, #1
STRB	R1, [SP, #32]
;ThermalCameraDemo_driver.c,699 :: 		order++;
LDRH	R1, [SP, #8]
ADDS	R1, R1, #1
STRH	R1, [SP, #8]
;ThermalCameraDemo_driver.c,700 :: 		DrawBox(local_box);
LDR	R0, [SP, #36]
BL	_DrawBox+0
;ThermalCameraDemo_driver.c,701 :: 		}
L_DrawScreen43:
;ThermalCameraDemo_driver.c,702 :: 		}
L_DrawScreen42:
;ThermalCameraDemo_driver.c,704 :: 		if (image_idx < CurrentScreen->ImagesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #24
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #24]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen44
;ThermalCameraDemo_driver.c,705 :: 		local_image = GetImage(image_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #28
LDR	R2, [R1, #0]
LDRB	R1, [SP, #24]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #28]
;ThermalCameraDemo_driver.c,706 :: 		if (order == local_image->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #8]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen45
;ThermalCameraDemo_driver.c,707 :: 		image_idx++;
LDRB	R1, [SP, #24]
ADDS	R1, R1, #1
STRB	R1, [SP, #24]
;ThermalCameraDemo_driver.c,708 :: 		order++;
LDRH	R1, [SP, #8]
ADDS	R1, R1, #1
STRH	R1, [SP, #8]
;ThermalCameraDemo_driver.c,709 :: 		DrawImage(local_image);
LDR	R0, [SP, #28]
BL	_DrawImage+0
;ThermalCameraDemo_driver.c,710 :: 		}
L_DrawScreen45:
;ThermalCameraDemo_driver.c,711 :: 		}
L_DrawScreen44:
;ThermalCameraDemo_driver.c,713 :: 		}
IT	AL
BAL	L_DrawScreen36
L_DrawScreen37:
;ThermalCameraDemo_driver.c,714 :: 		for (it = 0; it <= 255; it++)
; it start address is: 0 (R0)
MOVS	R0, #0
SXTH	R0, R0
; it end address is: 0 (R0)
L_DrawScreen46:
; it start address is: 0 (R0)
CMP	R0, #255
IT	GT
BGT	L_DrawScreen47
;ThermalCameraDemo_driver.c,716 :: 		TFT_Set_DBC_SSD1963(it);
STRH	R0, [SP, #4]
UXTB	R0, R0
BL	_TFT_Set_DBC_SSD1963+0
LDRSH	R0, [SP, #4]
;ThermalCameraDemo_driver.c,717 :: 		Delay_1ms( );
BL	_Delay_1ms+0
;ThermalCameraDemo_driver.c,714 :: 		for (it = 0; it <= 255; it++)
ADDS	R1, R0, #1
; it end address is: 0 (R0)
; it start address is: 4 (R1)
;ThermalCameraDemo_driver.c,718 :: 		}
SXTH	R0, R1
; it end address is: 4 (R1)
IT	AL
BAL	L_DrawScreen46
L_DrawScreen47:
;ThermalCameraDemo_driver.c,719 :: 		}
L_end_DrawScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #44
BX	LR
; end of _DrawScreen
_Get_Object:
;ThermalCameraDemo_driver.c,721 :: 		void Get_Object(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;ThermalCameraDemo_driver.c,722 :: 		button_order        = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
STRH	R3, [R2, #0]
;ThermalCameraDemo_driver.c,723 :: 		label_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;ThermalCameraDemo_driver.c,724 :: 		image_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;ThermalCameraDemo_driver.c,725 :: 		box_order           = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
STRH	R3, [R2, #0]
;ThermalCameraDemo_driver.c,727 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ButtonsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 0 (R0)
; Y end address is: 4 (R1)
UXTH	R8, R0
UXTH	R7, R1
L_Get_Object49:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object50
;ThermalCameraDemo_driver.c,728 :: 		local_button = GetButton(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #12
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_button+0)
MOVT	R2, #hi_addr(_local_button+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,729 :: 		if (local_button->Active != 0) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object52
;ThermalCameraDemo_driver.c,731 :: 		local_button->Width, local_button->Height) == 1) {
MOVW	R6, #lo_addr(_local_button+0)
MOVT	R6, #hi_addr(_local_button+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;ThermalCameraDemo_driver.c,730 :: 		if (IsInsideObject(X, Y, local_button->Left, local_button->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;ThermalCameraDemo_driver.c,731 :: 		local_button->Width, local_button->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	ThermalCameraDemo_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object53
;ThermalCameraDemo_driver.c,732 :: 		button_order = local_button->Order;
MOVW	R4, #lo_addr(_local_button+0)
MOVT	R4, #hi_addr(_local_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
STRH	R3, [R2, #0]
;ThermalCameraDemo_driver.c,733 :: 		exec_button = local_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,734 :: 		}
L_Get_Object53:
;ThermalCameraDemo_driver.c,735 :: 		}
L_Get_Object52:
;ThermalCameraDemo_driver.c,727 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ButtonsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;ThermalCameraDemo_driver.c,736 :: 		}
IT	AL
BAL	L_Get_Object49
L_Get_Object50:
;ThermalCameraDemo_driver.c,739 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object54:
; X start address is: 28 (R7)
; Y start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #16
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object55
;ThermalCameraDemo_driver.c,740 :: 		local_label = GetLabel(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #20
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_label+0)
MOVT	R2, #hi_addr(_local_label+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,741 :: 		if (local_label->Active != 0) {
ADDW	R2, R3, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object57
;ThermalCameraDemo_driver.c,743 :: 		local_label->Width, local_label->Height) == 1) {
MOVW	R6, #lo_addr(_local_label+0)
MOVT	R6, #hi_addr(_local_label+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;ThermalCameraDemo_driver.c,742 :: 		if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;ThermalCameraDemo_driver.c,743 :: 		local_label->Width, local_label->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	ThermalCameraDemo_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object58
;ThermalCameraDemo_driver.c,744 :: 		label_order = local_label->Order;
MOVW	R4, #lo_addr(_local_label+0)
MOVT	R4, #hi_addr(_local_label+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;ThermalCameraDemo_driver.c,745 :: 		exec_label = local_label;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,746 :: 		}
L_Get_Object58:
;ThermalCameraDemo_driver.c,747 :: 		}
L_Get_Object57:
;ThermalCameraDemo_driver.c,739 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;ThermalCameraDemo_driver.c,748 :: 		}
IT	AL
BAL	L_Get_Object54
L_Get_Object55:
;ThermalCameraDemo_driver.c,751 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object59:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #24
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object60
;ThermalCameraDemo_driver.c,752 :: 		local_image = GetImage(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_image+0)
MOVT	R2, #hi_addr(_local_image+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,753 :: 		if (local_image->Active != 0) {
ADDW	R2, R3, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object62
;ThermalCameraDemo_driver.c,755 :: 		local_image->Width, local_image->Height) == 1) {
MOVW	R6, #lo_addr(_local_image+0)
MOVT	R6, #hi_addr(_local_image+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;ThermalCameraDemo_driver.c,754 :: 		if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;ThermalCameraDemo_driver.c,755 :: 		local_image->Width, local_image->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	ThermalCameraDemo_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object63
;ThermalCameraDemo_driver.c,756 :: 		image_order = local_image->Order;
MOVW	R4, #lo_addr(_local_image+0)
MOVT	R4, #hi_addr(_local_image+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;ThermalCameraDemo_driver.c,757 :: 		exec_image = local_image;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,758 :: 		}
L_Get_Object63:
;ThermalCameraDemo_driver.c,759 :: 		}
L_Get_Object62:
;ThermalCameraDemo_driver.c,751 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;ThermalCameraDemo_driver.c,760 :: 		}
IT	AL
BAL	L_Get_Object59
L_Get_Object60:
;ThermalCameraDemo_driver.c,763 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object64:
; Y start address is: 32 (R8)
; X start address is: 28 (R7)
; X start address is: 28 (R7)
; X end address is: 28 (R7)
; Y start address is: 32 (R8)
; Y end address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #32
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object65
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
;ThermalCameraDemo_driver.c,764 :: 		local_box = GetBox(_object_count);
; Y start address is: 32 (R8)
; X start address is: 28 (R7)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #36
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_box+0)
MOVT	R2, #hi_addr(_local_box+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,765 :: 		if (local_box->Active != 0) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object67
;ThermalCameraDemo_driver.c,767 :: 		local_box->Width, local_box->Height) == 1) {
MOVW	R6, #lo_addr(_local_box+0)
MOVT	R6, #hi_addr(_local_box+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;ThermalCameraDemo_driver.c,766 :: 		if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;ThermalCameraDemo_driver.c,767 :: 		local_box->Width, local_box->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	ThermalCameraDemo_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object68
;ThermalCameraDemo_driver.c,768 :: 		box_order = local_box->Order;
MOVW	R4, #lo_addr(_local_box+0)
MOVT	R4, #hi_addr(_local_box+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
STRH	R3, [R2, #0]
;ThermalCameraDemo_driver.c,769 :: 		exec_box = local_box;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,770 :: 		}
L_Get_Object68:
;ThermalCameraDemo_driver.c,771 :: 		}
L_Get_Object67:
;ThermalCameraDemo_driver.c,763 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;ThermalCameraDemo_driver.c,772 :: 		}
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
IT	AL
BAL	L_Get_Object64
L_Get_Object65:
;ThermalCameraDemo_driver.c,774 :: 		_object_count = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
;ThermalCameraDemo_driver.c,775 :: 		if (button_order >  _object_count )
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	LE
BLE	L_Get_Object69
;ThermalCameraDemo_driver.c,776 :: 		_object_count = button_order;
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object69:
;ThermalCameraDemo_driver.c,777 :: 		if (label_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object70
;ThermalCameraDemo_driver.c,778 :: 		_object_count = label_order;
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object70:
;ThermalCameraDemo_driver.c,779 :: 		if (image_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object71
;ThermalCameraDemo_driver.c,780 :: 		_object_count = image_order;
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object71:
;ThermalCameraDemo_driver.c,781 :: 		if (box_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object72
;ThermalCameraDemo_driver.c,782 :: 		_object_count = box_order;
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object72:
;ThermalCameraDemo_driver.c,783 :: 		}
L_end_Get_Object:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Get_Object
_Process_TP_Press:
;ThermalCameraDemo_driver.c,786 :: 		void Process_TP_Press(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;ThermalCameraDemo_driver.c,787 :: 		exec_button         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,788 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,789 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,790 :: 		exec_box            = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,792 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;ThermalCameraDemo_driver.c,794 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Press73
;ThermalCameraDemo_driver.c,795 :: 		if (_object_count == button_order) {
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press74
;ThermalCameraDemo_driver.c,796 :: 		if (exec_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press75
;ThermalCameraDemo_driver.c,797 :: 		if (exec_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press76
;ThermalCameraDemo_driver.c,798 :: 		exec_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R2, [R4, #0]
BLX	R2
;ThermalCameraDemo_driver.c,799 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;ThermalCameraDemo_driver.c,800 :: 		}
L_Process_TP_Press76:
;ThermalCameraDemo_driver.c,801 :: 		}
L_Process_TP_Press75:
;ThermalCameraDemo_driver.c,802 :: 		}
L_Process_TP_Press74:
;ThermalCameraDemo_driver.c,804 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press77
;ThermalCameraDemo_driver.c,805 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press78
;ThermalCameraDemo_driver.c,806 :: 		if (exec_label->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press79
;ThermalCameraDemo_driver.c,807 :: 		exec_label->OnPressPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
;ThermalCameraDemo_driver.c,808 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;ThermalCameraDemo_driver.c,809 :: 		}
L_Process_TP_Press79:
;ThermalCameraDemo_driver.c,810 :: 		}
L_Process_TP_Press78:
;ThermalCameraDemo_driver.c,811 :: 		}
L_Process_TP_Press77:
;ThermalCameraDemo_driver.c,813 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press80
;ThermalCameraDemo_driver.c,814 :: 		if (exec_image->Active != 0) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press81
;ThermalCameraDemo_driver.c,815 :: 		if (exec_image->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press82
;ThermalCameraDemo_driver.c,816 :: 		exec_image->OnPressPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;ThermalCameraDemo_driver.c,817 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;ThermalCameraDemo_driver.c,818 :: 		}
L_Process_TP_Press82:
;ThermalCameraDemo_driver.c,819 :: 		}
L_Process_TP_Press81:
;ThermalCameraDemo_driver.c,820 :: 		}
L_Process_TP_Press80:
;ThermalCameraDemo_driver.c,822 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press83
;ThermalCameraDemo_driver.c,823 :: 		if (exec_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press84
;ThermalCameraDemo_driver.c,824 :: 		if (exec_box->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press85
;ThermalCameraDemo_driver.c,825 :: 		exec_box->OnPressPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R2, [R4, #0]
BLX	R2
;ThermalCameraDemo_driver.c,826 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;ThermalCameraDemo_driver.c,827 :: 		}
L_Process_TP_Press85:
;ThermalCameraDemo_driver.c,828 :: 		}
L_Process_TP_Press84:
;ThermalCameraDemo_driver.c,829 :: 		}
L_Process_TP_Press83:
;ThermalCameraDemo_driver.c,831 :: 		}
L_Process_TP_Press73:
;ThermalCameraDemo_driver.c,832 :: 		}
L_end_Process_TP_Press:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Process_TP_Press
_Process_TP_Up:
;ThermalCameraDemo_driver.c,834 :: 		void Process_TP_Up(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;ThermalCameraDemo_driver.c,836 :: 		switch (PressedObjectType) {
IT	AL
BAL	L_Process_TP_Up86
;ThermalCameraDemo_driver.c,838 :: 		case 0: {
L_Process_TP_Up88:
;ThermalCameraDemo_driver.c,839 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up89
;ThermalCameraDemo_driver.c,840 :: 		exec_button = (TButton*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,841 :: 		if ((exec_button->PressColEnabled != 0) && (exec_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #48
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__Process_TP_Up165
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up164
L__Process_TP_Up163:
;ThermalCameraDemo_driver.c,842 :: 		DrawButton(exec_button);
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;ThermalCameraDemo_driver.c,841 :: 		if ((exec_button->PressColEnabled != 0) && (exec_button->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up165:
L__Process_TP_Up164:
;ThermalCameraDemo_driver.c,844 :: 		break;
IT	AL
BAL	L_Process_TP_Up87
;ThermalCameraDemo_driver.c,845 :: 		}
L_Process_TP_Up89:
;ThermalCameraDemo_driver.c,846 :: 		break;
IT	AL
BAL	L_Process_TP_Up87
;ThermalCameraDemo_driver.c,849 :: 		case 6: {
L_Process_TP_Up93:
;ThermalCameraDemo_driver.c,850 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up94
;ThermalCameraDemo_driver.c,851 :: 		exec_box = (TBox*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,852 :: 		if ((exec_box->PressColEnabled != 0) && (exec_box->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__Process_TP_Up167
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up166
L__Process_TP_Up162:
;ThermalCameraDemo_driver.c,853 :: 		DrawBox(exec_box);
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawBox+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;ThermalCameraDemo_driver.c,852 :: 		if ((exec_box->PressColEnabled != 0) && (exec_box->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up167:
L__Process_TP_Up166:
;ThermalCameraDemo_driver.c,855 :: 		break;
IT	AL
BAL	L_Process_TP_Up87
;ThermalCameraDemo_driver.c,856 :: 		}
L_Process_TP_Up94:
;ThermalCameraDemo_driver.c,857 :: 		break;
IT	AL
BAL	L_Process_TP_Up87
;ThermalCameraDemo_driver.c,859 :: 		}
L_Process_TP_Up86:
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up88
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #6
IT	EQ
BEQ	L_Process_TP_Up93
L_Process_TP_Up87:
;ThermalCameraDemo_driver.c,861 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,862 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,864 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;ThermalCameraDemo_driver.c,867 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Up98
;ThermalCameraDemo_driver.c,869 :: 		if (_object_count == button_order) {
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up99
;ThermalCameraDemo_driver.c,870 :: 		if (exec_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up100
;ThermalCameraDemo_driver.c,871 :: 		if (exec_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up101
;ThermalCameraDemo_driver.c,872 :: 		exec_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up101:
;ThermalCameraDemo_driver.c,873 :: 		if (PressedObject == (void *)exec_button)
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up102
;ThermalCameraDemo_driver.c,874 :: 		if (exec_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up103
;ThermalCameraDemo_driver.c,875 :: 		exec_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up103:
L_Process_TP_Up102:
;ThermalCameraDemo_driver.c,876 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,877 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;ThermalCameraDemo_driver.c,878 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;ThermalCameraDemo_driver.c,879 :: 		}
L_Process_TP_Up100:
;ThermalCameraDemo_driver.c,880 :: 		}
L_Process_TP_Up99:
;ThermalCameraDemo_driver.c,883 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up104
;ThermalCameraDemo_driver.c,884 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up105
;ThermalCameraDemo_driver.c,885 :: 		if (exec_label->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up106
;ThermalCameraDemo_driver.c,886 :: 		exec_label->OnUpPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up106:
;ThermalCameraDemo_driver.c,887 :: 		if (PressedObject == (void *)exec_label)
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up107
;ThermalCameraDemo_driver.c,888 :: 		if (exec_label->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up108
;ThermalCameraDemo_driver.c,889 :: 		exec_label->OnClickPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up108:
L_Process_TP_Up107:
;ThermalCameraDemo_driver.c,890 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,891 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;ThermalCameraDemo_driver.c,892 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;ThermalCameraDemo_driver.c,893 :: 		}
L_Process_TP_Up105:
;ThermalCameraDemo_driver.c,894 :: 		}
L_Process_TP_Up104:
;ThermalCameraDemo_driver.c,897 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up109
;ThermalCameraDemo_driver.c,898 :: 		if (exec_image->Active != 0) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up110
;ThermalCameraDemo_driver.c,899 :: 		if (exec_image->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up111
;ThermalCameraDemo_driver.c,900 :: 		exec_image->OnUpPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up111:
;ThermalCameraDemo_driver.c,901 :: 		if (PressedObject == (void *)exec_image)
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up112
;ThermalCameraDemo_driver.c,902 :: 		if (exec_image->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up113
;ThermalCameraDemo_driver.c,903 :: 		exec_image->OnClickPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up113:
L_Process_TP_Up112:
;ThermalCameraDemo_driver.c,904 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,905 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;ThermalCameraDemo_driver.c,906 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;ThermalCameraDemo_driver.c,907 :: 		}
L_Process_TP_Up110:
;ThermalCameraDemo_driver.c,908 :: 		}
L_Process_TP_Up109:
;ThermalCameraDemo_driver.c,911 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up114
;ThermalCameraDemo_driver.c,912 :: 		if (exec_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up115
;ThermalCameraDemo_driver.c,913 :: 		if (exec_box->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up116
;ThermalCameraDemo_driver.c,914 :: 		exec_box->OnUpPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up116:
;ThermalCameraDemo_driver.c,915 :: 		if (PressedObject == (void *)exec_box)
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up117
;ThermalCameraDemo_driver.c,916 :: 		if (exec_box->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up118
;ThermalCameraDemo_driver.c,917 :: 		exec_box->OnClickPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up118:
L_Process_TP_Up117:
;ThermalCameraDemo_driver.c,918 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,919 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;ThermalCameraDemo_driver.c,920 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;ThermalCameraDemo_driver.c,921 :: 		}
L_Process_TP_Up115:
;ThermalCameraDemo_driver.c,922 :: 		}
L_Process_TP_Up114:
;ThermalCameraDemo_driver.c,924 :: 		}
L_Process_TP_Up98:
;ThermalCameraDemo_driver.c,925 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,926 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;ThermalCameraDemo_driver.c,927 :: 		}
L_end_Process_TP_Up:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Process_TP_Up
_Process_TP_Down:
;ThermalCameraDemo_driver.c,929 :: 		void Process_TP_Down(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;ThermalCameraDemo_driver.c,931 :: 		object_pressed      = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;ThermalCameraDemo_driver.c,932 :: 		exec_button         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,933 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,934 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,935 :: 		exec_box            = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,937 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;ThermalCameraDemo_driver.c,939 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Down119
;ThermalCameraDemo_driver.c,940 :: 		if (_object_count == button_order) {
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down120
;ThermalCameraDemo_driver.c,941 :: 		if (exec_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down121
;ThermalCameraDemo_driver.c,942 :: 		if (exec_button->PressColEnabled != 0) {
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #48
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down122
;ThermalCameraDemo_driver.c,943 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;ThermalCameraDemo_driver.c,944 :: 		DrawButton(exec_button);
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawButton+0
;ThermalCameraDemo_driver.c,945 :: 		}
L_Process_TP_Down122:
;ThermalCameraDemo_driver.c,946 :: 		PressedObject = (void *)exec_button;
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,947 :: 		PressedObjectType = 0;
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;ThermalCameraDemo_driver.c,948 :: 		if (exec_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down123
;ThermalCameraDemo_driver.c,949 :: 		exec_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
;ThermalCameraDemo_driver.c,950 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;ThermalCameraDemo_driver.c,951 :: 		}
L_Process_TP_Down123:
;ThermalCameraDemo_driver.c,952 :: 		}
L_Process_TP_Down121:
;ThermalCameraDemo_driver.c,953 :: 		}
L_Process_TP_Down120:
;ThermalCameraDemo_driver.c,955 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down124
;ThermalCameraDemo_driver.c,956 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down125
;ThermalCameraDemo_driver.c,957 :: 		PressedObject = (void *)exec_label;
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,958 :: 		PressedObjectType = 2;
MOVS	R3, #2
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;ThermalCameraDemo_driver.c,959 :: 		if (exec_label->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down126
;ThermalCameraDemo_driver.c,960 :: 		exec_label->OnDownPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;ThermalCameraDemo_driver.c,961 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;ThermalCameraDemo_driver.c,962 :: 		}
L_Process_TP_Down126:
;ThermalCameraDemo_driver.c,963 :: 		}
L_Process_TP_Down125:
;ThermalCameraDemo_driver.c,964 :: 		}
L_Process_TP_Down124:
;ThermalCameraDemo_driver.c,966 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down127
;ThermalCameraDemo_driver.c,967 :: 		if (exec_image->Active != 0) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down128
;ThermalCameraDemo_driver.c,968 :: 		PressedObject = (void *)exec_image;
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,969 :: 		PressedObjectType = 3;
MOVS	R3, #3
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;ThermalCameraDemo_driver.c,970 :: 		if (exec_image->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down129
;ThermalCameraDemo_driver.c,971 :: 		exec_image->OnDownPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
;ThermalCameraDemo_driver.c,972 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;ThermalCameraDemo_driver.c,973 :: 		}
L_Process_TP_Down129:
;ThermalCameraDemo_driver.c,974 :: 		}
L_Process_TP_Down128:
;ThermalCameraDemo_driver.c,975 :: 		}
L_Process_TP_Down127:
;ThermalCameraDemo_driver.c,977 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down130
;ThermalCameraDemo_driver.c,978 :: 		if (exec_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down131
;ThermalCameraDemo_driver.c,979 :: 		if (exec_box->PressColEnabled != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down132
;ThermalCameraDemo_driver.c,980 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;ThermalCameraDemo_driver.c,981 :: 		DrawBox(exec_box);
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawBox+0
;ThermalCameraDemo_driver.c,982 :: 		}
L_Process_TP_Down132:
;ThermalCameraDemo_driver.c,983 :: 		PressedObject = (void *)exec_box;
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;ThermalCameraDemo_driver.c,984 :: 		PressedObjectType = 6;
MOVS	R3, #6
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;ThermalCameraDemo_driver.c,985 :: 		if (exec_box->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down133
;ThermalCameraDemo_driver.c,986 :: 		exec_box->OnDownPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;ThermalCameraDemo_driver.c,987 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;ThermalCameraDemo_driver.c,988 :: 		}
L_Process_TP_Down133:
;ThermalCameraDemo_driver.c,989 :: 		}
L_Process_TP_Down131:
;ThermalCameraDemo_driver.c,990 :: 		}
L_Process_TP_Down130:
;ThermalCameraDemo_driver.c,992 :: 		}
L_Process_TP_Down119:
;ThermalCameraDemo_driver.c,993 :: 		}
L_end_Process_TP_Down:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Process_TP_Down
_Check_TP:
;ThermalCameraDemo_driver.c,995 :: 		void Check_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ThermalCameraDemo_driver.c,996 :: 		if (FT5XX6_PressDetect()) {
BL	_FT5XX6_PressDetect+0
CMP	R0, #0
IT	EQ
BEQ	L_Check_TP134
;ThermalCameraDemo_driver.c,997 :: 		if (FT5XX6_GetCoordinates(&Xcoord, &Ycoord) == 0) {
MOVW	R1, #lo_addr(_Ycoord+0)
MOVT	R1, #hi_addr(_Ycoord+0)
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
BL	_FT5XX6_GetCoordinates+0
CMP	R0, #0
IT	NE
BNE	L_Check_TP135
;ThermalCameraDemo_driver.c,999 :: 		Process_TP_Press(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Press+0
;ThermalCameraDemo_driver.c,1000 :: 		if (PenDown == 0) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Check_TP136
;ThermalCameraDemo_driver.c,1001 :: 		PenDown = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,1002 :: 		Process_TP_Down(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Down+0
;ThermalCameraDemo_driver.c,1003 :: 		}
L_Check_TP136:
;ThermalCameraDemo_driver.c,1004 :: 		}
L_Check_TP135:
;ThermalCameraDemo_driver.c,1005 :: 		}
IT	AL
BAL	L_Check_TP137
L_Check_TP134:
;ThermalCameraDemo_driver.c,1006 :: 		else if (PenDown == 1) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Check_TP138
;ThermalCameraDemo_driver.c,1007 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;ThermalCameraDemo_driver.c,1008 :: 		Process_TP_Up(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Up+0
;ThermalCameraDemo_driver.c,1009 :: 		}
L_Check_TP138:
L_Check_TP137:
;ThermalCameraDemo_driver.c,1010 :: 		}
L_end_Check_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Check_TP
_Init_MCU:
;ThermalCameraDemo_driver.c,1012 :: 		void Init_MCU()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ThermalCameraDemo_driver.c,1014 :: 		GPIO_Digital_Output(&GPIOF_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Output+0
;ThermalCameraDemo_driver.c,1015 :: 		GPIO_Digital_Input(&GPIOF_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Input+0
;ThermalCameraDemo_driver.c,1016 :: 		GPIOF_ODR.B1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOF_ODR+0)
MOVT	R0, #hi_addr(GPIOF_ODR+0)
_SX	[R0, ByteOffset(GPIOF_ODR+0)]
;ThermalCameraDemo_driver.c,1017 :: 		while (GPIOF_IDR.B0 == 0) {
L_Init_MCU139:
MOVW	R0, #lo_addr(GPIOF_IDR+0)
MOVT	R0, #hi_addr(GPIOF_IDR+0)
_LX	[R0, ByteOffset(GPIOF_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_Init_MCU140
;ThermalCameraDemo_driver.c,1018 :: 		GPIOF_ODR.B1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOF_ODR+0)
MOVT	R0, #hi_addr(GPIOF_ODR+0)
_SX	[R0, ByteOffset(GPIOF_ODR+0)]
;ThermalCameraDemo_driver.c,1019 :: 		Delay_us(10);
MOVW	R7, #558
MOVT	R7, #0
NOP
NOP
L_Init_MCU141:
SUBS	R7, R7, #1
BNE	L_Init_MCU141
NOP
NOP
NOP
;ThermalCameraDemo_driver.c,1020 :: 		GPIOF_ODR.B1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOF_ODR+0)
MOVT	R0, #hi_addr(GPIOF_ODR+0)
_SX	[R0, ByteOffset(GPIOF_ODR+0)]
;ThermalCameraDemo_driver.c,1021 :: 		Delay_us(10);
MOVW	R7, #558
MOVT	R7, #0
NOP
NOP
L_Init_MCU143:
SUBS	R7, R7, #1
BNE	L_Init_MCU143
NOP
NOP
NOP
;ThermalCameraDemo_driver.c,1022 :: 		}
IT	AL
BAL	L_Init_MCU139
L_Init_MCU140:
;ThermalCameraDemo_driver.c,1023 :: 		I2C2_Init_Advanced(400000, &_GPIO_MODULE_I2C2_PF01);
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C2_PF01+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C2_PF01+0)
MOVW	R0, #6784
MOVT	R0, #6
BL	_I2C2_Init_Advanced+0
;ThermalCameraDemo_driver.c,1025 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;ThermalCameraDemo_driver.c,1026 :: 		}
L_end_Init_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_MCU
_MMC_TimeoutCallback:
;ThermalCameraDemo_driver.c,1028 :: 		void MMC_TimeoutCallback(char errorCode){
;ThermalCameraDemo_driver.c,1038 :: 		}
L_end_MMC_TimeoutCallback:
BX	LR
; end of _MMC_TimeoutCallback
_Init_Ext_Mem:
;ThermalCameraDemo_driver.c,1040 :: 		void Init_Ext_Mem() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ThermalCameraDemo_driver.c,1041 :: 		rfStartSect = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_rfStartSect+0)
MOVT	R0, #hi_addr(_rfStartSect+0)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,1042 :: 		rfName = "ThermalC.RES";
MOVW	R1, #lo_addr(?lstr1_ThermalCameraDemo_driver+0)
MOVT	R1, #hi_addr(?lstr1_ThermalCameraDemo_driver+0)
MOVW	R0, #lo_addr(_rfName+0)
MOVT	R0, #hi_addr(_rfName+0)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,1044 :: 		mmc_timeout.cmd_timeout = 10000;
MOVW	R1, #10000
MOVW	R0, #lo_addr(_mmc_timeout+0)
MOVT	R0, #hi_addr(_mmc_timeout+0)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,1045 :: 		mmc_timeout.spi_timeout = 10000;
MOVW	R1, #10000
MOVW	R0, #lo_addr(_mmc_timeout+4)
MOVT	R0, #hi_addr(_mmc_timeout+4)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,1046 :: 		mmc_timeout.init_timeout = 10000;
MOVW	R1, #10000
MOVW	R0, #lo_addr(_mmc_timeout+8)
MOVT	R0, #hi_addr(_mmc_timeout+8)
STR	R1, [R0, #0]
;ThermalCameraDemo_driver.c,1047 :: 		Mmc_SetTimeoutCallback(&mmc_timeout,&MMC_TimeoutCallback);
MOVW	R1, #lo_addr(_MMC_TimeoutCallback+0)
MOVT	R1, #hi_addr(_MMC_TimeoutCallback+0)
MOVW	R0, #lo_addr(_mmc_timeout+0)
MOVT	R0, #hi_addr(_mmc_timeout+0)
BL	_Mmc_SetTimeoutCallback+0
;ThermalCameraDemo_driver.c,1050 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;ThermalCameraDemo_driver.c,1051 :: 		Mmc_Chip_Select = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;ThermalCameraDemo_driver.c,1055 :: 		&_GPIO_MODULE_SPI1_PA56_PB5);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI1_PA56_PB5+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI1_PA56_PB5+0)
;ThermalCameraDemo_driver.c,1054 :: 		_SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
MOVW	R1, #772
;ThermalCameraDemo_driver.c,1052 :: 		SPI1_Init_Advanced(_SPI_FPCLK_DIV64, _SPI_MASTER | _SPI_8_BIT |
MOVS	R0, #5
;ThermalCameraDemo_driver.c,1055 :: 		&_GPIO_MODULE_SPI1_PA56_PB5);
BL	_SPI1_Init_Advanced+0
;ThermalCameraDemo_driver.c,1057 :: 		if (FAT32_Init() == 0)
BL	_FAT32_Init+0
CMP	R0, #0
IT	NE
BNE	L_Init_Ext_Mem148
;ThermalCameraDemo_driver.c,1061 :: 		&_GPIO_MODULE_SPI1_PA56_PB5);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI1_PA56_PB5+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI1_PA56_PB5+0)
;ThermalCameraDemo_driver.c,1060 :: 		_SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
MOVW	R1, #772
;ThermalCameraDemo_driver.c,1058 :: 		SPI1_Init_Advanced(_SPI_FPCLK_DIV8, _SPI_MASTER | _SPI_8_BIT |
MOVS	R0, #2
;ThermalCameraDemo_driver.c,1061 :: 		&_GPIO_MODULE_SPI1_PA56_PB5);
BL	_SPI1_Init_Advanced+0
L_Init_Ext_Mem148:
;ThermalCameraDemo_driver.c,1064 :: 		rfHandle = FAT32_Open(rfName, 0x01);
MOVW	R0, #lo_addr(_rfName+0)
MOVT	R0, #hi_addr(_rfName+0)
LDR	R0, [R0, #0]
MOVS	R1, #1
BL	_FAT32_Open+0
MOVW	R1, #lo_addr(_rfHandle+0)
MOVT	R1, #hi_addr(_rfHandle+0)
STRB	R0, [R1, #0]
;ThermalCameraDemo_driver.c,1065 :: 		rfStartSect = FAT32_ClustToSect(fat32_fdesc[rfHandle]._1stClust);
MOVS	R1, #28
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_fat32_fdesc+0)
MOVT	R0, #hi_addr(_fat32_fdesc+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
BL	_FAT32_ClustToSect+0
MOVW	R1, #lo_addr(_rfStartSect+0)
MOVT	R1, #hi_addr(_rfStartSect+0)
STR	R0, [R1, #0]
;ThermalCameraDemo_driver.c,1066 :: 		}
L_end_Init_Ext_Mem:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_Ext_Mem
_FT5XX6_Config:
;ThermalCameraDemo_driver.c,1068 :: 		char FT5XX6_Config()  {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ThermalCameraDemo_driver.c,1069 :: 		FT5XX6_SetI2CAddress(0x38);
MOVS	R0, #56
BL	_FT5XX6_SetI2CAddress+0
;ThermalCameraDemo_driver.c,1070 :: 		if (FT5XX6_IsOperational() != FT5XX6_OK)
BL	_FT5XX6_IsOperational+0
CMP	R0, #0
IT	EQ
BEQ	L_FT5XX6_Config149
;ThermalCameraDemo_driver.c,1071 :: 		return  FT5XX6_FAILURE;
MOVS	R0, #1
IT	AL
BAL	L_end_FT5XX6_Config
L_FT5XX6_Config149:
;ThermalCameraDemo_driver.c,1072 :: 		FT5XX6_SetDefaultMode();
BL	_FT5XX6_SetDefaultMode+0
;ThermalCameraDemo_driver.c,1073 :: 		FT5XX6_SetController(_TC_FT5X06);
MOVS	R0, #1
BL	_FT5XX6_SetController+0
;ThermalCameraDemo_driver.c,1074 :: 		FT5XX6_SetSizeAndRotation(800,480,2);
MOVS	R2, #2
MOVW	R1, #480
MOVW	R0, #800
BL	_FT5XX6_SetSizeAndRotation+0
;ThermalCameraDemo_driver.c,1075 :: 		return FT5XX6_OK;
MOVS	R0, #0
;ThermalCameraDemo_driver.c,1076 :: 		}
L_end_FT5XX6_Config:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FT5XX6_Config
_Start_TP:
;ThermalCameraDemo_driver.c,1078 :: 		void Start_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ThermalCameraDemo_driver.c,1079 :: 		Init_MCU();
BL	_Init_MCU+0
;ThermalCameraDemo_driver.c,1081 :: 		Init_Ext_Mem();
BL	_Init_Ext_Mem+0
;ThermalCameraDemo_driver.c,1083 :: 		InitializeTouchPanel();
BL	ThermalCameraDemo_driver_InitializeTouchPanel+0
;ThermalCameraDemo_driver.c,1084 :: 		if (FT5XX6_Config() == FT5XX6_OK) {
BL	_FT5XX6_Config+0
CMP	R0, #0
IT	NE
BNE	L_Start_TP150
;ThermalCameraDemo_driver.c,1085 :: 		} else {
IT	AL
BAL	L_Start_TP151
L_Start_TP150:
;ThermalCameraDemo_driver.c,1086 :: 		while(1);
L_Start_TP152:
IT	AL
BAL	L_Start_TP152
;ThermalCameraDemo_driver.c,1087 :: 		}
L_Start_TP151:
;ThermalCameraDemo_driver.c,1090 :: 		InitializeObjects();
BL	ThermalCameraDemo_driver_InitializeObjects+0
;ThermalCameraDemo_driver.c,1091 :: 		display_width = Screen2.Width;
MOVW	R0, #lo_addr(_Screen2+2)
MOVT	R0, #hi_addr(_Screen2+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_width+0)
MOVT	R0, #hi_addr(_display_width+0)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,1092 :: 		display_height = Screen2.Height;
MOVW	R0, #lo_addr(_Screen2+4)
MOVT	R0, #hi_addr(_Screen2+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_height+0)
MOVT	R0, #hi_addr(_display_height+0)
STRH	R1, [R0, #0]
;ThermalCameraDemo_driver.c,1093 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;ThermalCameraDemo_driver.c,1094 :: 		}
L_end_Start_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Start_TP
ThermalCameraDemo_driver____?ag:
L_end_ThermalCameraDemo_driver___?ag:
BX	LR
; end of ThermalCameraDemo_driver____?ag
