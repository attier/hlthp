opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

	processor	16F73
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
# 89 "C:\Users\Administrator\Desktop\pic16f73\ceshi.c"
	psect config,class=CONFIG,delta=2 ;#
# 89 "C:\Users\Administrator\Desktop\pic16f73\ceshi.c"
	dw 0x3B32 ;#
	FNCALL	_main,_serial_init
	FNCALL	_main,_UART_SendByte
	FNCALL	_main,_delay2ms
	FNROOT	_main
	global	_PORTB
psect	text161,local,class=CODE,delta=2
global __ptext161
__ptext161:
_PORTB	set	6
	global	_RCSTA
_RCSTA	set	24
	global	_TXREG
_TXREG	set	25
	global	_GIE
_GIE	set	95
	global	_INTE
_INTE	set	92
	global	_PEIE
_PEIE	set	94
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_SPBRG
_SPBRG	set	153
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TXSTA
_TXSTA	set	152
	global	_RCIE
_RCIE	set	1125
	global	_TRMT
_TRMT	set	1217
	file	"ceshi160609.as"
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
	global	??_delay2ms
??_delay2ms:	; 0 bytes @ 0x0
	global	??_UART_SendByte
??_UART_SendByte:	; 0 bytes @ 0x0
	global	??_serial_init
??_serial_init:	; 0 bytes @ 0x0
	global	??_main
??_main:	; 0 bytes @ 0x0
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_delay2ms
?_delay2ms:	; 0 bytes @ 0x0
	global	?_UART_SendByte
?_UART_SendByte:	; 0 bytes @ 0x0
	global	?_serial_init
?_serial_init:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	global	UART_SendByte@dat
UART_SendByte@dat:	; 1 bytes @ 0x0
	global	delay2ms@x
delay2ms@x:	; 2 bytes @ 0x0
	ds	2
	global	delay2ms@a
delay2ms@a:	; 2 bytes @ 0x2
	ds	2
	global	delay2ms@b
delay2ms@b:	; 2 bytes @ 0x4
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON           0      0       0
;; BANK0           94      6       6
;; BANK1           94      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_delay2ms
;;
;; Critical Paths under _main in BANK1
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
;; (0) _main                                                 0     0      0     136
;;                        _serial_init
;;                      _UART_SendByte
;;                           _delay2ms
;; ---------------------------------------------------------------------------------
;; (1) _serial_init                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _UART_SendByte                                        1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _delay2ms                                             6     4      2     114
;;                                              0 BANK0      6     4      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _serial_init
;;   _UART_SendByte
;;   _delay2ms
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            0      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;COMMON               0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;ABS                  0      0       0       3        0.0%
;;BITBANK0            5E      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               5E      6       6       5        6.4%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            5E      0       0       6        0.0%
;;BANK1               5E      0       0       7        0.0%
;;DATA                 0      0       0       8        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 116 in file "C:\Users\Administrator\Desktop\pic16f73\ceshi.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  536[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_serial_init
;;		_UART_SendByte
;;		_delay2ms
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Administrator\Desktop\pic16f73\ceshi.c"
	line	116
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	117
	
l1753:	
;ceshi.c: 117: TRISA = 0x2f;
	movlw	(02Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	118
;ceshi.c: 118: TRISB = 0x07;
	movlw	(07h)
	movwf	(134)^080h	;volatile
	line	119
;ceshi.c: 119: TRISC = 0x80;
	movlw	(080h)
	movwf	(135)^080h	;volatile
	line	120
	
l1755:	
;ceshi.c: 120: PORTB=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	123
	
l1757:	
;ceshi.c: 123: INTE=0;
	bcf	(92/8),(92)&7
	line	125
	
l1759:	
;ceshi.c: 125: serial_init();
	fcall	_serial_init
	goto	l1761
	line	130
;ceshi.c: 130: while(1)
	
l537:	
	line	134
	
l1761:	
;ceshi.c: 131: {
;ceshi.c: 134: UART_SendByte(RB0);
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(48/8),(48)&7
	movlw	1
	fcall	_UART_SendByte
	line	136
	
l1763:	
;ceshi.c: 136: UART_SendByte(RB1);
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(49/8),(49)&7
	movlw	1
	fcall	_UART_SendByte
	line	138
	
l1765:	
;ceshi.c: 138: UART_SendByte(RB2);
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(50/8),(50)&7
	movlw	1
	fcall	_UART_SendByte
	line	140
	
l1767:	
;ceshi.c: 140: delay2ms(250);
	movlw	low(0FAh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay2ms)
	movlw	high(0FAh)
	movwf	((?_delay2ms))+1
	fcall	_delay2ms
	line	142
	
l1769:	
;ceshi.c: 142: delay2ms(250);
	movlw	low(0FAh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay2ms)
	movlw	high(0FAh)
	movwf	((?_delay2ms))+1
	fcall	_delay2ms
	goto	l1761
	line	146
	
l538:	
	line	130
	goto	l1761
	
l539:	
	line	147
	
l540:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_serial_init
psect	text162,local,class=CODE,delta=2
global __ptext162
__ptext162:

;; *************** function _serial_init *****************
;; Defined at:
;;		line 102 in file "C:\Users\Administrator\Desktop\pic16f73\ceshi.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text162
	file	"C:\Users\Administrator\Desktop\pic16f73\ceshi.c"
	line	102
	global	__size_of_serial_init
	__size_of_serial_init	equ	__end_of_serial_init-_serial_init
	
_serial_init:	
	opt	stack 7
; Regs used in _serial_init: [wreg]
	line	104
	
l1745:	
;ceshi.c: 104: TXSTA=0x24;
	movlw	(024h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(152)^080h	;volatile
	line	105
;ceshi.c: 105: RCSTA=0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(24)	;volatile
	line	107
;ceshi.c: 107: SPBRG=0x19;
	movlw	(019h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	108
	
l1747:	
;ceshi.c: 108: GIE=1;
	bsf	(95/8),(95)&7
	line	109
	
l1749:	
;ceshi.c: 109: PEIE=1;
	bsf	(94/8),(94)&7
	line	110
	
l1751:	
;ceshi.c: 110: RCIE=0;
	bcf	(1125/8)^080h,(1125)&7
	line	111
	
l534:	
	return
	opt stack 0
GLOBAL	__end_of_serial_init
	__end_of_serial_init:
;; =============== function _serial_init ends ============

	signat	_serial_init,88
	global	_UART_SendByte
psect	text163,local,class=CODE,delta=2
global __ptext163
__ptext163:

;; *************** function _UART_SendByte *****************
;; Defined at:
;;		line 97 in file "C:\Users\Administrator\Desktop\pic16f73\ceshi.c"
;; Parameters:    Size  Location     Type
;;  dat             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  dat             1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text163
	file	"C:\Users\Administrator\Desktop\pic16f73\ceshi.c"
	line	97
	global	__size_of_UART_SendByte
	__size_of_UART_SendByte	equ	__end_of_UART_SendByte-_UART_SendByte
	
_UART_SendByte:	
	opt	stack 7
; Regs used in _UART_SendByte: [wreg]
;UART_SendByte@dat stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(UART_SendByte@dat)
	line	98
	
l1743:	
;ceshi.c: 98: TXREG=dat;
	movf	(UART_SendByte@dat),w
	movwf	(25)	;volatile
	line	99
;ceshi.c: 99: while(TRMT==0);
	goto	l528
	
l529:	
	
l528:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1217/8)^080h,(1217)&7
	goto	u2231
	goto	u2230
u2231:
	goto	l528
u2230:
	goto	l531
	
l530:	
	line	100
	
l531:	
	return
	opt stack 0
GLOBAL	__end_of_UART_SendByte
	__end_of_UART_SendByte:
;; =============== function _UART_SendByte ends ============

	signat	_UART_SendByte,4216
	global	_delay2ms
psect	text164,local,class=CODE,delta=2
global __ptext164
__ptext164:

;; *************** function _delay2ms *****************
;; Defined at:
;;		line 91 in file "C:\Users\Administrator\Desktop\pic16f73\ceshi.c"
;; Parameters:    Size  Location     Type
;;  x               2    0[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  b               2    4[BANK0 ] unsigned int 
;;  a               2    2[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       4       0
;;      Temps:          0       0       0
;;      Totals:         0       6       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text164
	file	"C:\Users\Administrator\Desktop\pic16f73\ceshi.c"
	line	91
	global	__size_of_delay2ms
	__size_of_delay2ms	equ	__end_of_delay2ms-_delay2ms
	
_delay2ms:	
	opt	stack 7
; Regs used in _delay2ms: [wreg+status,2+status,0]
	line	93
	
l1723:	
;ceshi.c: 92: unsigned int a,b;
;ceshi.c: 93: for(a=x; a>0; a--)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(delay2ms@x+1),w
	clrf	(delay2ms@a+1)
	addwf	(delay2ms@a+1)
	movf	(delay2ms@x),w
	clrf	(delay2ms@a)
	addwf	(delay2ms@a)

	
l1725:	
	movf	((delay2ms@a+1)),w
	iorwf	((delay2ms@a)),w
	skipz
	goto	u2191
	goto	u2190
u2191:
	goto	l1729
u2190:
	goto	l525
	
l1727:	
	goto	l525
	line	94
	
l521:	
	
l1729:	
;ceshi.c: 94: for(b=152; b>0; b--);
	movlw	low(098h)
	movwf	(delay2ms@b)
	movlw	high(098h)
	movwf	((delay2ms@b))+1
	
l1731:	
	movf	((delay2ms@b+1)),w
	iorwf	((delay2ms@b)),w
	skipz
	goto	u2201
	goto	u2200
u2201:
	goto	l1735
u2200:
	goto	l1739
	
l1733:	
	goto	l1739
	
l523:	
	
l1735:	
	movlw	low(01h)
	subwf	(delay2ms@b),f
	movlw	high(01h)
	skipc
	decf	(delay2ms@b+1),f
	subwf	(delay2ms@b+1),f
	
l1737:	
	movf	((delay2ms@b+1)),w
	iorwf	((delay2ms@b)),w
	skipz
	goto	u2211
	goto	u2210
u2211:
	goto	l1735
u2210:
	goto	l1739
	
l524:	
	line	93
	
l1739:	
	movlw	low(01h)
	subwf	(delay2ms@a),f
	movlw	high(01h)
	skipc
	decf	(delay2ms@a+1),f
	subwf	(delay2ms@a+1),f
	
l1741:	
	movf	((delay2ms@a+1)),w
	iorwf	((delay2ms@a)),w
	skipz
	goto	u2221
	goto	u2220
u2221:
	goto	l1729
u2220:
	goto	l525
	
l522:	
	line	95
	
l525:	
	return
	opt stack 0
GLOBAL	__end_of_delay2ms
	__end_of_delay2ms:
;; =============== function _delay2ms ends ============

	signat	_delay2ms,4216
psect	text165,local,class=CODE,delta=2
global __ptext165
__ptext165:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
