opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 9453"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_init
	FNCALL	_main,_delay_10ms
	FNCALL	_main,_motion_Forward
	FNCALL	_main,_motion_Stop
	FNCALL	_main,_motion_LeftTurn
	FNCALL	_main,_motion_RightTurn
	FNCALL	_motion_RightTurn,_delay_10ms
	FNCALL	_motion_LeftTurn,_delay_10ms
	FNROOT	_main
	global	_i
	global	_TMR0
psect	text136,local,class=CODE,delta=2
global __ptext136
__ptext136:
_TMR0	set	1
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
	global	_RC6
_RC6	set	62
	global	_RC7
_RC7	set	63
	global	_RD1
_RD1	set	65
	global	_T0IF
_T0IF	set	90
	global	_OPTION_REG
_OPTION_REG	set	129
	global	_TRISC4
_TRISC4	set	1084
	global	_TRISC5
_TRISC5	set	1085
	global	_TRISC6
_TRISC6	set	1086
	global	_TRISC7
_TRISC7	set	1087
	global	_TRISD1
_TRISD1	set	1089
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	file	"project.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_i:
       ds      2

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_init
?_init:	; 0 bytes @ 0x0
	global	??_init
??_init:	; 0 bytes @ 0x0
	global	?_delay_10ms
?_delay_10ms:	; 0 bytes @ 0x0
	global	?_motion_Forward
?_motion_Forward:	; 0 bytes @ 0x0
	global	??_motion_Forward
??_motion_Forward:	; 0 bytes @ 0x0
	global	?_motion_Stop
?_motion_Stop:	; 0 bytes @ 0x0
	global	??_motion_Stop
??_motion_Stop:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	delay_10ms@n
delay_10ms@n:	; 2 bytes @ 0x0
	ds	2
	global	??_delay_10ms
??_delay_10ms:	; 0 bytes @ 0x2
	global	?_motion_LeftTurn
?_motion_LeftTurn:	; 0 bytes @ 0x2
	global	?_motion_RightTurn
?_motion_RightTurn:	; 0 bytes @ 0x2
	global	motion_LeftTurn@angle
motion_LeftTurn@angle:	; 2 bytes @ 0x2
	global	motion_RightTurn@angle
motion_RightTurn@angle:	; 2 bytes @ 0x2
	ds	2
	global	??_motion_LeftTurn
??_motion_LeftTurn:	; 0 bytes @ 0x4
	global	??_motion_RightTurn
??_motion_RightTurn:	; 0 bytes @ 0x4
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x6
;;Data sizes: Strings 0, constant 0, data 0, bss 2, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6       8
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_motion_LeftTurn
;;   _main->_motion_RightTurn
;;   _motion_RightTurn->_delay_10ms
;;   _motion_LeftTurn->_delay_10ms
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0      75
;;                               _init
;;                         _delay_10ms
;;                     _motion_Forward
;;                        _motion_Stop
;;                    _motion_LeftTurn
;;                   _motion_RightTurn
;; ---------------------------------------------------------------------------------
;; (1) _motion_RightTurn                                     4     2      2      30
;;                                              2 COMMON     4     2      2
;;                         _delay_10ms
;; ---------------------------------------------------------------------------------
;; (1) _motion_LeftTurn                                      4     2      2      30
;;                                              2 COMMON     4     2      2
;;                         _delay_10ms
;; ---------------------------------------------------------------------------------
;; (1) _motion_Stop                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _motion_Forward                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _delay_10ms                                           2     0      2      15
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _init
;;   _delay_10ms
;;   _motion_Forward
;;   _motion_Stop
;;   _motion_LeftTurn
;;     _delay_10ms
;;   _motion_RightTurn
;;     _delay_10ms
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      6       8       1       57.1%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0       8       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       A      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 12 in file "E:\#Programming\Electronics\MPLAB\PIC_ObsAvoCar\m2_CarMotion\test1.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_init
;;		_delay_10ms
;;		_motion_Forward
;;		_motion_Stop
;;		_motion_LeftTurn
;;		_motion_RightTurn
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\#Programming\Electronics\MPLAB\PIC_ObsAvoCar\m2_CarMotion\test1.c"
	line	12
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	13
	
l2671:	
;test1.c: 13: init();
	fcall	_init
	line	14
	
l2673:	
;test1.c: 14: RD1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	goto	l2675
	line	17
;test1.c: 17: while(1) {
	
l699:	
	line	18
	
l2675:	
;test1.c: 18: RD1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	19
	
l2677:	
;test1.c: 19: delay_10ms(100);
	movlw	low(064h)
	movwf	(?_delay_10ms)
	movlw	high(064h)
	movwf	((?_delay_10ms))+1
	fcall	_delay_10ms
	line	20
	
l2679:	
;test1.c: 20: RD1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	21
	
l2681:	
;test1.c: 21: motion_Forward();
	fcall	_motion_Forward
	line	22
;test1.c: 22: delay_10ms(100);
	movlw	low(064h)
	movwf	(?_delay_10ms)
	movlw	high(064h)
	movwf	((?_delay_10ms))+1
	fcall	_delay_10ms
	line	23
	
l2683:	
;test1.c: 23: RD1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	24
	
l2685:	
;test1.c: 24: motion_Stop();
	fcall	_motion_Stop
	line	25
	
l2687:	
;test1.c: 25: delay_10ms(100);
	movlw	low(064h)
	movwf	(?_delay_10ms)
	movlw	high(064h)
	movwf	((?_delay_10ms))+1
	fcall	_delay_10ms
	line	26
	
l2689:	
;test1.c: 26: RD1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	27
	
l2691:	
;test1.c: 27: motion_LeftTurn(90);
	movlw	low(05Ah)
	movwf	(?_motion_LeftTurn)
	movlw	high(05Ah)
	movwf	((?_motion_LeftTurn))+1
	fcall	_motion_LeftTurn
	line	28
	
l2693:	
;test1.c: 28: delay_10ms(100);
	movlw	low(064h)
	movwf	(?_delay_10ms)
	movlw	high(064h)
	movwf	((?_delay_10ms))+1
	fcall	_delay_10ms
	line	29
	
l2695:	
;test1.c: 29: motion_RightTurn(90);
	movlw	low(05Ah)
	movwf	(?_motion_RightTurn)
	movlw	high(05Ah)
	movwf	((?_motion_RightTurn))+1
	fcall	_motion_RightTurn
	goto	l2675
	line	30
	
l700:	
	line	17
	goto	l2675
	
l701:	
	line	32
	
l702:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_motion_RightTurn
psect	text137,local,class=CODE,delta=2
global __ptext137
__ptext137:

;; *************** function _motion_RightTurn *****************
;; Defined at:
;;		line 73 in file "E:\#Programming\Electronics\MPLAB\PIC_ObsAvoCar\m2_CarMotion\test1.c"
;; Parameters:    Size  Location     Type
;;  angle           2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay_10ms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text137
	file	"E:\#Programming\Electronics\MPLAB\PIC_ObsAvoCar\m2_CarMotion\test1.c"
	line	73
	global	__size_of_motion_RightTurn
	__size_of_motion_RightTurn	equ	__end_of_motion_RightTurn-_motion_RightTurn
	
_motion_RightTurn:	
	opt	stack 6
; Regs used in _motion_RightTurn: [wreg+status,2+status,0+pclath+cstack]
	line	74
	
l2659:	
;test1.c: 74: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	75
;test1.c: 75: RC5 = 1;
	bsf	(61/8),(61)&7
	line	76
;test1.c: 76: RC6 = 1;
	bsf	(62/8),(62)&7
	line	77
;test1.c: 77: RC7 = 1;
	bsf	(63/8),(63)&7
	line	78
	
l2661:	
;test1.c: 78: delay_10ms(angle/2);
	movf	(motion_RightTurn@angle+1),w
	movwf	(??_motion_RightTurn+0)+0+1
	movf	(motion_RightTurn@angle),w
	movwf	(??_motion_RightTurn+0)+0
	movlw	01h
u2255:
	clrc
	rrf	(??_motion_RightTurn+0)+1,f
	rrf	(??_motion_RightTurn+0)+0,f
	addlw	-1
	skipz
	goto	u2255
	movf	0+(??_motion_RightTurn+0)+0,w
	movwf	(?_delay_10ms)
	movf	1+(??_motion_RightTurn+0)+0,w
	movwf	(?_delay_10ms+1)
	fcall	_delay_10ms
	line	79
	
l2663:	
;test1.c: 79: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	80
	
l2665:	
;test1.c: 80: RC5 = 0;
	bcf	(61/8),(61)&7
	line	81
	
l2667:	
;test1.c: 81: RC6 = 0;
	bcf	(62/8),(62)&7
	line	82
	
l2669:	
;test1.c: 82: RC7 = 0;
	bcf	(63/8),(63)&7
	line	83
	
l717:	
	return
	opt stack 0
GLOBAL	__end_of_motion_RightTurn
	__end_of_motion_RightTurn:
;; =============== function _motion_RightTurn ends ============

	signat	_motion_RightTurn,4216
	global	_motion_LeftTurn
psect	text138,local,class=CODE,delta=2
global __ptext138
__ptext138:

;; *************** function _motion_LeftTurn *****************
;; Defined at:
;;		line 61 in file "E:\#Programming\Electronics\MPLAB\PIC_ObsAvoCar\m2_CarMotion\test1.c"
;; Parameters:    Size  Location     Type
;;  angle           2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay_10ms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text138
	file	"E:\#Programming\Electronics\MPLAB\PIC_ObsAvoCar\m2_CarMotion\test1.c"
	line	61
	global	__size_of_motion_LeftTurn
	__size_of_motion_LeftTurn	equ	__end_of_motion_LeftTurn-_motion_LeftTurn
	
_motion_LeftTurn:	
	opt	stack 6
; Regs used in _motion_LeftTurn: [wreg+status,2+status,0+pclath+cstack]
	line	62
	
l2647:	
;test1.c: 62: RC4 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	line	63
;test1.c: 63: RC5 = 1;
	bsf	(61/8),(61)&7
	line	64
;test1.c: 64: RC6 = 1;
	bsf	(62/8),(62)&7
	line	65
;test1.c: 65: RC7 = 0;
	bcf	(63/8),(63)&7
	line	66
	
l2649:	
;test1.c: 66: delay_10ms(angle/2);
	movf	(motion_LeftTurn@angle+1),w
	movwf	(??_motion_LeftTurn+0)+0+1
	movf	(motion_LeftTurn@angle),w
	movwf	(??_motion_LeftTurn+0)+0
	movlw	01h
u2245:
	clrc
	rrf	(??_motion_LeftTurn+0)+1,f
	rrf	(??_motion_LeftTurn+0)+0,f
	addlw	-1
	skipz
	goto	u2245
	movf	0+(??_motion_LeftTurn+0)+0,w
	movwf	(?_delay_10ms)
	movf	1+(??_motion_LeftTurn+0)+0,w
	movwf	(?_delay_10ms+1)
	fcall	_delay_10ms
	line	67
	
l2651:	
;test1.c: 67: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	68
	
l2653:	
;test1.c: 68: RC5 = 0;
	bcf	(61/8),(61)&7
	line	69
	
l2655:	
;test1.c: 69: RC6 = 0;
	bcf	(62/8),(62)&7
	line	70
	
l2657:	
;test1.c: 70: RC7 = 0;
	bcf	(63/8),(63)&7
	line	71
	
l714:	
	return
	opt stack 0
GLOBAL	__end_of_motion_LeftTurn
	__end_of_motion_LeftTurn:
;; =============== function _motion_LeftTurn ends ============

	signat	_motion_LeftTurn,4216
	global	_motion_Stop
psect	text139,local,class=CODE,delta=2
global __ptext139
__ptext139:

;; *************** function _motion_Stop *****************
;; Defined at:
;;		line 54 in file "E:\#Programming\Electronics\MPLAB\PIC_ObsAvoCar\m2_CarMotion\test1.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text139
	file	"E:\#Programming\Electronics\MPLAB\PIC_ObsAvoCar\m2_CarMotion\test1.c"
	line	54
	global	__size_of_motion_Stop
	__size_of_motion_Stop	equ	__end_of_motion_Stop-_motion_Stop
	
_motion_Stop:	
	opt	stack 7
; Regs used in _motion_Stop: []
	line	55
	
l1787:	
;test1.c: 55: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	56
;test1.c: 56: RC5 = 0;
	bcf	(61/8),(61)&7
	line	57
;test1.c: 57: RC6 = 0;
	bcf	(62/8),(62)&7
	line	58
;test1.c: 58: RC7 = 0;
	bcf	(63/8),(63)&7
	line	59
	
l711:	
	return
	opt stack 0
GLOBAL	__end_of_motion_Stop
	__end_of_motion_Stop:
;; =============== function _motion_Stop ends ============

	signat	_motion_Stop,88
	global	_motion_Forward
psect	text140,local,class=CODE,delta=2
global __ptext140
__ptext140:

;; *************** function _motion_Forward *****************
;; Defined at:
;;		line 47 in file "E:\#Programming\Electronics\MPLAB\PIC_ObsAvoCar\m2_CarMotion\test1.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text140
	file	"E:\#Programming\Electronics\MPLAB\PIC_ObsAvoCar\m2_CarMotion\test1.c"
	line	47
	global	__size_of_motion_Forward
	__size_of_motion_Forward	equ	__end_of_motion_Forward-_motion_Forward
	
_motion_Forward:	
	opt	stack 7
; Regs used in _motion_Forward: []
	line	48
	
l1785:	
;test1.c: 48: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	49
;test1.c: 49: RC5 = 1;
	bsf	(61/8),(61)&7
	line	50
;test1.c: 50: RC6 = 1;
	bsf	(62/8),(62)&7
	line	51
;test1.c: 51: RC7 = 0;
	bcf	(63/8),(63)&7
	line	52
	
l708:	
	return
	opt stack 0
GLOBAL	__end_of_motion_Forward
	__end_of_motion_Forward:
;; =============== function _motion_Forward ends ============

	signat	_motion_Forward,88
	global	_delay_10ms
psect	text141,local,class=CODE,delta=2
global __ptext141
__ptext141:

;; *************** function _delay_10ms *****************
;; Defined at:
;;		line 85 in file "E:\#Programming\Electronics\MPLAB\PIC_ObsAvoCar\m2_CarMotion\test1.c"
;; Parameters:    Size  Location     Type
;;  n               2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_motion_LeftTurn
;;		_motion_RightTurn
;; This function uses a non-reentrant model
;;
psect	text141
	file	"E:\#Programming\Electronics\MPLAB\PIC_ObsAvoCar\m2_CarMotion\test1.c"
	line	85
	global	__size_of_delay_10ms
	__size_of_delay_10ms	equ	__end_of_delay_10ms-_delay_10ms
	
_delay_10ms:	
	opt	stack 6
; Regs used in _delay_10ms: [wreg+status,2]
	line	86
	
l1775:	
;test1.c: 86: OPTION_REG = 0x07;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	87
	
l1777:	
;test1.c: 87: T0IF = 0;
	bcf	(90/8),(90)&7
	line	89
	
l1779:	
;test1.c: 89: for (i=0; i<n; i++) {
	clrf	(_i)
	clrf	(_i+1)
	goto	l720
	
l721:	
	line	90
	
l1781:	
;test1.c: 90: TMR0 = 148;
	movlw	(094h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	line	91
;test1.c: 91: while(!T0IF);
	goto	l722
	
l723:	
	
l722:	
	btfss	(90/8),(90)&7
	goto	u11
	goto	u10
u11:
	goto	l722
u10:
	
l724:	
	line	92
;test1.c: 92: T0IF = 0;
	bcf	(90/8),(90)&7
	line	89
	
l1783:	
	movlw	low(01h)
	addwf	(_i),f
	skipnc
	incf	(_i+1),f
	movlw	high(01h)
	addwf	(_i+1),f
	
l720:	
	movf	(delay_10ms@n+1),w
	subwf	(_i+1),w
	skipz
	goto	u25
	movf	(delay_10ms@n),w
	subwf	(_i),w
u25:
	skipc
	goto	u21
	goto	u20
u21:
	goto	l1781
u20:
	goto	l726
	
l725:	
	line	94
	
l726:	
	return
	opt stack 0
GLOBAL	__end_of_delay_10ms
	__end_of_delay_10ms:
;; =============== function _delay_10ms ends ============

	signat	_delay_10ms,4216
	global	_init
psect	text142,local,class=CODE,delta=2
global __ptext142
__ptext142:

;; *************** function _init *****************
;; Defined at:
;;		line 34 in file "E:\#Programming\Electronics\MPLAB\PIC_ObsAvoCar\m2_CarMotion\test1.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text142
	file	"E:\#Programming\Electronics\MPLAB\PIC_ObsAvoCar\m2_CarMotion\test1.c"
	line	34
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 7
; Regs used in _init: []
	line	35
	
l1773:	
;test1.c: 35: TRISC4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1084/8)^080h,(1084)&7
	line	36
;test1.c: 36: TRISC5 = 0;
	bcf	(1085/8)^080h,(1085)&7
	line	37
;test1.c: 37: TRISC6 = 0;
	bcf	(1086/8)^080h,(1086)&7
	line	38
;test1.c: 38: TRISC7 = 0;
	bcf	(1087/8)^080h,(1087)&7
	line	39
;test1.c: 39: TRISD1 = 0;
	bcf	(1089/8)^080h,(1089)&7
	line	40
;test1.c: 40: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	41
;test1.c: 41: RC5 = 0;
	bcf	(61/8),(61)&7
	line	42
;test1.c: 42: RC6 = 0;
	bcf	(62/8),(62)&7
	line	43
;test1.c: 43: RC7 = 0;
	bcf	(63/8),(63)&7
	line	44
	
l705:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
psect	text143,local,class=CODE,delta=2
global __ptext143
__ptext143:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
