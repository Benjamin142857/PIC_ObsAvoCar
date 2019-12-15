opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

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
	FNCALL	_main,_delay_10us
	FNCALL	_main,___lwtoft
	FNCALL	_main,___ftmul
	FNCALL	_main,___fttol
	FNCALL	_main,_motion_Forward
	FNCALL	_main,_motion_Stop
	FNCALL	_main,_delay_1ms
	FNCALL	_main,_motion_Backward
	FNCALL	_main,_motion_LeftTurn
	FNCALL	_main,_motion_RightTurn
	FNCALL	___lwtoft,___ftpack
	FNCALL	___ftmul,___ftpack
	FNCALL	_motion_RightTurn,_delay_1ms
	FNCALL	_motion_LeftTurn,_delay_1ms
	FNCALL	_motion_Backward,_delay_1ms
	FNCALL	_motion_Forward,_delay_1ms
	FNROOT	_main
	global	_road_pass
	global	_s
	global	_status
	global	_i
	global	_t
	global	_CCP1CON
psect	text257,local,class=CODE,delta=2
global __ptext257
__ptext257:
_CCP1CON	set	23
	global	_CCPR1H
_CCPR1H	set	22
	global	_CCPR1L
_CCPR1L	set	21
	global	_TMR0
_TMR0	set	1
	global	_CCP1IF
_CCP1IF	set	98
	global	_RC1
_RC1	set	57
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
	global	_RC6
_RC6	set	62
	global	_RC7
_RC7	set	63
	global	_RD7
_RD7	set	71
	global	_T0IF
_T0IF	set	90
	global	_OPTION_REG
_OPTION_REG	set	129
	global	_TRISC1
_TRISC1	set	1081
	global	_TRISC2
_TRISC2	set	1082
	global	_TRISC4
_TRISC4	set	1084
	global	_TRISC5
_TRISC5	set	1085
	global	_TRISC6
_TRISC6	set	1086
	global	_TRISC7
_TRISC7	set	1087
	global	_TRISD7
_TRISD7	set	1095
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

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_road_pass:
       ds      2

_s:
       ds      2

_status:
       ds      2

_t:
       ds      2

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
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
	global	?_delay_10us
?_delay_10us:	; 0 bytes @ 0x0
	global	?_motion_Forward
?_motion_Forward:	; 0 bytes @ 0x0
	global	?_motion_Stop
?_motion_Stop:	; 0 bytes @ 0x0
	global	??_motion_Stop
??_motion_Stop:	; 0 bytes @ 0x0
	global	?_delay_1ms
?_delay_1ms:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x0
	global	delay_10us@n
delay_10us@n:	; 2 bytes @ 0x0
	global	delay_1ms@n
delay_1ms@n:	; 2 bytes @ 0x0
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x0
	ds	2
	global	??_delay_10us
??_delay_10us:	; 0 bytes @ 0x2
	global	??_motion_Forward
??_motion_Forward:	; 0 bytes @ 0x2
	global	??_delay_1ms
??_delay_1ms:	; 0 bytes @ 0x2
	global	?_motion_Backward
?_motion_Backward:	; 0 bytes @ 0x2
	global	?_motion_LeftTurn
?_motion_LeftTurn:	; 0 bytes @ 0x2
	global	?_motion_RightTurn
?_motion_RightTurn:	; 0 bytes @ 0x2
	global	motion_Backward@tt
motion_Backward@tt:	; 2 bytes @ 0x2
	global	motion_LeftTurn@angle
motion_LeftTurn@angle:	; 2 bytes @ 0x2
	global	motion_RightTurn@angle
motion_RightTurn@angle:	; 2 bytes @ 0x2
	ds	1
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x3
	ds	1
	global	??_motion_Backward
??_motion_Backward:	; 0 bytes @ 0x4
	global	??_motion_LeftTurn
??_motion_LeftTurn:	; 0 bytes @ 0x4
	global	??_motion_RightTurn
??_motion_RightTurn:	; 0 bytes @ 0x4
	global	___ftpack@sign
___ftpack@sign:	; 1 bytes @ 0x4
	ds	1
	global	??___ftpack
??___ftpack:	; 0 bytes @ 0x5
	ds	3
	global	?___fttol
?___fttol:	; 4 bytes @ 0x8
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0x8
	ds	4
	global	??_main
??_main:	; 0 bytes @ 0xC
	global	??___lwtoft
??___lwtoft:	; 0 bytes @ 0xC
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??___fttol
??___fttol:	; 0 bytes @ 0x0
	ds	3
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x3
	ds	1
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x4
	ds	4
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0x8
	ds	1
	global	?___lwtoft
?___lwtoft:	; 3 bytes @ 0x9
	global	___lwtoft@c
___lwtoft@c:	; 2 bytes @ 0x9
	ds	3
	global	?___ftmul
?___ftmul:	; 3 bytes @ 0xC
	global	___ftmul@f1
___ftmul@f1:	; 3 bytes @ 0xC
	ds	3
	global	___ftmul@f2
___ftmul@f2:	; 3 bytes @ 0xF
	ds	3
	global	??___ftmul
??___ftmul:	; 0 bytes @ 0x12
	ds	3
	global	___ftmul@exp
___ftmul@exp:	; 1 bytes @ 0x15
	ds	1
	global	___ftmul@f3_as_product
___ftmul@f3_as_product:	; 3 bytes @ 0x16
	ds	3
	global	___ftmul@cntr
___ftmul@cntr:	; 1 bytes @ 0x19
	ds	1
	global	___ftmul@sign
___ftmul@sign:	; 1 bytes @ 0x1A
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 10, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     12      14
;; BANK0           80     27      35
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___ftpack	float  size(1) Largest target is 0
;;
;; ?___fttol	long  size(1) Largest target is 0
;;
;; ?___ftmul	float  size(1) Largest target is 0
;;
;; ?___lwtoft	float  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->___fttol
;;   ___lwtoft->___fttol
;;   ___ftmul->___fttol
;;   _motion_RightTurn->_delay_1ms
;;   _motion_LeftTurn->_delay_1ms
;;   _motion_Backward->_delay_1ms
;;   _motion_Forward->_delay_1ms
;;   ___fttol->___ftpack
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->___ftmul
;;   ___lwtoft->___fttol
;;   ___ftmul->___lwtoft
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
;; (0) _main                                                 0     0      0    1216
;;                               _init
;;                         _delay_10us
;;                           ___lwtoft
;;                            ___ftmul
;;                            ___fttol
;;                     _motion_Forward
;;                        _motion_Stop
;;                          _delay_1ms
;;                    _motion_Backward
;;                    _motion_LeftTurn
;;                   _motion_RightTurn
;; ---------------------------------------------------------------------------------
;; (1) ___lwtoft                                             3     0      3     231
;;                                              9 BANK0      3     0      3
;;                           ___ftpack
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___ftmul                                             15     9      6     535
;;                                             12 BANK0     15     9      6
;;                           ___ftpack
;;                           ___lwtoft (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (1) _motion_RightTurn                                     2     0      2      44
;;                                              2 COMMON     2     0      2
;;                          _delay_1ms
;; ---------------------------------------------------------------------------------
;; (1) _motion_LeftTurn                                      2     0      2      44
;;                                              2 COMMON     2     0      2
;;                          _delay_1ms
;; ---------------------------------------------------------------------------------
;; (1) _motion_Backward                                      2     0      2      44
;;                                              2 COMMON     2     0      2
;;                          _delay_1ms
;; ---------------------------------------------------------------------------------
;; (1) _motion_Forward                                       0     0      0      22
;;                          _delay_1ms
;; ---------------------------------------------------------------------------------
;; (1) ___fttol                                             13     9      4     252
;;                                              8 COMMON     4     0      4
;;                                              0 BANK0      9     9      0
;;                           ___ftpack (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___ftpack                                             8     3      5     209
;;                                              0 COMMON     8     3      5
;; ---------------------------------------------------------------------------------
;; (2) _delay_1ms                                            2     0      2      22
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _motion_Stop                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _delay_10us                                           2     0      2      22
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _init
;;   _delay_10us
;;   ___lwtoft
;;     ___ftpack
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;   ___ftmul
;;     ___ftpack
;;     ___lwtoft (ARG)
;;       ___ftpack
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;   ___fttol
;;     ___ftpack (ARG)
;;   _motion_Forward
;;     _delay_1ms
;;   _motion_Stop
;;   _delay_1ms
;;   _motion_Backward
;;     _delay_1ms
;;   _motion_LeftTurn
;;     _delay_1ms
;;   _motion_RightTurn
;;     _delay_1ms
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      C       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0      31       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     1B      23       5       43.8%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      33      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 19 in file "E:\PIC_ObsAvoCar\all\main_1.c"
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
;;		On exit  : 11F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_init
;;		_delay_10us
;;		___lwtoft
;;		___ftmul
;;		___fttol
;;		_motion_Forward
;;		_motion_Stop
;;		_delay_1ms
;;		_motion_Backward
;;		_motion_LeftTurn
;;		_motion_RightTurn
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\PIC_ObsAvoCar\all\main_1.c"
	line	19
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	20
	
l2387:	
;main_1.c: 20: init();
	fcall	_init
	line	22
	
l2389:	
;main_1.c: 22: CCP1IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(98/8),(98)&7
	line	23
	
l2391:	
;main_1.c: 23: RC1 = 1;
	bsf	(57/8),(57)&7
	line	24
;main_1.c: 24: delay_10us(1);
	clrf	(?_delay_10us)
	incf	(?_delay_10us),f
	clrf	(?_delay_10us+1)
	fcall	_delay_10us
	line	25
	
l2393:	
;main_1.c: 25: RC1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(57/8),(57)&7
	line	29
;main_1.c: 29: while (!CCP1IF);
	
l712:	
	btfss	(98/8),(98)&7
	goto	u641
	goto	u640
u641:
	goto	l712
u640:
	
l714:	
	line	30
;main_1.c: 30: CCP1IF = 0;
	bcf	(98/8),(98)&7
	line	31
	
l2395:	
;main_1.c: 31: CCP1CON = 0b00000100;
	movlw	(04h)
	movwf	(23)	;volatile
	line	34
	
l2397:	
;main_1.c: 34: t = 0;
	clrf	(_t)
	clrf	(_t+1)
	line	36
;main_1.c: 36: while(!CCP1IF && t<1400) {
	goto	l2403
	line	37
	
l2399:	
;main_1.c: 37: delay_10us(2);
	movlw	02h
	movwf	(?_delay_10us)
	clrf	(?_delay_10us+1)
	fcall	_delay_10us
	line	38
	
l2401:	
;main_1.c: 38: t += 1;
	bcf	status, 5	;RP0=0, select bank0
	incf	(_t),f
	skipnz
	incf	(_t+1),f
	line	36
	
l2403:	
	btfsc	(98/8),(98)&7
	goto	u651
	goto	u650
u651:
	goto	l2407
u650:
	
l2405:	
	movlw	high(0578h)
	subwf	(_t+1),w
	movlw	low(0578h)
	skipnz
	subwf	(_t),w
	skipc
	goto	u661
	goto	u660
u661:
	goto	l2399
u660:
	line	44
	
l2407:	
;main_1.c: 40: }
;main_1.c: 44: CCP1CON = 0b00000101;
	movlw	(05h)
	movwf	(23)	;volatile
	line	45
	
l2409:	
;main_1.c: 45: CCP1IF = 0;
	bcf	(98/8),(98)&7
	line	46
	
l2411:	
;main_1.c: 46: s = (int)(0.34*t);
	movf	(_t+1),w
	movwf	(?___lwtoft+1)
	movf	(_t),w
	movwf	(?___lwtoft)
	fcall	___lwtoft
	movf	(0+(?___lwtoft)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___lwtoft)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___lwtoft)),w
	movwf	2+(?___ftmul)+03h
	movlw	0x14
	movwf	(?___ftmul)
	movlw	0xae
	movwf	(?___ftmul+1)
	movlw	0x3e
	movwf	(?___ftmul+2)
	fcall	___ftmul
	movf	(0+(?___ftmul)),w
	movwf	(?___fttol)
	movf	(1+(?___ftmul)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	movf	1+(((0+(?___fttol)))),w
	movwf	(_s+1)
	movf	0+(((0+(?___fttol)))),w
	movwf	(_s)
	line	47
	
l2413:	
;main_1.c: 47: if (s>13) {
	movlw	high(0Eh)
	subwf	(_s+1),w
	movlw	low(0Eh)
	skipnz
	subwf	(_s),w
	skipc
	goto	u671
	goto	u670
u671:
	goto	l2429
u670:
	line	48
	
l2415:	
;main_1.c: 48: RD7 = 0;
	bcf	(71/8),(71)&7
	line	50
	
l2417:	
;main_1.c: 50: if (road_pass >= 2) {
	movlw	high(02h)
	subwf	(_road_pass+1),w
	movlw	low(02h)
	skipnz
	subwf	(_road_pass),w
	skipc
	goto	u681
	goto	u680
u681:
	goto	l2423
u680:
	line	51
	
l2419:	
;main_1.c: 51: motion_Forward();
	fcall	_motion_Forward
	line	52
	
l2421:	
;main_1.c: 52: status = 0;
	clrf	(_status)
	clrf	(_status+1)
	line	53
;main_1.c: 53: }
	goto	l2427
	line	56
	
l2423:	
;main_1.c: 55: else {
;main_1.c: 56: motion_Forward();
	fcall	_motion_Forward
	line	57
	
l2425:	
;main_1.c: 57: road_pass++;
	incf	(_road_pass),f
	skipnz
	incf	(_road_pass+1),f
	line	59
	
l2427:	
;main_1.c: 58: }
;main_1.c: 59: motion_Forward();
	fcall	_motion_Forward
	line	61
;main_1.c: 61: }
	goto	l2463
	line	63
	
l2429:	
;main_1.c: 62: else {
;main_1.c: 63: road_pass = 0;
	clrf	(_road_pass)
	clrf	(_road_pass+1)
	line	64
	
l2431:	
;main_1.c: 64: motion_Stop();
	fcall	_motion_Stop
	line	65
	
l2433:	
;main_1.c: 65: RD7 = 1;
	bsf	(71/8),(71)&7
	line	66
	
l2435:	
;main_1.c: 66: delay_1ms(400);
	movlw	low(0190h)
	movwf	(?_delay_1ms)
	movlw	high(0190h)
	movwf	((?_delay_1ms))+1
	fcall	_delay_1ms
	line	67
	
l2437:	
;main_1.c: 67: if (s<5) {
	movlw	high(05h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_s+1),w
	movlw	low(05h)
	skipnz
	subwf	(_s),w
	skipnc
	goto	u691
	goto	u690
u691:
	goto	l2441
u690:
	line	68
	
l2439:	
;main_1.c: 68: motion_Backward(300);
	movlw	low(012Ch)
	movwf	(?_motion_Backward)
	movlw	high(012Ch)
	movwf	((?_motion_Backward))+1
	fcall	_motion_Backward
	line	69
;main_1.c: 69: }
	goto	l2461
	line	70
	
l2441:	
;main_1.c: 70: else if(status == 0) {
	movf	((_status+1)),w
	iorwf	((_status)),w
	skipz
	goto	u701
	goto	u700
u701:
	goto	l2447
u700:
	line	71
	
l2443:	
;main_1.c: 71: motion_LeftTurn(90);
	movlw	05Ah
	movwf	(?_motion_LeftTurn)
	clrf	(?_motion_LeftTurn+1)
	fcall	_motion_LeftTurn
	line	72
	
l2445:	
;main_1.c: 72: status = 1;
	clrf	(_status)
	incf	(_status),f
	clrf	(_status+1)
	line	73
;main_1.c: 73: }
	goto	l2461
	line	74
	
l2447:	
;main_1.c: 74: else if(status == 1) {
	decf	(_status),w
	iorwf	(_status+1),w

	skipz
	goto	u711
	goto	u710
u711:
	goto	l2453
u710:
	line	75
	
l2449:	
;main_1.c: 75: motion_RightTurn(134);
	movlw	086h
	movwf	(?_motion_RightTurn)
	clrf	(?_motion_RightTurn+1)
	fcall	_motion_RightTurn
	line	76
	
l2451:	
;main_1.c: 76: status = 2;
	movlw	02h
	movwf	(_status)
	clrf	(_status+1)
	line	77
;main_1.c: 77: }
	goto	l2461
	line	78
	
l2453:	
;main_1.c: 78: else if(status == 2) {
		movf	(_status),w
	xorlw	2
	iorwf	(_status+1),w

	skipz
	goto	u721
	goto	u720
u721:
	goto	l2459
u720:
	line	79
	
l2455:	
;main_1.c: 79: motion_RightTurn(90);
	movlw	05Ah
	movwf	(?_motion_RightTurn)
	clrf	(?_motion_RightTurn+1)
	fcall	_motion_RightTurn
	line	80
	
l2457:	
;main_1.c: 80: status = 3;
	movlw	03h
	movwf	(_status)
	clrf	(_status+1)
	line	81
;main_1.c: 81: }
	goto	l2461
	line	83
	
l2459:	
;main_1.c: 82: else {
;main_1.c: 83: status = 0;
	clrf	(_status)
	clrf	(_status+1)
	line	87
	
l2461:	
;main_1.c: 84: }
;main_1.c: 87: delay_1ms(400);
	movlw	low(0190h)
	movwf	(?_delay_1ms)
	movlw	high(0190h)
	movwf	((?_delay_1ms))+1
	fcall	_delay_1ms
	line	90
	
l2463:	
;main_1.c: 88: }
;main_1.c: 90: delay_1ms(10);;
	movlw	0Ah
	movwf	(?_delay_1ms)
	clrf	(?_delay_1ms+1)
	fcall	_delay_1ms
	goto	l2389
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	95
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	___lwtoft
psect	text258,local,class=CODE,delta=2
global __ptext258
__ptext258:

;; *************** function ___lwtoft *****************
;; Defined at:
;;		line 29 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwtoft.c"
;; Parameters:    Size  Location     Type
;;  c               2    9[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    9[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text258
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwtoft.c"
	line	29
	global	__size_of___lwtoft
	__size_of___lwtoft	equ	__end_of___lwtoft-___lwtoft
	
___lwtoft:	
	opt	stack 6
; Regs used in ___lwtoft: [wreg+status,2+status,0+pclath+cstack]
	line	30
	
l2383:	
	movf	(___lwtoft@c),w
	movwf	(?___ftpack)
	movf	(___lwtoft@c+1),w
	movwf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	movlw	(08Eh)
	movwf	0+(?___ftpack)+03h
	clrf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	movwf	(?___lwtoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___lwtoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___lwtoft+2)
	line	31
	
l1676:	
	return
	opt stack 0
GLOBAL	__end_of___lwtoft
	__end_of___lwtoft:
;; =============== function ___lwtoft ends ============

	signat	___lwtoft,4219
	global	___ftmul
psect	text259,local,class=CODE,delta=2
global __ptext259
__ptext259:

;; *************** function ___ftmul *****************
;; Defined at:
;;		line 52 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\ftmul.c"
;; Parameters:    Size  Location     Type
;;  f1              3   12[BANK0 ] float 
;;  f2              3   15[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3_as_produc    3   22[BANK0 ] unsigned um
;;  sign            1   26[BANK0 ] unsigned char 
;;  cntr            1   25[BANK0 ] unsigned char 
;;  exp             1   21[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   12[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      15       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text259
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\ftmul.c"
	line	52
	global	__size_of___ftmul
	__size_of___ftmul	equ	__end_of___ftmul-___ftmul
	
___ftmul:	
	opt	stack 6
; Regs used in ___ftmul: [wreg+status,2+status,0+pclath+cstack]
	line	56
	
l2327:	
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(___ftmul@exp)
	movf	((___ftmul@exp)),f
	skipz
	goto	u561
	goto	u560
u561:
	goto	l2333
u560:
	line	57
	
l2329:	
	clrf	(?___ftmul)
	clrf	(?___ftmul+1)
	clrf	(?___ftmul+2)
	goto	l1552
	line	58
	
l2333:	
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(___ftmul@sign)
	movf	((___ftmul@sign)),f
	skipz
	goto	u571
	goto	u570
u571:
	goto	l2339
u570:
	line	59
	
l2335:	
	clrf	(?___ftmul)
	clrf	(?___ftmul+1)
	clrf	(?___ftmul+2)
	goto	l1552
	line	60
	
l2339:	
	movf	(___ftmul@sign),w
	addlw	07Bh
	addwf	(___ftmul@exp),f
	line	61
	
l2341:	
	movf	0+(((___ftmul@f1))+2),w
	movwf	(___ftmul@sign)
	line	62
	
l2343:	
	movf	0+(((___ftmul@f2))+2),w
	xorwf	(___ftmul@sign),f
	line	63
	
l2345:	
	movlw	(080h)
	andwf	(___ftmul@sign),f
	line	64
	
l2347:	
	bsf	(___ftmul@f1)+(15/8),(15)&7
	line	66
	
l2349:	
	bsf	(___ftmul@f2)+(15/8),(15)&7
	line	67
	
l2351:	
	movlw	0FFh
	andwf	(___ftmul@f2),f
	movlw	0FFh
	andwf	(___ftmul@f2+1),f
	movlw	0
	andwf	(___ftmul@f2+2),f
	line	68
	
l2353:	
	clrf	(___ftmul@f3_as_product)
	clrf	(___ftmul@f3_as_product+1)
	clrf	(___ftmul@f3_as_product+2)
	line	69
	
l2355:	
	movlw	(07h)
	movwf	(___ftmul@cntr)
	line	71
	
l2357:	
	btfss	(___ftmul@f1),(0)&7
	goto	u581
	goto	u580
u581:
	goto	l2361
u580:
	line	72
	
l2359:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u591
	addwf	(___ftmul@f3_as_product+1),f
u591:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u592
	addwf	(___ftmul@f3_as_product+2),f
u592:

	line	73
	
l2361:	
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	line	74
	
l2363:	
	clrc
	rlf	(___ftmul@f2),f
	rlf	(___ftmul@f2+1),f
	rlf	(___ftmul@f2+2),f
	line	75
	
l2365:	
	decfsz	(___ftmul@cntr),f
	goto	u601
	goto	u600
u601:
	goto	l2357
u600:
	line	76
	
l2367:	
	movlw	(09h)
	movwf	(___ftmul@cntr)
	line	78
	
l2369:	
	btfss	(___ftmul@f1),(0)&7
	goto	u611
	goto	u610
u611:
	goto	l2373
u610:
	line	79
	
l2371:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u621
	addwf	(___ftmul@f3_as_product+1),f
u621:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u622
	addwf	(___ftmul@f3_as_product+2),f
u622:

	line	80
	
l2373:	
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	line	81
	
l2375:	
	clrc
	rrf	(___ftmul@f3_as_product+2),f
	rrf	(___ftmul@f3_as_product+1),f
	rrf	(___ftmul@f3_as_product),f
	line	82
	
l2377:	
	decfsz	(___ftmul@cntr),f
	goto	u631
	goto	u630
u631:
	goto	l2369
u630:
	line	83
	
l2379:	
	movf	(___ftmul@f3_as_product),w
	movwf	(?___ftpack)
	movf	(___ftmul@f3_as_product+1),w
	movwf	(?___ftpack+1)
	movf	(___ftmul@f3_as_product+2),w
	movwf	(?___ftpack+2)
	movf	(___ftmul@exp),w
	movwf	0+(?___ftpack)+03h
	movf	(___ftmul@sign),w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	movwf	(?___ftmul)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftmul+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftmul+2)
	line	84
	
l1552:	
	return
	opt stack 0
GLOBAL	__end_of___ftmul
	__end_of___ftmul:
;; =============== function ___ftmul ends ============

	signat	___ftmul,8315
	global	_motion_RightTurn
psect	text260,local,class=CODE,delta=2
global __ptext260
__ptext260:

;; *************** function _motion_RightTurn *****************
;; Defined at:
;;		line 170 in file "E:\PIC_ObsAvoCar\all\main_1.c"
;; Parameters:    Size  Location     Type
;;  angle           2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay_1ms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text260
	file	"E:\PIC_ObsAvoCar\all\main_1.c"
	line	170
	global	__size_of_motion_RightTurn
	__size_of_motion_RightTurn	equ	__end_of_motion_RightTurn-_motion_RightTurn
	
_motion_RightTurn:	
	opt	stack 6
; Regs used in _motion_RightTurn: [wreg+status,2+status,0+pclath+cstack]
	line	172
	
l2317:	
;main_1.c: 172: RC5 = 1;
	bsf	(61/8),(61)&7
	line	173
;main_1.c: 173: RC6 = 0;
	bcf	(62/8),(62)&7
	line	174
;main_1.c: 174: RC7 = 1;
	bsf	(63/8),(63)&7
	line	175
	
l2319:	
;main_1.c: 175: delay_1ms(4*angle);
	movf	(motion_RightTurn@angle+1),w
	movwf	(?_delay_1ms+1)
	movf	(motion_RightTurn@angle),w
	movwf	(?_delay_1ms)
	clrc
	rlf	(?_delay_1ms),f
	rlf	(?_delay_1ms+1),f
	clrc
	rlf	(?_delay_1ms),f
	rlf	(?_delay_1ms+1),f
	fcall	_delay_1ms
	line	177
	
l2321:	
;main_1.c: 177: RC5 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7
	line	178
	
l2323:	
;main_1.c: 178: RC6 = 0;
	bcf	(62/8),(62)&7
	line	179
	
l2325:	
;main_1.c: 179: RC7 = 0;
	bcf	(63/8),(63)&7
	line	180
	
l752:	
	return
	opt stack 0
GLOBAL	__end_of_motion_RightTurn
	__end_of_motion_RightTurn:
;; =============== function _motion_RightTurn ends ============

	signat	_motion_RightTurn,4216
	global	_motion_LeftTurn
psect	text261,local,class=CODE,delta=2
global __ptext261
__ptext261:

;; *************** function _motion_LeftTurn *****************
;; Defined at:
;;		line 158 in file "E:\PIC_ObsAvoCar\all\main_1.c"
;; Parameters:    Size  Location     Type
;;  angle           2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay_1ms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text261
	file	"E:\PIC_ObsAvoCar\all\main_1.c"
	line	158
	global	__size_of_motion_LeftTurn
	__size_of_motion_LeftTurn	equ	__end_of_motion_LeftTurn-_motion_LeftTurn
	
_motion_LeftTurn:	
	opt	stack 6
; Regs used in _motion_LeftTurn: [wreg+status,2+status,0+pclath+cstack]
	line	159
	
l2307:	
;main_1.c: 159: RC4 = 1;
	bsf	(60/8),(60)&7
	line	160
;main_1.c: 160: RC5 = 0;
	bcf	(61/8),(61)&7
	line	161
;main_1.c: 161: RC6 = 1;
	bsf	(62/8),(62)&7
	line	163
	
l2309:	
;main_1.c: 163: delay_1ms(4*angle);
	movf	(motion_LeftTurn@angle+1),w
	movwf	(?_delay_1ms+1)
	movf	(motion_LeftTurn@angle),w
	movwf	(?_delay_1ms)
	clrc
	rlf	(?_delay_1ms),f
	rlf	(?_delay_1ms+1),f
	clrc
	rlf	(?_delay_1ms),f
	rlf	(?_delay_1ms+1),f
	fcall	_delay_1ms
	line	164
	
l2311:	
;main_1.c: 164: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	165
	
l2313:	
;main_1.c: 165: RC5 = 0;
	bcf	(61/8),(61)&7
	line	166
	
l2315:	
;main_1.c: 166: RC6 = 0;
	bcf	(62/8),(62)&7
	line	168
	
l749:	
	return
	opt stack 0
GLOBAL	__end_of_motion_LeftTurn
	__end_of_motion_LeftTurn:
;; =============== function _motion_LeftTurn ends ============

	signat	_motion_LeftTurn,4216
	global	_motion_Backward
psect	text262,local,class=CODE,delta=2
global __ptext262
__ptext262:

;; *************** function _motion_Backward *****************
;; Defined at:
;;		line 139 in file "E:\PIC_ObsAvoCar\all\main_1.c"
;; Parameters:    Size  Location     Type
;;  tt              2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay_1ms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text262
	file	"E:\PIC_ObsAvoCar\all\main_1.c"
	line	139
	global	__size_of_motion_Backward
	__size_of_motion_Backward	equ	__end_of_motion_Backward-_motion_Backward
	
_motion_Backward:	
	opt	stack 6
; Regs used in _motion_Backward: [wreg+status,2+status,0+pclath+cstack]
	line	140
	
l2299:	
;main_1.c: 140: RC4 = 1;
	bsf	(60/8),(60)&7
	line	143
;main_1.c: 143: RC7 = 1;
	bsf	(63/8),(63)&7
	line	144
	
l2301:	
;main_1.c: 144: delay_1ms(tt);
	movf	(motion_Backward@tt+1),w
	movwf	(?_delay_1ms+1)
	movf	(motion_Backward@tt),w
	movwf	(?_delay_1ms)
	fcall	_delay_1ms
	line	145
	
l2303:	
;main_1.c: 145: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	148
	
l2305:	
;main_1.c: 148: RC7 = 0;
	bcf	(63/8),(63)&7
	line	149
	
l743:	
	return
	opt stack 0
GLOBAL	__end_of_motion_Backward
	__end_of_motion_Backward:
;; =============== function _motion_Backward ends ============

	signat	_motion_Backward,4216
	global	_motion_Forward
psect	text263,local,class=CODE,delta=2
global __ptext263
__ptext263:

;; *************** function _motion_Forward *****************
;; Defined at:
;;		line 128 in file "E:\PIC_ObsAvoCar\all\main_1.c"
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
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay_1ms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text263
	file	"E:\PIC_ObsAvoCar\all\main_1.c"
	line	128
	global	__size_of_motion_Forward
	__size_of_motion_Forward	equ	__end_of_motion_Forward-_motion_Forward
	
_motion_Forward:	
	opt	stack 6
; Regs used in _motion_Forward: [wreg+status,2+status,0+pclath+cstack]
	line	130
	
l2291:	
;main_1.c: 130: RC5 = 1;
	bsf	(61/8),(61)&7
	line	131
;main_1.c: 131: RC6 = 1;
	bsf	(62/8),(62)&7
	line	133
	
l2293:	
;main_1.c: 133: delay_1ms(100);
	movlw	064h
	movwf	(?_delay_1ms)
	clrf	(?_delay_1ms+1)
	fcall	_delay_1ms
	line	134
	
l2295:	
;main_1.c: 134: RC6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	135
;main_1.c: 135: delay_1ms(20);
	movlw	014h
	movwf	(?_delay_1ms)
	clrf	(?_delay_1ms+1)
	fcall	_delay_1ms
	line	136
	
l2297:	
;main_1.c: 136: RC6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	line	137
	
l740:	
	return
	opt stack 0
GLOBAL	__end_of_motion_Forward
	__end_of_motion_Forward:
;; =============== function _motion_Forward ends ============

	signat	_motion_Forward,88
	global	___fttol
psect	text264,local,class=CODE,delta=2
global __ptext264
__ptext264:

;; *************** function ___fttol *****************
;; Defined at:
;;		line 45 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\fttol.c"
;; Parameters:    Size  Location     Type
;;  f1              3    8[COMMON] float 
;; Auto vars:     Size  Location     Type
;;  lval            4    4[BANK0 ] unsigned long 
;;  exp1            1    8[BANK0 ] unsigned char 
;;  sign1           1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    8[COMMON] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         4       9       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text264
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\fttol.c"
	line	45
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
	opt	stack 7
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
l2253:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	clrc
	rlf	(??___fttol+0)+1,w
	rlf	(??___fttol+0)+2,w
	movwf	(___fttol@exp1)
	movf	((___fttol@exp1)),f
	skipz
	goto	u481
	goto	u480
u481:
	goto	l2257
u480:
	line	50
	
l2255:	
	clrf	(?___fttol)
	clrf	(?___fttol+1)
	clrf	(?___fttol+2)
	clrf	(?___fttol+3)
	goto	l1563
	line	51
	
l2257:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u495:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u490:
	addlw	-1
	skipz
	goto	u495
	movf	0+(??___fttol+0)+0,w
	movwf	(___fttol@sign1)
	line	52
	
l2259:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
l2261:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
l2263:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
l2265:	
	movlw	low(08Eh)
	subwf	(___fttol@exp1),f
	line	56
	
l2267:	
	btfss	(___fttol@exp1),7
	goto	u501
	goto	u500
u501:
	goto	l2277
u500:
	line	57
	
l2269:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u511
	goto	u510
u511:
	goto	l2273
u510:
	goto	l2255
	line	60
	
l2273:	
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	line	61
	
l2275:	
	incfsz	(___fttol@exp1),f
	goto	u521
	goto	u520
u521:
	goto	l2273
u520:
	goto	l2283
	line	63
	
l2277:	
	movlw	(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u531
	goto	u530
u531:
	goto	l1570
u530:
	goto	l2255
	line	66
	
l2281:	
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	line	67
	decf	(___fttol@exp1),f
	line	68
	
l1570:	
	line	65
	movf	(___fttol@exp1),f
	skipz
	goto	u541
	goto	u540
u541:
	goto	l2281
u540:
	line	70
	
l2283:	
	movf	(___fttol@sign1),w
	skipz
	goto	u550
	goto	l2287
u550:
	line	71
	
l2285:	
	comf	(___fttol@lval),f
	comf	(___fttol@lval+1),f
	comf	(___fttol@lval+2),f
	comf	(___fttol@lval+3),f
	incf	(___fttol@lval),f
	skipnz
	incf	(___fttol@lval+1),f
	skipnz
	incf	(___fttol@lval+2),f
	skipnz
	incf	(___fttol@lval+3),f
	line	72
	
l2287:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	line	73
	
l1563:	
	return
	opt stack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
;; =============== function ___fttol ends ============

	signat	___fttol,4220
	global	___ftpack
psect	text265,local,class=CODE,delta=2
global __ptext265
__ptext265:

;; *************** function ___ftpack *****************
;; Defined at:
;;		line 63 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\float.c"
;; Parameters:    Size  Location     Type
;;  arg             3    0[COMMON] unsigned um
;;  exp             1    3[COMMON] unsigned char 
;;  sign            1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    0[COMMON] float 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         5       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		___ftmul
;;		___lwtoft
;; This function uses a non-reentrant model
;;
psect	text265
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\float.c"
	line	63
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
	opt	stack 6
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
l2225:	
	movf	(___ftpack@exp),w
	skipz
	goto	u410
	goto	l2229
u410:
	
l2227:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u421
	goto	u420
u421:
	goto	l2235
u420:
	line	65
	
l2229:	
	clrf	(?___ftpack)
	clrf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	goto	l1788
	line	67
	
l2233:	
	incf	(___ftpack@exp),f
	line	68
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	line	66
	
l2235:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u431
	goto	u430
u431:
	goto	l2233
u430:
	goto	l2239
	line	71
	
l2237:	
	incf	(___ftpack@exp),f
	line	72
	incf	(___ftpack@arg),f
	skipnz
	incf	(___ftpack@arg+1),f
	skipnz
	incf	(___ftpack@arg+2),f
	line	73
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	line	70
	
l2239:	
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u441
	goto	u440
u441:
	goto	l2237
u440:
	goto	l2243
	line	76
	
l2241:	
	decf	(___ftpack@exp),f
	line	77
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	line	75
	
l2243:	
	btfss	(___ftpack@arg+1),(15)&7
	goto	u451
	goto	u450
u451:
	goto	l2241
u450:
	
l1797:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u461
	goto	u460
u461:
	goto	l1798
u460:
	line	80
	
l2245:	
	bcf	(___ftpack@arg)+(15/8),(15)&7
	
l1798:	
	line	81
	clrc
	rrf	(___ftpack@exp),f
	line	82
	
l2247:	
	movf	(___ftpack@exp),w
	movwf	((??___ftpack+0)+0+2)
	clrf	((??___ftpack+0)+0+1)
	clrf	((??___ftpack+0)+0+0)
	movf	0+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg),f
	movf	1+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+1),f
	movf	2+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+2),f
	line	83
	
l2249:	
	movf	(___ftpack@sign),w
	skipz
	goto	u470
	goto	l1799
u470:
	line	84
	
l2251:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
l1799:	
	line	85
	line	86
	
l1788:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
;; =============== function ___ftpack ends ============

	signat	___ftpack,12411
	global	_delay_1ms
psect	text266,local,class=CODE,delta=2
global __ptext266
__ptext266:

;; *************** function _delay_1ms *****************
;; Defined at:
;;		line 194 in file "E:\PIC_ObsAvoCar\all\main_1.c"
;; Parameters:    Size  Location     Type
;;  n               2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 11F/0
;;		On exit  : 11F/0
;;		Unchanged: FFE80/0
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
;;		_motion_Forward
;;		_motion_Backward
;;		_motion_LeftTurn
;;		_motion_RightTurn
;; This function uses a non-reentrant model
;;
psect	text266
	file	"E:\PIC_ObsAvoCar\all\main_1.c"
	line	194
	global	__size_of_delay_1ms
	__size_of_delay_1ms	equ	__end_of_delay_1ms-_delay_1ms
	
_delay_1ms:	
	opt	stack 6
; Regs used in _delay_1ms: [wreg+status,2+status,0]
	line	195
	
l2213:	
;main_1.c: 195: OPTION_REG = 0x03;
	movlw	(03h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	196
	
l2215:	
;main_1.c: 196: T0IF = 0;
	bcf	(90/8),(90)&7
	line	198
	
l2217:	
;main_1.c: 198: for (i=0; i<n; i++) {
	clrf	(_i)
	clrf	(_i+1)
	goto	l2223
	line	199
	
l2219:	
;main_1.c: 199: TMR0 = 82;
	movlw	(052h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	line	200
;main_1.c: 200: while(!T0IF);
	
l766:	
	btfss	(90/8),(90)&7
	goto	u391
	goto	u390
u391:
	goto	l766
u390:
	
l768:	
	line	201
;main_1.c: 201: T0IF = 0;
	bcf	(90/8),(90)&7
	line	198
	
l2221:	
	incf	(_i),f
	skipnz
	incf	(_i+1),f
	
l2223:	
	movf	(delay_1ms@n+1),w
	subwf	(_i+1),w
	skipz
	goto	u405
	movf	(delay_1ms@n),w
	subwf	(_i),w
u405:
	skipc
	goto	u401
	goto	u400
u401:
	goto	l2219
u400:
	line	203
	
l770:	
	return
	opt stack 0
GLOBAL	__end_of_delay_1ms
	__end_of_delay_1ms:
;; =============== function _delay_1ms ends ============

	signat	_delay_1ms,4216
	global	_motion_Stop
psect	text267,local,class=CODE,delta=2
global __ptext267
__ptext267:

;; *************** function _motion_Stop *****************
;; Defined at:
;;		line 151 in file "E:\PIC_ObsAvoCar\all\main_1.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
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
psect	text267
	file	"E:\PIC_ObsAvoCar\all\main_1.c"
	line	151
	global	__size_of_motion_Stop
	__size_of_motion_Stop	equ	__end_of_motion_Stop-_motion_Stop
	
_motion_Stop:	
	opt	stack 7
; Regs used in _motion_Stop: []
	line	153
	
l2211:	
;main_1.c: 153: RC5 = 0;
	bcf	(61/8),(61)&7
	line	154
;main_1.c: 154: RC6 = 0;
	bcf	(62/8),(62)&7
	line	156
	
l746:	
	return
	opt stack 0
GLOBAL	__end_of_motion_Stop
	__end_of_motion_Stop:
;; =============== function _motion_Stop ends ============

	signat	_motion_Stop,88
	global	_delay_10us
psect	text268,local,class=CODE,delta=2
global __ptext268
__ptext268:

;; *************** function _delay_10us *****************
;; Defined at:
;;		line 183 in file "E:\PIC_ObsAvoCar\all\main_1.c"
;; Parameters:    Size  Location     Type
;;  n               2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 15F/0
;;		Unchanged: FFE80/0
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
;; This function uses a non-reentrant model
;;
psect	text268
	file	"E:\PIC_ObsAvoCar\all\main_1.c"
	line	183
	global	__size_of_delay_10us
	__size_of_delay_10us	equ	__end_of_delay_10us-_delay_10us
	
_delay_10us:	
	opt	stack 7
; Regs used in _delay_10us: [wreg+status,2+status,0]
	line	184
	
l2201:	
;main_1.c: 184: OPTION_REG = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(129)^080h	;volatile
	line	185
	
l2203:	
;main_1.c: 185: T0IF = 0;
	bcf	(90/8),(90)&7
	line	187
;main_1.c: 187: for (i=0; i<n; i++) {
	clrf	(_i)
	clrf	(_i+1)
	goto	l2209
	line	188
	
l2205:	
;main_1.c: 188: TMR0 = 242;
	movlw	(0F2h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	189
;main_1.c: 189: while(!T0IF);
	
l757:	
	btfss	(90/8),(90)&7
	goto	u371
	goto	u370
u371:
	goto	l757
u370:
	
l759:	
	line	190
;main_1.c: 190: T0IF = 0;
	bcf	(90/8),(90)&7
	line	187
	
l2207:	
	incf	(_i),f
	skipnz
	incf	(_i+1),f
	
l2209:	
	movf	(delay_10us@n+1),w
	subwf	(_i+1),w
	skipz
	goto	u385
	movf	(delay_10us@n),w
	subwf	(_i),w
u385:
	skipc
	goto	u381
	goto	u380
u381:
	goto	l2205
u380:
	line	192
	
l761:	
	return
	opt stack 0
GLOBAL	__end_of_delay_10us
	__end_of_delay_10us:
;; =============== function _delay_10us ends ============

	signat	_delay_10us,4216
	global	_init
psect	text269,local,class=CODE,delta=2
global __ptext269
__ptext269:

;; *************** function _init *****************
;; Defined at:
;;		line 98 in file "E:\PIC_ObsAvoCar\all\main_1.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
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
psect	text269
	file	"E:\PIC_ObsAvoCar\all\main_1.c"
	line	98
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 7
; Regs used in _init: [wreg+status,2]
	line	100
	
l2165:	
;main_1.c: 100: TRISC2=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1082/8)^080h,(1082)&7
	line	101
	
l2167:	
;main_1.c: 101: CCP1CON = 0b00000101;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(23)	;volatile
	line	102
	
l2169:	
;main_1.c: 102: CCPR1L = 0;
	clrf	(21)	;volatile
	line	103
	
l2171:	
;main_1.c: 103: CCPR1H = 0;
	clrf	(22)	;volatile
	line	104
	
l2173:	
;main_1.c: 104: CCP1IF = 0;
	bcf	(98/8),(98)&7
	line	107
	
l2175:	
;main_1.c: 107: TRISC1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	108
	
l2177:	
;main_1.c: 108: RC1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(57/8),(57)&7
	line	111
	
l2179:	
;main_1.c: 111: TRISC2 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1082/8)^080h,(1082)&7
	line	114
	
l2181:	
;main_1.c: 114: TRISC4 = 0;
	bcf	(1084/8)^080h,(1084)&7
	line	115
	
l2183:	
;main_1.c: 115: TRISC5 = 0;
	bcf	(1085/8)^080h,(1085)&7
	line	116
	
l2185:	
;main_1.c: 116: TRISC6 = 0;
	bcf	(1086/8)^080h,(1086)&7
	line	117
	
l2187:	
;main_1.c: 117: TRISC7 = 0;
	bcf	(1087/8)^080h,(1087)&7
	line	118
	
l2189:	
;main_1.c: 118: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(60/8),(60)&7
	line	119
	
l2191:	
;main_1.c: 119: RC5 = 0;
	bcf	(61/8),(61)&7
	line	120
	
l2193:	
;main_1.c: 120: RC6 = 0;
	bcf	(62/8),(62)&7
	line	121
	
l2195:	
;main_1.c: 121: RC7 = 0;
	bcf	(63/8),(63)&7
	line	124
	
l2197:	
;main_1.c: 124: TRISD7 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1095/8)^080h,(1095)&7
	line	125
	
l2199:	
;main_1.c: 125: RD7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(71/8),(71)&7
	line	126
	
l737:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
psect	text270,local,class=CODE,delta=2
global __ptext270
__ptext270:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
