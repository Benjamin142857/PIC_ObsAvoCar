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
	FNCALL	_main,_delay_10ms
	FNROOT	_main
	global	_TMR0
psect	text76,local,class=CODE,delta=2
global __ptext76
__ptext76:
_TMR0	set	1
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
	global	_RD2
_RD2	set	66
	global	_RD3
_RD3	set	67
	global	_T0IF
_T0IF	set	90
	global	_OPTION_REG
_OPTION_REG	set	129
	global	_TRISD
_TRISD	set	136
	global	_TRISC4
_TRISC4	set	1084
	global	_TRISC5
_TRISC5	set	1085
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
	file	"Project.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_delay_10ms
?_delay_10ms:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	delay_10ms@n
delay_10ms@n:	; 2 bytes @ 0x0
	ds	2
	global	??_delay_10ms
??_delay_10ms:	; 0 bytes @ 0x2
	global	delay_10ms@i
delay_10ms@i:	; 2 bytes @ 0x2
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x4
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      4       4
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_delay_10ms
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
;; (0) _main                                                 0     0      0      30
;;                         _delay_10ms
;; ---------------------------------------------------------------------------------
;; (1) _delay_10ms                                           4     2      2      30
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _delay_10ms
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      4       4       1       28.6%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;ABS                  0      0       0       3        0.0%
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
;;DATA                 0      0       0      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 8 in file "E:\#Programming\Electronics\MPLAB\PIC_ObsAvoCar\m1_MinSystem\test1.c"
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay_10ms
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\#Programming\Electronics\MPLAB\PIC_ObsAvoCar\m1_MinSystem\test1.c"
	line	8
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	9
	
l2614:	
;test1.c: 9: TRISD = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	10
	
l2616:	
;test1.c: 10: TRISC4 = 0;
	bcf	(1084/8)^080h,(1084)&7
	line	11
	
l2618:	
;test1.c: 11: TRISC5 = 0;
	bcf	(1085/8)^080h,(1085)&7
	line	12
	
l2620:	
;test1.c: 12: RD2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	13
	
l2622:	
;test1.c: 13: RD3 = 0;
	bcf	(67/8),(67)&7
	line	14
	
l2624:	
;test1.c: 14: RC4 = 0;
	bcf	(60/8),(60)&7
	line	15
	
l2626:	
;test1.c: 15: RC5 = 0;
	bcf	(61/8),(61)&7
	goto	l2628
	line	17
;test1.c: 17: while(1) {
	
l687:	
	line	18
	
l2628:	
;test1.c: 18: delay_10ms(200);
	movlw	low(0C8h)
	movwf	(?_delay_10ms)
	movlw	high(0C8h)
	movwf	((?_delay_10ms))+1
	fcall	_delay_10ms
	line	19
	
l2630:	
;test1.c: 19: RD2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(66/8),(66)&7
	line	20
	
l2632:	
;test1.c: 20: RD3 = 0;
	bcf	(67/8),(67)&7
	line	21
	
l2634:	
;test1.c: 21: delay_10ms(200);
	movlw	low(0C8h)
	movwf	(?_delay_10ms)
	movlw	high(0C8h)
	movwf	((?_delay_10ms))+1
	fcall	_delay_10ms
	line	22
	
l2636:	
;test1.c: 22: RD2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	23
	
l2638:	
;test1.c: 23: RD3 = 0;
	bcf	(67/8),(67)&7
	line	24
	
l2640:	
;test1.c: 24: delay_10ms(200);
	movlw	low(0C8h)
	movwf	(?_delay_10ms)
	movlw	high(0C8h)
	movwf	((?_delay_10ms))+1
	fcall	_delay_10ms
	line	25
	
l2642:	
;test1.c: 25: RC4 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	line	26
	
l2644:	
;test1.c: 26: RC5 = 0;
	bcf	(61/8),(61)&7
	line	27
	
l2646:	
;test1.c: 27: delay_10ms(200);
	movlw	low(0C8h)
	movwf	(?_delay_10ms)
	movlw	high(0C8h)
	movwf	((?_delay_10ms))+1
	fcall	_delay_10ms
	line	28
	
l2648:	
;test1.c: 28: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	29
	
l2650:	
;test1.c: 29: RC5 = 0;
	bcf	(61/8),(61)&7
	goto	l2628
	line	31
	
l688:	
	line	17
	goto	l2628
	
l689:	
	line	33
	
l690:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_delay_10ms
psect	text77,local,class=CODE,delta=2
global __ptext77
__ptext77:

;; *************** function _delay_10ms *****************
;; Defined at:
;;		line 35 in file "E:\#Programming\Electronics\MPLAB\PIC_ObsAvoCar\m1_MinSystem\test1.c"
;; Parameters:    Size  Location     Type
;;  n               2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2    2[COMMON] unsigned int 
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
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text77
	file	"E:\#Programming\Electronics\MPLAB\PIC_ObsAvoCar\m1_MinSystem\test1.c"
	line	35
	global	__size_of_delay_10ms
	__size_of_delay_10ms	equ	__end_of_delay_10ms-_delay_10ms
	
_delay_10ms:	
	opt	stack 7
; Regs used in _delay_10ms: [wreg+status,2]
	line	37
	
l1746:	
;test1.c: 36: unsigned int i;
;test1.c: 37: OPTION_REG = 0x07;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	38
	
l1748:	
;test1.c: 38: T0IF = 0;
	bcf	(90/8),(90)&7
	line	40
	
l1750:	
;test1.c: 40: for (i=0; i<n; i++) {
	clrf	(delay_10ms@i)
	clrf	(delay_10ms@i+1)
	goto	l693
	
l694:	
	line	41
	
l1752:	
;test1.c: 41: TMR0 = 148;
	movlw	(094h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	line	42
;test1.c: 42: while(!T0IF);
	goto	l695
	
l696:	
	
l695:	
	btfss	(90/8),(90)&7
	goto	u11
	goto	u10
u11:
	goto	l695
u10:
	
l697:	
	line	43
;test1.c: 43: T0IF = 0;
	bcf	(90/8),(90)&7
	line	40
	
l1754:	
	movlw	low(01h)
	addwf	(delay_10ms@i),f
	skipnc
	incf	(delay_10ms@i+1),f
	movlw	high(01h)
	addwf	(delay_10ms@i+1),f
	
l693:	
	movf	(delay_10ms@n+1),w
	subwf	(delay_10ms@i+1),w
	skipz
	goto	u25
	movf	(delay_10ms@n),w
	subwf	(delay_10ms@i),w
u25:
	skipc
	goto	u21
	goto	u20
u21:
	goto	l1752
u20:
	goto	l699
	
l698:	
	line	45
	
l699:	
	return
	opt stack 0
GLOBAL	__end_of_delay_10ms
	__end_of_delay_10ms:
;; =============== function _delay_10ms ends ============

	signat	_delay_10ms,4216
psect	text78,local,class=CODE,delta=2
global __ptext78
__ptext78:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
