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
	FNCALL	_main,_delay_10us
	FNCALL	_main,___lwtoft
	FNCALL	_main,___ftmul
	FNCALL	_main,___fttol
	FNCALL	___lwtoft,___ftpack
	FNCALL	___ftmul,___ftpack
	FNROOT	_main
	global	_s
	global	_i
	global	_t
	global	_CCP1CON
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:
_CCP1CON	set	23
	global	_CCPR1H
_CCPR1H	set	22
	global	_CCPR1L
_CCPR1L	set	21
	global	_PORTD
_PORTD	set	8
	global	_TMR0
_TMR0	set	1
	global	_CCP1IF
_CCP1IF	set	98
	global	_RA1
_RA1	set	41
	global	_RC1
_RC1	set	57
	global	_T0IF
_T0IF	set	90
	global	_ADCON1
_ADCON1	set	159
	global	_OPTION_REG
_OPTION_REG	set	129
	global	_TRISD
_TRISD	set	136
	global	_TRISA1
_TRISA1	set	1065
	global	_TRISC1
_TRISC1	set	1081
	global	_TRISC2
_TRISC2	set	1082
	file	"Project.as"
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
_s:
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
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_delay_10us
?_delay_10us:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x0
	global	delay_10us@n
delay_10us@n:	; 2 bytes @ 0x0
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x0
	ds	2
	global	??_delay_10us
??_delay_10us:	; 0 bytes @ 0x2
	ds	1
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x3
	ds	1
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
;;Data sizes: Strings 0, constant 0, data 0, bss 6, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     12      14
;; BANK0           80     27      31
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
;; (0) _main                                                 0     0      0    1040
;;                         _delay_10us
;;                           ___lwtoft
;;                            ___ftmul
;;                            ___fttol
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
;; (1) ___fttol                                             13     9      4     252
;;                                              8 COMMON     4     0      4
;;                                              0 BANK0      9     9      0
;;                           ___ftpack (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___ftpack                                             8     3      5     209
;;                                              0 COMMON     8     3      5
;; ---------------------------------------------------------------------------------
;; (1) _delay_10us                                           2     0      2      22
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
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
;;ABS                  0      0      2D       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     1B      1F       5       38.8%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      2F      12        0.0%

	global	_main
psect	maintext

;; *************** function _main *****************
;; Defined at:
;;		line 11 in file "E:\m3_Ultrasonic\test3.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay_10us
;;		___lwtoft
;;		___ftmul
;;		___fttol
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\m3_Ultrasonic\test3.c"
	line	11
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	12
	
l2130:	
;test3.c: 12: OPTION_REG = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(129)^080h	;volatile
	line	13
	
l2132:	
;test3.c: 13: T0IF = 0;
	bcf	(90/8),(90)&7
	line	16
	
l2134:	
;test3.c: 16: ADCON1=(ADCON1&0xf0)|0x07;
	movf	(159)^080h,w
	andlw	0F0h
	iorlw	07h
	movwf	(159)^080h	;volatile
	line	17
	
l2136:	
;test3.c: 17: TRISA1 = 0;
	bcf	(1065/8)^080h,(1065)&7
	line	18
	
l2138:	
;test3.c: 18: RA1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(41/8),(41)&7
	line	19
	
l2140:	
;test3.c: 19: TRISD = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(136)^080h	;volatile
	line	20
	
l2142:	
;test3.c: 20: PORTD = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(8)	;volatile
	line	21
	
l2144:	
;test3.c: 21: s = 0;
	clrf	(_s)
	clrf	(_s+1)
	line	24
	
l2146:	
;test3.c: 24: TRISC2=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1082/8)^080h,(1082)&7
	line	25
	
l2148:	
;test3.c: 25: CCP1CON = 0b00000101;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(23)	;volatile
	line	26
;test3.c: 26: CCPR1L = 0;
	clrf	(21)	;volatile
	line	27
;test3.c: 27: CCPR1H = 0;
	clrf	(22)	;volatile
	line	28
	
l2150:	
;test3.c: 28: CCP1IF = 0;
	bcf	(98/8),(98)&7
	line	36
	
l2152:	
;test3.c: 36: TRISC1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	37
	
l2154:	
;test3.c: 37: RC1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(57/8),(57)&7
	line	40
	
l2156:	
;test3.c: 40: TRISC2 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1082/8)^080h,(1082)&7
	line	45
	
l2158:	
;test3.c: 45: RC1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(57/8),(57)&7
	line	46
	
l2160:	
;test3.c: 46: delay_10us(1);
	clrf	(?_delay_10us)
	incf	(?_delay_10us),f
	clrf	(?_delay_10us+1)
	fcall	_delay_10us
	line	47
	
l2162:	
;test3.c: 47: RC1 = 0;
	bcf	(57/8),(57)&7
	line	49
	
l2164:	
;test3.c: 49: delay_10us(20);
	movlw	014h
	movwf	(?_delay_10us)
	clrf	(?_delay_10us+1)
	fcall	_delay_10us
	line	52
;test3.c: 52: while (!CCP1IF);
	
l696:	
	btfss	(98/8),(98)&7
	goto	u531
	goto	u530
u531:
	goto	l696
u530:
	
l698:	
	line	53
;test3.c: 53: CCP1IF = 0;
	bcf	(98/8),(98)&7
	line	54
	
l2166:	
;test3.c: 54: CCP1CON = 0b00000100;
	movlw	(04h)
	movwf	(23)	;volatile
	line	57
	
l2168:	
;test3.c: 57: t = 0;
	clrf	(_t)
	clrf	(_t+1)
	line	58
;test3.c: 58: while(!CCP1IF) {
	goto	l2174
	line	59
	
l2170:	
;test3.c: 59: delay_10us(2);
	movlw	02h
	movwf	(?_delay_10us)
	clrf	(?_delay_10us+1)
	fcall	_delay_10us
	line	60
	
l2172:	
;test3.c: 60: t += 1;
	incf	(_t),f
	skipnz
	incf	(_t+1),f
	line	58
	
l2174:	
	btfss	(98/8),(98)&7
	goto	u541
	goto	u540
u541:
	goto	l2170
u540:
	line	64
	
l2176:	
;test3.c: 61: }
;test3.c: 64: CCP1CON = 0b00000101;
	movlw	(05h)
	movwf	(23)	;volatile
	line	65
	
l2178:	
;test3.c: 65: CCP1IF = 0;
	bcf	(98/8),(98)&7
	line	66
	
l2180:	
;test3.c: 66: s = 0.34*t;
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
	line	67
	
l2182:	
;test3.c: 67: PORTD = (int)s;
	movf	(_s),w
	movwf	(8)	;volatile
	line	71
;test3.c: 71: delay_10us(1000);
	movlw	low(03E8h)
	movwf	(?_delay_10us)
	movlw	high(03E8h)
	movwf	((?_delay_10us))+1
	fcall	_delay_10us
	goto	l2158
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	75
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	___lwtoft
psect	text90,local,class=CODE,delta=2
global __ptext90
__ptext90:

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
psect	text90
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwtoft.c"
	line	29
	global	__size_of___lwtoft
	__size_of___lwtoft	equ	__end_of___lwtoft-___lwtoft
	
___lwtoft:	
	opt	stack 6
; Regs used in ___lwtoft: [wreg+status,2+status,0+pclath+cstack]
	line	30
	
l2126:	
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
	
l1619:	
	return
	opt stack 0
GLOBAL	__end_of___lwtoft
	__end_of___lwtoft:
;; =============== function ___lwtoft ends ============

	signat	___lwtoft,4219
	global	___ftmul
psect	text91,local,class=CODE,delta=2
global __ptext91
__ptext91:

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
psect	text91
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\ftmul.c"
	line	52
	global	__size_of___ftmul
	__size_of___ftmul	equ	__end_of___ftmul-___ftmul
	
___ftmul:	
	opt	stack 6
; Regs used in ___ftmul: [wreg+status,2+status,0+pclath+cstack]
	line	56
	
l2070:	
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
	goto	u451
	goto	u450
u451:
	goto	l2076
u450:
	line	57
	
l2072:	
	clrf	(?___ftmul)
	clrf	(?___ftmul+1)
	clrf	(?___ftmul+2)
	goto	l1495
	line	58
	
l2076:	
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
	goto	u461
	goto	u460
u461:
	goto	l2082
u460:
	line	59
	
l2078:	
	clrf	(?___ftmul)
	clrf	(?___ftmul+1)
	clrf	(?___ftmul+2)
	goto	l1495
	line	60
	
l2082:	
	movf	(___ftmul@sign),w
	addlw	07Bh
	addwf	(___ftmul@exp),f
	line	61
	
l2084:	
	movf	0+(((___ftmul@f1))+2),w
	movwf	(___ftmul@sign)
	line	62
	
l2086:	
	movf	0+(((___ftmul@f2))+2),w
	xorwf	(___ftmul@sign),f
	line	63
	
l2088:	
	movlw	(080h)
	andwf	(___ftmul@sign),f
	line	64
	
l2090:	
	bsf	(___ftmul@f1)+(15/8),(15)&7
	line	66
	
l2092:	
	bsf	(___ftmul@f2)+(15/8),(15)&7
	line	67
	
l2094:	
	movlw	0FFh
	andwf	(___ftmul@f2),f
	movlw	0FFh
	andwf	(___ftmul@f2+1),f
	movlw	0
	andwf	(___ftmul@f2+2),f
	line	68
	
l2096:	
	clrf	(___ftmul@f3_as_product)
	clrf	(___ftmul@f3_as_product+1)
	clrf	(___ftmul@f3_as_product+2)
	line	69
	
l2098:	
	movlw	(07h)
	movwf	(___ftmul@cntr)
	line	71
	
l2100:	
	btfss	(___ftmul@f1),(0)&7
	goto	u471
	goto	u470
u471:
	goto	l2104
u470:
	line	72
	
l2102:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u481
	addwf	(___ftmul@f3_as_product+1),f
u481:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u482
	addwf	(___ftmul@f3_as_product+2),f
u482:

	line	73
	
l2104:	
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	line	74
	
l2106:	
	clrc
	rlf	(___ftmul@f2),f
	rlf	(___ftmul@f2+1),f
	rlf	(___ftmul@f2+2),f
	line	75
	
l2108:	
	decfsz	(___ftmul@cntr),f
	goto	u491
	goto	u490
u491:
	goto	l2100
u490:
	line	76
	
l2110:	
	movlw	(09h)
	movwf	(___ftmul@cntr)
	line	78
	
l2112:	
	btfss	(___ftmul@f1),(0)&7
	goto	u501
	goto	u500
u501:
	goto	l2116
u500:
	line	79
	
l2114:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u511
	addwf	(___ftmul@f3_as_product+1),f
u511:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u512
	addwf	(___ftmul@f3_as_product+2),f
u512:

	line	80
	
l2116:	
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	line	81
	
l2118:	
	clrc
	rrf	(___ftmul@f3_as_product+2),f
	rrf	(___ftmul@f3_as_product+1),f
	rrf	(___ftmul@f3_as_product),f
	line	82
	
l2120:	
	decfsz	(___ftmul@cntr),f
	goto	u521
	goto	u520
u521:
	goto	l2112
u520:
	line	83
	
l2122:	
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
	
l1495:	
	return
	opt stack 0
GLOBAL	__end_of___ftmul
	__end_of___ftmul:
;; =============== function ___ftmul ends ============

	signat	___ftmul,8315
	global	___fttol
psect	text92,local,class=CODE,delta=2
global __ptext92
__ptext92:

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
psect	text92
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\fttol.c"
	line	45
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
	opt	stack 7
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
l2032:	
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
	goto	u371
	goto	u370
u371:
	goto	l2036
u370:
	line	50
	
l2034:	
	clrf	(?___fttol)
	clrf	(?___fttol+1)
	clrf	(?___fttol+2)
	clrf	(?___fttol+3)
	goto	l1506
	line	51
	
l2036:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u385:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u380:
	addlw	-1
	skipz
	goto	u385
	movf	0+(??___fttol+0)+0,w
	movwf	(___fttol@sign1)
	line	52
	
l2038:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
l2040:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
l2042:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
l2044:	
	movlw	low(08Eh)
	subwf	(___fttol@exp1),f
	line	56
	
l2046:	
	btfss	(___fttol@exp1),7
	goto	u391
	goto	u390
u391:
	goto	l2056
u390:
	line	57
	
l2048:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u401
	goto	u400
u401:
	goto	l2052
u400:
	goto	l2034
	line	60
	
l2052:	
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	line	61
	
l2054:	
	incfsz	(___fttol@exp1),f
	goto	u411
	goto	u410
u411:
	goto	l2052
u410:
	goto	l2062
	line	63
	
l2056:	
	movlw	(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u421
	goto	u420
u421:
	goto	l1513
u420:
	goto	l2034
	line	66
	
l2060:	
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	line	67
	decf	(___fttol@exp1),f
	line	68
	
l1513:	
	line	65
	movf	(___fttol@exp1),f
	skipz
	goto	u431
	goto	u430
u431:
	goto	l2060
u430:
	line	70
	
l2062:	
	movf	(___fttol@sign1),w
	skipz
	goto	u440
	goto	l2066
u440:
	line	71
	
l2064:	
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
	
l2066:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	line	73
	
l1506:	
	return
	opt stack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
;; =============== function ___fttol ends ============

	signat	___fttol,4220
	global	___ftpack
psect	text93,local,class=CODE,delta=2
global __ptext93
__ptext93:

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
psect	text93
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\float.c"
	line	63
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
	opt	stack 6
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
l2004:	
	movf	(___ftpack@exp),w
	skipz
	goto	u300
	goto	l2008
u300:
	
l2006:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u311
	goto	u310
u311:
	goto	l2014
u310:
	line	65
	
l2008:	
	clrf	(?___ftpack)
	clrf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	goto	l1731
	line	67
	
l2012:	
	incf	(___ftpack@exp),f
	line	68
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	line	66
	
l2014:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u321
	goto	u320
u321:
	goto	l2012
u320:
	goto	l2018
	line	71
	
l2016:	
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
	
l2018:	
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u331
	goto	u330
u331:
	goto	l2016
u330:
	goto	l2022
	line	76
	
l2020:	
	decf	(___ftpack@exp),f
	line	77
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	line	75
	
l2022:	
	btfss	(___ftpack@arg+1),(15)&7
	goto	u341
	goto	u340
u341:
	goto	l2020
u340:
	
l1740:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u351
	goto	u350
u351:
	goto	l1741
u350:
	line	80
	
l2024:	
	bcf	(___ftpack@arg)+(15/8),(15)&7
	
l1741:	
	line	81
	clrc
	rrf	(___ftpack@exp),f
	line	82
	
l2026:	
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
	
l2028:	
	movf	(___ftpack@sign),w
	skipz
	goto	u360
	goto	l1742
u360:
	line	84
	
l2030:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
l1742:	
	line	85
	line	86
	
l1731:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
;; =============== function ___ftpack ends ============

	signat	___ftpack,12411
	global	_delay_10us
psect	text94,local,class=CODE,delta=2
global __ptext94
__ptext94:

;; *************** function _delay_10us *****************
;; Defined at:
;;		line 79 in file "E:\m3_Ultrasonic\test3.c"
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
;;		On exit  : 17F/0
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
psect	text94
	file	"E:\m3_Ultrasonic\test3.c"
	line	79
	global	__size_of_delay_10us
	__size_of_delay_10us	equ	__end_of_delay_10us-_delay_10us
	
_delay_10us:	
	opt	stack 7
; Regs used in _delay_10us: [wreg+status,2+status,0]
	line	80
	
l1996:	
;test3.c: 80: for (i=0; i<n; i++) {
	clrf	(_i)
	clrf	(_i+1)
	goto	l2002
	line	81
	
l1998:	
;test3.c: 81: TMR0 = 251;
	movlw	(0FBh)
	movwf	(1)	;volatile
	line	82
;test3.c: 82: while(!T0IF);
	
l709:	
	btfss	(90/8),(90)&7
	goto	u281
	goto	u280
u281:
	goto	l709
u280:
	
l711:	
	line	83
;test3.c: 83: T0IF = 0;
	bcf	(90/8),(90)&7
	line	80
	
l2000:	
	incf	(_i),f
	skipnz
	incf	(_i+1),f
	
l2002:	
	movf	(delay_10us@n+1),w
	subwf	(_i+1),w
	skipz
	goto	u295
	movf	(delay_10us@n),w
	subwf	(_i),w
u295:
	skipc
	goto	u291
	goto	u290
u291:
	goto	l1998
u290:
	line	85
	
l713:	
	return
	opt stack 0
GLOBAL	__end_of_delay_10us
	__end_of_delay_10us:
;; =============== function _delay_10us ends ============

	signat	_delay_10us,4216
psect	text95,local,class=CODE,delta=2
global __ptext95
__ptext95:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
