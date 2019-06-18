_Button_min_pOnClick:
;ThermalCameraDemo_events_code.c,386 :: 		void Button_min_pOnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ThermalCameraDemo_events_code.c,388 :: 		TFT_Set_Font(&Tahoma40x40_kaca, 0xFFFF, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Tahoma40x40_kaca+0)
MOVT	R0, #hi_addr(_Tahoma40x40_kaca+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_events_code.c,389 :: 		IntToStr(_min_value, demoText);
MOVW	R0, #lo_addr(__min_value+0)
MOVT	R0, #hi_addr(__min_value+0)
LDRSB	R0, [R0, #0]
MOVW	R1, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_events_code.c,390 :: 		TFT_Write_Text(demoText, 180, 75);
MOVS	R2, #75
MOVS	R1, #180
MOVW	R0, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_events_code.c,391 :: 		_min_value++;
MOVW	R1, #lo_addr(__min_value+0)
MOVT	R1, #hi_addr(__min_value+0)
LDRSB	R0, [R1, #0]
ADDS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;ThermalCameraDemo_events_code.c,392 :: 		IntToStr(_min_value, demoText);
MOVW	R1, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_events_code.c,393 :: 		TFT_Set_Font(&Tahoma40x40_kaca, 0x0000, FO_HORIZONTAL);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Tahoma40x40_kaca+0)
MOVT	R0, #hi_addr(_Tahoma40x40_kaca+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_events_code.c,394 :: 		TFT_Write_Text(demoText, 180, 75);
MOVS	R2, #75
MOVS	R1, #180
MOVW	R0, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_events_code.c,395 :: 		}
L_end_Button_min_pOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button_min_pOnClick
_Button_min_mOnClick:
;ThermalCameraDemo_events_code.c,396 :: 		void Button_min_mOnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ThermalCameraDemo_events_code.c,397 :: 		TFT_Set_Font(&Tahoma40x40_kaca, 0xFFFF, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Tahoma40x40_kaca+0)
MOVT	R0, #hi_addr(_Tahoma40x40_kaca+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_events_code.c,398 :: 		IntToStr(_min_value, demoText);
MOVW	R0, #lo_addr(__min_value+0)
MOVT	R0, #hi_addr(__min_value+0)
LDRSB	R0, [R0, #0]
MOVW	R1, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_events_code.c,399 :: 		TFT_Write_Text(demoText, 180, 75);
MOVS	R2, #75
MOVS	R1, #180
MOVW	R0, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_events_code.c,400 :: 		_min_value--;
MOVW	R1, #lo_addr(__min_value+0)
MOVT	R1, #hi_addr(__min_value+0)
LDRSB	R0, [R1, #0]
SUBS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;ThermalCameraDemo_events_code.c,401 :: 		IntToStr(_min_value, demoText);
MOVW	R1, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_events_code.c,402 :: 		TFT_Set_Font(&Tahoma40x40_kaca, 0x0000, FO_HORIZONTAL);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Tahoma40x40_kaca+0)
MOVT	R0, #hi_addr(_Tahoma40x40_kaca+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_events_code.c,403 :: 		TFT_Write_Text(demoText, 180, 75);
MOVS	R2, #75
MOVS	R1, #180
MOVW	R0, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_events_code.c,404 :: 		}
L_end_Button_min_mOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button_min_mOnClick
_Button_low_pOnClick:
;ThermalCameraDemo_events_code.c,405 :: 		void Button_low_pOnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ThermalCameraDemo_events_code.c,406 :: 		TFT_Set_Font(&Tahoma40x40_kaca, 0xFFFF, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Tahoma40x40_kaca+0)
MOVT	R0, #hi_addr(_Tahoma40x40_kaca+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_events_code.c,407 :: 		IntToStr(_low_value, demoText);
MOVW	R0, #lo_addr(__low_value+0)
MOVT	R0, #hi_addr(__low_value+0)
LDRSB	R0, [R0, #0]
MOVW	R1, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_events_code.c,408 :: 		TFT_Write_Text(demoText, 180, 155);
MOVS	R2, #155
MOVS	R1, #180
MOVW	R0, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_events_code.c,409 :: 		_low_value++;
MOVW	R1, #lo_addr(__low_value+0)
MOVT	R1, #hi_addr(__low_value+0)
LDRSB	R0, [R1, #0]
ADDS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;ThermalCameraDemo_events_code.c,410 :: 		IntToStr(_low_value, demoText);
MOVW	R1, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_events_code.c,411 :: 		TFT_Set_Font(&Tahoma40x40_kaca, 0x0000, FO_HORIZONTAL);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Tahoma40x40_kaca+0)
MOVT	R0, #hi_addr(_Tahoma40x40_kaca+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_events_code.c,412 :: 		TFT_Write_Text(demoText, 180, 155);
MOVS	R2, #155
MOVS	R1, #180
MOVW	R0, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_events_code.c,413 :: 		}
L_end_Button_low_pOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button_low_pOnClick
_Button_low_mOnClick:
;ThermalCameraDemo_events_code.c,414 :: 		void Button_low_mOnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ThermalCameraDemo_events_code.c,415 :: 		TFT_Set_Font(&Tahoma40x40_kaca, 0xFFFF, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Tahoma40x40_kaca+0)
MOVT	R0, #hi_addr(_Tahoma40x40_kaca+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_events_code.c,416 :: 		IntToStr(_low_value, demoText);
MOVW	R0, #lo_addr(__low_value+0)
MOVT	R0, #hi_addr(__low_value+0)
LDRSB	R0, [R0, #0]
MOVW	R1, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_events_code.c,417 :: 		TFT_Write_Text(demoText, 180, 155);
MOVS	R2, #155
MOVS	R1, #180
MOVW	R0, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_events_code.c,418 :: 		_low_value--;
MOVW	R1, #lo_addr(__low_value+0)
MOVT	R1, #hi_addr(__low_value+0)
LDRSB	R0, [R1, #0]
SUBS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;ThermalCameraDemo_events_code.c,419 :: 		IntToStr(_low_value, demoText);
MOVW	R1, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_events_code.c,420 :: 		TFT_Set_Font(&Tahoma40x40_kaca, 0x0000, FO_HORIZONTAL);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Tahoma40x40_kaca+0)
MOVT	R0, #hi_addr(_Tahoma40x40_kaca+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_events_code.c,421 :: 		TFT_Write_Text(demoText, 180, 155);
MOVS	R2, #155
MOVS	R1, #180
MOVW	R0, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_events_code.c,422 :: 		}
L_end_Button_low_mOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button_low_mOnClick
_Button_med_pOnClick:
;ThermalCameraDemo_events_code.c,423 :: 		void Button_med_pOnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ThermalCameraDemo_events_code.c,424 :: 		TFT_Set_Font(&Tahoma40x40_kaca, 0xFFFF, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Tahoma40x40_kaca+0)
MOVT	R0, #hi_addr(_Tahoma40x40_kaca+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_events_code.c,425 :: 		IntToStr(_med_value, demoText);
MOVW	R0, #lo_addr(__med_value+0)
MOVT	R0, #hi_addr(__med_value+0)
LDRSB	R0, [R0, #0]
MOVW	R1, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_events_code.c,426 :: 		TFT_Write_Text(demoText, 180, 235);
MOVS	R2, #235
MOVS	R1, #180
MOVW	R0, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_events_code.c,427 :: 		_med_value++;
MOVW	R1, #lo_addr(__med_value+0)
MOVT	R1, #hi_addr(__med_value+0)
LDRSB	R0, [R1, #0]
ADDS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;ThermalCameraDemo_events_code.c,428 :: 		IntToStr(_med_value, demoText);
MOVW	R1, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_events_code.c,429 :: 		TFT_Set_Font(&Tahoma40x40_kaca, 0x0000, FO_HORIZONTAL);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Tahoma40x40_kaca+0)
MOVT	R0, #hi_addr(_Tahoma40x40_kaca+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_events_code.c,430 :: 		TFT_Write_Text(demoText, 180, 235);
MOVS	R2, #235
MOVS	R1, #180
MOVW	R0, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_events_code.c,431 :: 		}
L_end_Button_med_pOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button_med_pOnClick
_Button_med_mOnClick:
;ThermalCameraDemo_events_code.c,432 :: 		void Button_med_mOnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ThermalCameraDemo_events_code.c,433 :: 		TFT_Set_Font(&Tahoma40x40_kaca, 0xFFFF, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Tahoma40x40_kaca+0)
MOVT	R0, #hi_addr(_Tahoma40x40_kaca+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_events_code.c,434 :: 		IntToStr(_med_value, demoText);
MOVW	R0, #lo_addr(__med_value+0)
MOVT	R0, #hi_addr(__med_value+0)
LDRSB	R0, [R0, #0]
MOVW	R1, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_events_code.c,435 :: 		TFT_Write_Text(demoText, 180, 235);
MOVS	R2, #235
MOVS	R1, #180
MOVW	R0, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_events_code.c,436 :: 		_med_value--;
MOVW	R1, #lo_addr(__med_value+0)
MOVT	R1, #hi_addr(__med_value+0)
LDRSB	R0, [R1, #0]
SUBS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;ThermalCameraDemo_events_code.c,437 :: 		IntToStr(_med_value, demoText);
MOVW	R1, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_events_code.c,438 :: 		TFT_Set_Font(&Tahoma40x40_kaca, 0x0000, FO_HORIZONTAL);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Tahoma40x40_kaca+0)
MOVT	R0, #hi_addr(_Tahoma40x40_kaca+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_events_code.c,439 :: 		TFT_Write_Text(demoText, 180, 235);
MOVS	R2, #235
MOVS	R1, #180
MOVW	R0, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_events_code.c,440 :: 		}
L_end_Button_med_mOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button_med_mOnClick
_Button_high_pOnClick:
;ThermalCameraDemo_events_code.c,441 :: 		void Button_high_pOnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ThermalCameraDemo_events_code.c,442 :: 		TFT_Set_Font(&Tahoma40x40_kaca, 0xFFFF, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Tahoma40x40_kaca+0)
MOVT	R0, #hi_addr(_Tahoma40x40_kaca+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_events_code.c,443 :: 		IntToStr(_high_value, demoText);
MOVW	R0, #lo_addr(__high_value+0)
MOVT	R0, #hi_addr(__high_value+0)
LDRSB	R0, [R0, #0]
MOVW	R1, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_events_code.c,444 :: 		TFT_Write_Text(demoText, 180, 310);
MOVW	R2, #310
MOVS	R1, #180
MOVW	R0, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_events_code.c,445 :: 		_high_value++;
MOVW	R1, #lo_addr(__high_value+0)
MOVT	R1, #hi_addr(__high_value+0)
LDRSB	R0, [R1, #0]
ADDS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;ThermalCameraDemo_events_code.c,446 :: 		IntToStr(_high_value, demoText);
MOVW	R1, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_events_code.c,447 :: 		TFT_Set_Font(&Tahoma40x40_kaca, 0x0000, FO_HORIZONTAL);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Tahoma40x40_kaca+0)
MOVT	R0, #hi_addr(_Tahoma40x40_kaca+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_events_code.c,448 :: 		TFT_Write_Text(demoText, 180, 310);
MOVW	R2, #310
MOVS	R1, #180
MOVW	R0, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_events_code.c,449 :: 		}
L_end_Button_high_pOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button_high_pOnClick
_Button_max_pOnClick:
;ThermalCameraDemo_events_code.c,450 :: 		void Button_max_pOnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ThermalCameraDemo_events_code.c,451 :: 		TFT_Set_Font(&Tahoma40x40_kaca, 0xFFFF, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Tahoma40x40_kaca+0)
MOVT	R0, #hi_addr(_Tahoma40x40_kaca+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_events_code.c,452 :: 		IntToStr(_max_value, demoText);
MOVW	R0, #lo_addr(__max_value+0)
MOVT	R0, #hi_addr(__max_value+0)
LDRSB	R0, [R0, #0]
MOVW	R1, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_events_code.c,453 :: 		TFT_Write_Text(demoText, 180, 390);
MOVW	R2, #390
MOVS	R1, #180
MOVW	R0, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_events_code.c,454 :: 		_max_value++;
MOVW	R1, #lo_addr(__max_value+0)
MOVT	R1, #hi_addr(__max_value+0)
LDRSB	R0, [R1, #0]
ADDS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;ThermalCameraDemo_events_code.c,455 :: 		IntToStr(_max_value, demoText);
MOVW	R1, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_events_code.c,456 :: 		TFT_Set_Font(&Tahoma40x40_kaca, 0x0000, FO_HORIZONTAL);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Tahoma40x40_kaca+0)
MOVT	R0, #hi_addr(_Tahoma40x40_kaca+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_events_code.c,457 :: 		TFT_Write_Text(demoText, 180, 390);
MOVW	R2, #390
MOVS	R1, #180
MOVW	R0, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_events_code.c,458 :: 		}
L_end_Button_max_pOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button_max_pOnClick
_Button_max_mOnClick:
;ThermalCameraDemo_events_code.c,459 :: 		void Button_max_mOnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ThermalCameraDemo_events_code.c,460 :: 		TFT_Set_Font(&Tahoma40x40_kaca, 0xFFFF, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Tahoma40x40_kaca+0)
MOVT	R0, #hi_addr(_Tahoma40x40_kaca+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_events_code.c,461 :: 		IntToStr(_max_value, demoText);
MOVW	R0, #lo_addr(__max_value+0)
MOVT	R0, #hi_addr(__max_value+0)
LDRSB	R0, [R0, #0]
MOVW	R1, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_events_code.c,462 :: 		TFT_Write_Text(demoText, 180, 390);
MOVW	R2, #390
MOVS	R1, #180
MOVW	R0, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_events_code.c,463 :: 		_max_value--;
MOVW	R1, #lo_addr(__max_value+0)
MOVT	R1, #hi_addr(__max_value+0)
LDRSB	R0, [R1, #0]
SUBS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;ThermalCameraDemo_events_code.c,464 :: 		IntToStr(_max_value, demoText);
MOVW	R1, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_events_code.c,465 :: 		TFT_Set_Font(&Tahoma40x40_kaca, 0x0000, FO_HORIZONTAL);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Tahoma40x40_kaca+0)
MOVT	R0, #hi_addr(_Tahoma40x40_kaca+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_events_code.c,466 :: 		TFT_Write_Text(demoText, 180, 390);
MOVW	R2, #390
MOVS	R1, #180
MOVW	R0, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_events_code.c,467 :: 		}
L_end_Button_max_mOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button_max_mOnClick
_Button_high_mOnClick:
;ThermalCameraDemo_events_code.c,468 :: 		void Button_high_mOnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ThermalCameraDemo_events_code.c,469 :: 		TFT_Set_Font(&Tahoma40x40_kaca, 0xFFFF, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Tahoma40x40_kaca+0)
MOVT	R0, #hi_addr(_Tahoma40x40_kaca+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_events_code.c,470 :: 		IntToStr(_high_value, demoText);
MOVW	R0, #lo_addr(__high_value+0)
MOVT	R0, #hi_addr(__high_value+0)
LDRSB	R0, [R0, #0]
MOVW	R1, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_events_code.c,471 :: 		TFT_Write_Text(demoText, 180, 310);
MOVW	R2, #310
MOVS	R1, #180
MOVW	R0, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_events_code.c,472 :: 		_high_value--;
MOVW	R1, #lo_addr(__high_value+0)
MOVT	R1, #hi_addr(__high_value+0)
LDRSB	R0, [R1, #0]
SUBS	R0, R0, #1
SXTB	R0, R0
STRB	R0, [R1, #0]
;ThermalCameraDemo_events_code.c,473 :: 		IntToStr(_high_value, demoText);
MOVW	R1, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R1, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_IntToStr+0
;ThermalCameraDemo_events_code.c,474 :: 		TFT_Set_Font(&Tahoma40x40_kaca, 0x0000, FO_HORIZONTAL);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_Tahoma40x40_kaca+0)
MOVT	R0, #hi_addr(_Tahoma40x40_kaca+0)
BL	_TFT_Set_Font+0
;ThermalCameraDemo_events_code.c,475 :: 		TFT_Write_Text(demoText, 180, 310);
MOVW	R2, #310
MOVS	R1, #180
MOVW	R0, #lo_addr(ThermalCameraDemo_events_code_demoText+0)
MOVT	R0, #hi_addr(ThermalCameraDemo_events_code_demoText+0)
BL	_TFT_Write_Text+0
;ThermalCameraDemo_events_code.c,476 :: 		}
L_end_Button_high_mOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button_high_mOnClick
