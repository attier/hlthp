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
	FNCALL	_main,_timer0_init
	FNCALL	_main,_serial_init
	FNCALL	_main,_eevinit
	FNCALL	_main,_DriveTime
	FNCALL	_main,_HPSystem
	FNCALL	_main,_DriveRelay
	FNCALL	_main,_ADC
	FNCALL	_main,___lmul
	FNCALL	_main,___aldiv
	FNCALL	_HPSystem,_HPstart
	FNCALL	_HPSystem,_HPOuUnit
	FNCALL	_DriveTime,_UART_SendByte
	FNCALL	_DriveTime,_delay2ms
	FNCALL	_DriveTime,_CountClk
	FNCALL	_DriveTime,_CountMin
	FNCALL	_DriveTime,_DriveEEV
	FNCALL	_HPOuUnit,_HPShut
	FNCALL	_HPstart,_abs
	FNCALL	_HPstart,_delay2ms
	FNCALL	_eevinit,_delay2ms
	FNCALL	_eevinit,_eevdriver
	FNCALL	_DriveEEV,_eevdriver
	FNCALL	_DriveEEV,_delay2ms
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_EEVSTEP
	global	_Clock
	global	_InterTimes
	global	_Minutes
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\Administrator\Desktop\pic16f73\eev.h"
	line	8

;initializer for _EEVSTEP
	retlw	0FAh
	retlw	0

	file	"C:\Users\Administrator\Desktop\pic16f73\DriveTime.c"
	line	5

;initializer for _Clock
	retlw	03Ch
	line	4

;initializer for _InterTimes
	retlw	03Dh
	line	6

;initializer for _Minutes
	retlw	014h
	global	_fkTempTab
psect	stringtext,class=STRCODE,delta=2,reloc=256
global __pstringtext
__pstringtext:
;	global	stringtab,__stringbase
stringtab:
;	String table - string pointers are 2 bytes each
	btfsc	(btemp+1),7
	ljmp	stringcode
	bcf	status,7
	btfsc	(btemp+1),0
	bsf	status,7
	movf	indf,w
	incf fsr
skipnz
incf btemp+1
	return
stringcode:
	movf btemp+1,w
andlw 7Fh
movwf	pclath
	movf	fsr,w
incf fsr
skipnz
incf btemp+1
	movwf pc
__stringbase:
	file	"C:\Users\Administrator\Desktop\pic16f73\main.c"
	line	30
_fkTempTab:
	retlw	0DAh
	retlw	0FFh

	retlw	0DBh
	retlw	0FFh

	retlw	0DCh
	retlw	0FFh

	retlw	0DEh
	retlw	0FFh

	retlw	0DFh
	retlw	0FFh

	retlw	0E0h
	retlw	0FFh

	retlw	0E1h
	retlw	0FFh

	retlw	0E2h
	retlw	0FFh

	retlw	0E3h
	retlw	0FFh

	retlw	0E4h
	retlw	0FFh

	retlw	0E5h
	retlw	0FFh

	retlw	0E6h
	retlw	0FFh

	retlw	0E7h
	retlw	0FFh

	retlw	0E8h
	retlw	0FFh

	retlw	0E9h
	retlw	0FFh

	retlw	0EAh
	retlw	0FFh

	retlw	0EBh
	retlw	0FFh

	retlw	0EBh
	retlw	0FFh

	retlw	0ECh
	retlw	0FFh

	retlw	0EDh
	retlw	0FFh

	retlw	0EEh
	retlw	0FFh

	retlw	0EFh
	retlw	0FFh

	retlw	0EFh
	retlw	0FFh

	retlw	0F0h
	retlw	0FFh

	retlw	0F1h
	retlw	0FFh

	retlw	0F1h
	retlw	0FFh

	retlw	0F2h
	retlw	0FFh

	retlw	0F3h
	retlw	0FFh

	retlw	0F3h
	retlw	0FFh

	retlw	0F4h
	retlw	0FFh

	retlw	0F5h
	retlw	0FFh

	retlw	0F5h
	retlw	0FFh

	retlw	0F6h
	retlw	0FFh

	retlw	0F7h
	retlw	0FFh

	retlw	0F7h
	retlw	0FFh

	retlw	0F8h
	retlw	0FFh

	retlw	0F8h
	retlw	0FFh

	retlw	0F9h
	retlw	0FFh

	retlw	0FAh
	retlw	0FFh

	retlw	0FAh
	retlw	0FFh

	retlw	0FBh
	retlw	0FFh

	retlw	0FBh
	retlw	0FFh

	retlw	0FCh
	retlw	0FFh

	retlw	0FCh
	retlw	0FFh

	retlw	0FDh
	retlw	0FFh

	retlw	0FDh
	retlw	0FFh

	retlw	0FEh
	retlw	0FFh

	retlw	0FEh
	retlw	0FFh

	retlw	0FFh
	retlw	0FFh

	retlw	0FFh
	retlw	0FFh

	retlw	0
	retlw	0

	retlw	0
	retlw	0

	retlw	01h
	retlw	0

	retlw	01h
	retlw	0

	retlw	02h
	retlw	0

	retlw	02h
	retlw	0

	retlw	03h
	retlw	0

	retlw	03h
	retlw	0

	retlw	04h
	retlw	0

	retlw	04h
	retlw	0

	retlw	05h
	retlw	0

	retlw	05h
	retlw	0

	retlw	06h
	retlw	0

	retlw	06h
	retlw	0

	retlw	07h
	retlw	0

	retlw	07h
	retlw	0

	retlw	08h
	retlw	0

	retlw	08h
	retlw	0

	retlw	08h
	retlw	0

	retlw	09h
	retlw	0

	retlw	09h
	retlw	0

	retlw	0Ah
	retlw	0

	retlw	0Ah
	retlw	0

	retlw	0Bh
	retlw	0

	retlw	0Bh
	retlw	0

	retlw	0Bh
	retlw	0

	retlw	0Ch
	retlw	0

	retlw	0Ch
	retlw	0

	retlw	0Dh
	retlw	0

	retlw	0Dh
	retlw	0

	retlw	0Eh
	retlw	0

	retlw	0Eh
	retlw	0

	retlw	0Eh
	retlw	0

	retlw	0Fh
	retlw	0

	retlw	0Fh
	retlw	0

	retlw	010h
	retlw	0

	retlw	010h
	retlw	0

	retlw	011h
	retlw	0

	retlw	011h
	retlw	0

	retlw	011h
	retlw	0

	retlw	012h
	retlw	0

	retlw	012h
	retlw	0

	retlw	013h
	retlw	0

	retlw	013h
	retlw	0

	retlw	013h
	retlw	0

	retlw	014h
	retlw	0

	retlw	014h
	retlw	0

	retlw	015h
	retlw	0

	retlw	015h
	retlw	0

	retlw	015h
	retlw	0

	retlw	016h
	retlw	0

	retlw	016h
	retlw	0

	retlw	017h
	retlw	0

	retlw	017h
	retlw	0

	retlw	017h
	retlw	0

	retlw	018h
	retlw	0

	retlw	018h
	retlw	0

	retlw	019h
	retlw	0

	retlw	019h
	retlw	0

	retlw	019h
	retlw	0

	retlw	01Ah
	retlw	0

	retlw	01Ah
	retlw	0

	retlw	01Bh
	retlw	0

	retlw	01Bh
	retlw	0

	retlw	01Bh
	retlw	0

	retlw	01Ch
	retlw	0

	retlw	01Ch
	retlw	0

	retlw	01Dh
	retlw	0

	retlw	01Dh
	retlw	0

	retlw	01Dh
	retlw	0

	retlw	01Eh
	retlw	0

	retlw	01Eh
	retlw	0

	retlw	01Fh
	retlw	0

	retlw	01Fh
	retlw	0

	retlw	01Fh
	retlw	0

	retlw	020h
	retlw	0

	retlw	020h
	retlw	0

	retlw	021h
	retlw	0

	retlw	021h
	retlw	0

	retlw	021h
	retlw	0

	retlw	022h
	retlw	0

	retlw	022h
	retlw	0

	retlw	023h
	retlw	0

	retlw	023h
	retlw	0

	retlw	024h
	retlw	0

	retlw	024h
	retlw	0

	retlw	024h
	retlw	0

	retlw	025h
	retlw	0

	retlw	025h
	retlw	0

	retlw	026h
	retlw	0

	retlw	026h
	retlw	0

	retlw	027h
	retlw	0

	retlw	027h
	retlw	0

	retlw	027h
	retlw	0

	retlw	028h
	retlw	0

	retlw	028h
	retlw	0

	retlw	029h
	retlw	0

	retlw	029h
	retlw	0

	retlw	02Ah
	retlw	0

	retlw	02Ah
	retlw	0

	retlw	02Ah
	retlw	0

	retlw	02Bh
	retlw	0

	retlw	02Bh
	retlw	0

	retlw	02Ch
	retlw	0

	retlw	02Ch
	retlw	0

	retlw	02Dh
	retlw	0

	retlw	02Dh
	retlw	0

	retlw	02Eh
	retlw	0

	retlw	02Eh
	retlw	0

	retlw	02Fh
	retlw	0

	retlw	02Fh
	retlw	0

	retlw	030h
	retlw	0

	retlw	030h
	retlw	0

	retlw	031h
	retlw	0

	retlw	031h
	retlw	0

	retlw	032h
	retlw	0

	retlw	032h
	retlw	0

	retlw	033h
	retlw	0

	retlw	033h
	retlw	0

	retlw	034h
	retlw	0

	retlw	034h
	retlw	0

	retlw	035h
	retlw	0

	retlw	035h
	retlw	0

	retlw	036h
	retlw	0

	retlw	036h
	retlw	0

	retlw	037h
	retlw	0

	retlw	037h
	retlw	0

	retlw	038h
	retlw	0

	retlw	038h
	retlw	0

	retlw	039h
	retlw	0

	retlw	03Ah
	retlw	0

	retlw	03Ah
	retlw	0

	retlw	03Bh
	retlw	0

	retlw	03Bh
	retlw	0

	retlw	03Ch
	retlw	0

	retlw	03Dh
	retlw	0

	retlw	03Dh
	retlw	0

	retlw	03Eh
	retlw	0

	retlw	03Fh
	retlw	0

	retlw	03Fh
	retlw	0

	retlw	040h
	retlw	0

	retlw	041h
	retlw	0

	retlw	041h
	retlw	0

	retlw	042h
	retlw	0

	retlw	043h
	retlw	0

	retlw	043h
	retlw	0

	retlw	044h
	retlw	0

	retlw	045h
	retlw	0

	retlw	046h
	retlw	0

	retlw	047h
	retlw	0

	retlw	047h
	retlw	0

	retlw	048h
	retlw	0

	retlw	049h
	retlw	0

	retlw	04Ah
	retlw	0

	retlw	04Bh
	retlw	0

	retlw	04Ch
	retlw	0

	retlw	04Dh
	retlw	0

	retlw	04Eh
	retlw	0

	retlw	04Fh
	retlw	0

	retlw	050h
	retlw	0

	retlw	051h
	retlw	0

	retlw	052h
	retlw	0

	retlw	053h
	retlw	0

	retlw	054h
	retlw	0

	retlw	056h
	retlw	0

	retlw	057h
	retlw	0

	retlw	058h
	retlw	0

	retlw	05Ah
	retlw	0

	retlw	05Bh
	retlw	0

	retlw	05Dh
	retlw	0

	retlw	05Eh
	retlw	0

	retlw	060h
	retlw	0

	retlw	062h
	retlw	0

	retlw	064h
	retlw	0

	retlw	066h
	retlw	0

	retlw	069h
	retlw	0

	retlw	06Bh
	retlw	0

	retlw	06Eh
	retlw	0

	retlw	071h
	retlw	0

	retlw	074h
	retlw	0

	retlw	079h
	retlw	0

	retlw	07Dh
	retlw	0

	retlw	083h
	retlw	0

	global	_STEP
psect	stringtext
	file	"C:\Users\Administrator\Desktop\pic16f73\eev.h"
	line	5
_STEP:
	retlw	08h
	retlw	0

	retlw	0Ch
	retlw	0

	retlw	04h
	retlw	0

	retlw	06h
	retlw	0

	retlw	02h
	retlw	0

	retlw	03h
	retlw	0

	retlw	01h
	retlw	0

	retlw	09h
	retlw	0

	global	_fkTempTab
	global	_STEP
	global	_TM
	global	_Judge
	global	_SysErr
	global	_ee
	global	_ff
	global	_stepcount
	global	_t1
	global	_t2
	global	_RelayS
	global	_temp1
	global	_T
	global	_ADCON0
_ADCON0	set	31
	global	_ADRES
_ADRES	set	30
	global	_PORTB
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_RCSTA
_RCSTA	set	24
	global	_TMR0
_TMR0	set	1
	global	_TXREG
_TXREG	set	25
	global	_ADON
_ADON	set	248
	global	_GIE
_GIE	set	95
	global	_GO
_GO	set	250
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
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_RB6
_RB6	set	54
	global	_RB7
_RB7	set	55
	global	_RBIE
_RBIE	set	91
	global	_RC4
_RC4	set	60
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_TMR0IF
_TMR0IF	set	90
	global	_ADCON1
_ADCON1	set	159
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
	global	_PSA
_PSA	set	1035
	global	_RCIE
_RCIE	set	1125
	global	_T0CS
_T0CS	set	1037
	global	_TRMT
_TRMT	set	1217
	global	_nRBPU
_nRBPU	set	1039
	file	"PICHPV02.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_TM:
       ds      9

_Judge:
       ds      2

_SysErr:
       ds      2

_ee:
       ds      2

_ff:
       ds      2

_stepcount:
       ds      2

_t1:
       ds      2

_t2:
       ds      2

_RelayS:
       ds      1

_temp1:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\Administrator\Desktop\pic16f73\eev.h"
	line	8
_EEVSTEP:
       ds      2

psect	dataBANK0
	file	"C:\Users\Administrator\Desktop\pic16f73\DriveTime.c"
	line	5
_Clock:
       ds      1

psect	dataBANK0
	file	"C:\Users\Administrator\Desktop\pic16f73\DriveTime.c"
	line	4
_InterTimes:
       ds      1

psect	dataBANK0
	file	"C:\Users\Administrator\Desktop\pic16f73\DriveTime.c"
	line	6
_Minutes:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_T:
       ds      16

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+019h)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+010h)
	fcall	clear_ram
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
	fcall	__pidataBANK0+2		;fetch initializer
	movwf	__pdataBANK0+2&07fh		
	fcall	__pidataBANK0+3		;fetch initializer
	movwf	__pdataBANK0+3&07fh		
	fcall	__pidataBANK0+4		;fetch initializer
	movwf	__pdataBANK0+4&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	??_UART_SendByte
??_UART_SendByte:	; 0 bytes @ 0x0
	global	??_delay2ms
??_delay2ms:	; 0 bytes @ 0x0
	global	??_HPSystem
??_HPSystem:	; 0 bytes @ 0x0
	global	??_DriveRelay
??_DriveRelay:	; 0 bytes @ 0x0
	global	??_HPShut
??_HPShut:	; 0 bytes @ 0x0
	global	??_timer0_init
??_timer0_init:	; 0 bytes @ 0x0
	global	??_serial_init
??_serial_init:	; 0 bytes @ 0x0
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_UART_SendByte
?_UART_SendByte:	; 0 bytes @ 0x0
	global	?_DriveEEV
?_DriveEEV:	; 0 bytes @ 0x0
	global	?_HPSystem
?_HPSystem:	; 0 bytes @ 0x0
	global	?_DriveRelay
?_DriveRelay:	; 0 bytes @ 0x0
	global	?_HPShut
?_HPShut:	; 0 bytes @ 0x0
	global	?_CountClk
?_CountClk:	; 0 bytes @ 0x0
	global	?_CountMin
?_CountMin:	; 0 bytes @ 0x0
	global	?_DriveTime
?_DriveTime:	; 0 bytes @ 0x0
	global	?_eevinit
?_eevinit:	; 0 bytes @ 0x0
	global	?_timer0_init
?_timer0_init:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_serial_init
?_serial_init:	; 0 bytes @ 0x0
	global	?_HPstart
?_HPstart:	; 0 bytes @ 0x0
	global	?_HPOuUnit
?_HPOuUnit:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	ds	5
	global	?_delay2ms
?_delay2ms:	; 0 bytes @ 0x5
	global	??_CountClk
??_CountClk:	; 0 bytes @ 0x5
	global	??_CountMin
??_CountMin:	; 0 bytes @ 0x5
	global	?_eevdriver
?_eevdriver:	; 0 bytes @ 0x5
	global	??_HPOuUnit
??_HPOuUnit:	; 0 bytes @ 0x5
	global	?_ADC
?_ADC:	; 1 bytes @ 0x5
	global	?_abs
?_abs:	; 2 bytes @ 0x5
	global	?___lmul
?___lmul:	; 4 bytes @ 0x5
	global	UART_SendByte@dat
UART_SendByte@dat:	; 1 bytes @ 0x5
	global	eevdriver@x
eevdriver@x:	; 2 bytes @ 0x5
	global	ADC@x
ADC@x:	; 2 bytes @ 0x5
	global	delay2ms@x
delay2ms@x:	; 2 bytes @ 0x5
	global	abs@a
abs@a:	; 2 bytes @ 0x5
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x5
	ds	2
	global	??_abs
??_abs:	; 0 bytes @ 0x7
	global	??_eevdriver
??_eevdriver:	; 0 bytes @ 0x7
	global	??_ADC
??_ADC:	; 0 bytes @ 0x7
	global	delay2ms@a
delay2ms@a:	; 2 bytes @ 0x7
	ds	2
	global	delay2ms@b
delay2ms@b:	; 2 bytes @ 0x9
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x9
	ds	1
	global	eevdriver@stepx
eevdriver@stepx:	; 2 bytes @ 0xA
	ds	1
	global	??_HPstart
??_HPstart:	; 0 bytes @ 0xB
	ds	1
	global	??_DriveEEV
??_DriveEEV:	; 0 bytes @ 0xC
	global	??_eevinit
??_eevinit:	; 0 bytes @ 0xC
	ds	1
	global	??___lmul
??___lmul:	; 0 bytes @ 0xD
	global	eevinit@i
eevinit@i:	; 2 bytes @ 0xD
	ds	1
	global	DriveEEV@x
DriveEEV@x:	; 2 bytes @ 0xE
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0xE
	ds	2
	global	??_DriveTime
??_DriveTime:	; 0 bytes @ 0x10
	ds	1
	global	DriveTime@i
DriveTime@i:	; 2 bytes @ 0x11
	ds	1
	global	?___aldiv
?___aldiv:	; 4 bytes @ 0x12
	global	___aldiv@divisor
___aldiv@divisor:	; 4 bytes @ 0x12
	ds	4
	global	___aldiv@dividend
___aldiv@dividend:	; 4 bytes @ 0x16
	ds	4
	global	??___aldiv
??___aldiv:	; 0 bytes @ 0x1A
	ds	1
	global	___aldiv@counter
___aldiv@counter:	; 1 bytes @ 0x1B
	ds	1
	global	___aldiv@sign
___aldiv@sign:	; 1 bytes @ 0x1C
	ds	1
	global	___aldiv@quotient
___aldiv@quotient:	; 4 bytes @ 0x1D
	ds	4
	global	??_main
??_main:	; 0 bytes @ 0x21
	ds	8
	global	main@temmmp
main@temmmp:	; 4 bytes @ 0x29
	ds	4
	global	main@uwAdcSample
main@uwAdcSample:	; 4 bytes @ 0x2D
	ds	4
	global	main@i
main@i:	; 2 bytes @ 0x31
	ds	2
;;Data sizes: Strings 0, constant 482, data 5, bss 41, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON           0      0       0
;; BANK0           94     51      81
;; BANK1           94      0      16

;;
;; Pointer list with targets:

;; ?_abs	int  size(1) Largest target is 0
;;
;; ?___lmul	unsigned long  size(1) Largest target is 0
;;
;; ?___aldiv	long  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->___aldiv
;;   _HPSystem->_HPstart
;;   _DriveTime->_DriveEEV
;;   _HPstart->_delay2ms
;;   _eevinit->_eevdriver
;;   _DriveEEV->_eevdriver
;;   ___aldiv->___lmul
;;
;; Critical Paths under _ISR in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 8, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                18    18      0    1596
;;                                             33 BANK0     18    18      0
;;                        _timer0_init
;;                        _serial_init
;;                            _eevinit
;;                          _DriveTime
;;                           _HPSystem
;;                         _DriveRelay
;;                                _ADC
;;                             ___lmul
;;                            ___aldiv
;; ---------------------------------------------------------------------------------
;; (1) _HPSystem                                             0     0      0     180
;;                            _HPstart
;;                           _HPOuUnit
;; ---------------------------------------------------------------------------------
;; (1) _DriveTime                                            3     3      0     500
;;                                             16 BANK0      3     3      0
;;                      _UART_SendByte
;;                           _delay2ms
;;                           _CountClk
;;                           _CountMin
;;                           _DriveEEV
;; ---------------------------------------------------------------------------------
;; (2) _HPOuUnit                                             1     1      0       0
;;                                              5 BANK0      1     1      0
;;                             _HPShut
;; ---------------------------------------------------------------------------------
;; (2) _HPstart                                              2     2      0     180
;;                                             11 BANK0      2     2      0
;;                                _abs
;;                           _delay2ms
;; ---------------------------------------------------------------------------------
;; (1) _eevinit                                              3     3      0     254
;;                                             12 BANK0      3     3      0
;;                           _delay2ms
;;                          _eevdriver
;; ---------------------------------------------------------------------------------
;; (2) _DriveEEV                                             4     4      0     274
;;                                             12 BANK0      4     4      0
;;                          _eevdriver
;;                           _delay2ms
;; ---------------------------------------------------------------------------------
;; (1) ___aldiv                                             15     7      8     300
;;                                             18 BANK0     15     7      8
;;                             ___lmul (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___lmul                                              13     5      8      92
;;                                              5 BANK0     13     5      8
;; ---------------------------------------------------------------------------------
;; (3) _HPShut                                               0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _abs                                                  4     2      2      66
;;                                              5 BANK0      4     2      2
;; ---------------------------------------------------------------------------------
;; (1) _DriveRelay                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _serial_init                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _timer0_init                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _ADC                                                  3     1      2      22
;;                                              5 BANK0      3     1      2
;; ---------------------------------------------------------------------------------
;; (4) _eevdriver                                            7     5      2      69
;;                                              5 BANK0      7     5      2
;; ---------------------------------------------------------------------------------
;; (3) _delay2ms                                             6     4      2     114
;;                                              5 BANK0      6     4      2
;; ---------------------------------------------------------------------------------
;; (2) _UART_SendByte                                        1     1      0      22
;;                                              5 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _CountMin                                             1     1      0       0
;;                                              5 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _CountClk                                             1     1      0       0
;;                                              5 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (5) _ISR                                                  5     5      0       0
;;                                              0 BANK0      5     5      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _timer0_init
;;   _serial_init
;;   _eevinit
;;     _delay2ms
;;     _eevdriver
;;   _DriveTime
;;     _UART_SendByte
;;     _delay2ms
;;     _CountClk
;;     _CountMin
;;     _DriveEEV
;;       _eevdriver
;;       _delay2ms
;;   _HPSystem
;;     _HPstart
;;       _abs
;;       _delay2ms
;;     _HPOuUnit
;;       _HPShut
;;   _DriveRelay
;;   _ADC
;;   ___lmul
;;   ___aldiv
;;     ___lmul (ARG)
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               5E      0      10       7       17.0%
;;BITBANK1            5E      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      65       8        0.0%
;;ABS                  0      0      61       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       4       2        0.0%
;;BANK0               5E     33      51       5       86.2%
;;BITBANK0            5E      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               0      0       0       1        0.0%
;;BITCOMMON            0      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 113 in file "C:\Users\Administrator\Desktop\pic16f73\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temmmp          4   41[BANK0 ] long 
;;  uwAdcSample     4   45[BANK0 ] long 
;;  i               2   49[BANK0 ] int 
;; Return value:  Size  Location     Type
;;                  2  1727[BANK0 ] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0      10       0
;;      Temps:          0       8       0
;;      Totals:         0      18       0
;;Total ram usage:       18 bytes
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_timer0_init
;;		_serial_init
;;		_eevinit
;;		_DriveTime
;;		_HPSystem
;;		_DriveRelay
;;		_ADC
;;		___lmul
;;		___aldiv
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Administrator\Desktop\pic16f73\main.c"
	line	113
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	114
	
l5114:	
;main.c: 114: PORTB=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	116
	
l5116:	
;main.c: 116: timer0_init();
	fcall	_timer0_init
	line	119
	
l5118:	
;main.c: 119: nRBPU =1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1039/8)^080h,(1039)&7
	line	120
	
l5120:	
;main.c: 120: TRISA = 0x2f;
	movlw	(02Fh)
	movwf	(133)^080h	;volatile
	line	121
	
l5122:	
;main.c: 121: TRISB = 0x07;
	movlw	(07h)
	movwf	(134)^080h	;volatile
	line	122
	
l5124:	
;main.c: 122: TRISC = 0x80;
	movlw	(080h)
	movwf	(135)^080h	;volatile
	line	123
	
l5126:	
;main.c: 123: RC4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	line	124
	
l5128:	
;main.c: 124: INTE=0;
	bcf	(92/8),(92)&7
	line	125
	
l5130:	
;main.c: 125: RBIE=0;
	bcf	(91/8),(91)&7
	line	126
	
l5132:	
;main.c: 126: serial_init();
	fcall	_serial_init
	line	127
	
l5134:	
;main.c: 127: eevinit();
	fcall	_eevinit
	goto	l5136
	line	131
;main.c: 131: while(1)
	
l1728:	
	line	144
	
l5136:	
;main.c: 132: {
;main.c: 144: if((RB2)||(RB1))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(50/8),(50)&7
	goto	u4311
	goto	u4310
u4311:
	goto	l5140
u4310:
	
l5138:	
	btfss	(49/8),(49)&7
	goto	u4321
	goto	u4320
u4321:
	goto	l1729
u4320:
	goto	l5140
	
l1731:	
	line	147
	
l5140:	
;main.c: 146: {
;main.c: 147: if(TM.ComRun>=120) SysErr.P6=1;
	movlw	(078h)
	subwf	0+(_TM)+03h,w
	skipc
	goto	u4331
	goto	u4330
u4331:
	goto	l5144
u4330:
	
l5142:	
	bsf	(_SysErr),6
	goto	l5144
	
l1732:	
	line	149
;main.c: 149: }
	goto	l5144
	line	150
	
l1729:	
;main.c: 150: else {SysErr.P6=0;
	bcf	(_SysErr),6
	goto	l5144
	line	152
	
l1733:	
	line	156
	
l5144:	
;main.c: 152: }
;main.c: 156: DriveTime();
	fcall	_DriveTime
	line	157
	
l5146:	
;main.c: 157: HPSystem();
	fcall	_HPSystem
	line	158
	
l5148:	
;main.c: 158: DriveRelay();
	fcall	_DriveRelay
	line	162
	
l5150:	
;main.c: 162: for( int i=0;i<=4;i++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@i)
	clrf	(main@i+1)
	
l5152:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u4345
	movlw	low(05h)
	subwf	(main@i),w
u4345:

	skipc
	goto	u4341
	goto	u4340
u4341:
	goto	l5156
u4340:
	goto	l5136
	
l5154:	
	goto	l5136
	line	163
	
l1734:	
	line	164
	
l5156:	
;main.c: 163: {
;main.c: 164: long uwAdcSample = 0;
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@uwAdcSample+3)
	movlw	0
	movwf	(main@uwAdcSample+2)
	movlw	0
	movwf	(main@uwAdcSample+1)
	movlw	0
	movwf	(main@uwAdcSample)

	line	165
	
l5158:	
;main.c: 165: uwAdcSample=ADC(i);
	movf	(main@i+1),w
	clrf	(?_ADC+1)
	addwf	(?_ADC+1)
	movf	(main@i),w
	clrf	(?_ADC)
	addwf	(?_ADC)

	fcall	_ADC
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	clrf	((??_main+0)+0+1)
	clrf	((??_main+0)+0+2)
	clrf	((??_main+0)+0+3)
	movf	3+(??_main+0)+0,w
	movwf	(main@uwAdcSample+3)
	movf	2+(??_main+0)+0,w
	movwf	(main@uwAdcSample+2)
	movf	1+(??_main+0)+0,w
	movwf	(main@uwAdcSample+1)
	movf	0+(??_main+0)+0,w
	movwf	(main@uwAdcSample)

	line	166
	
l5160:	
;main.c: 166: if(i==4)
	movlw	04h
	xorwf	(main@i),w
	iorwf	(main@i+1),w
	skipz
	goto	u4351
	goto	u4350
u4351:
	goto	l5168
u4350:
	line	168
	
l5162:	
;main.c: 167: {long temmmp;
;main.c: 168: temmmp=uwAdcSample;
	movf	(main@uwAdcSample+3),w
	movwf	(main@temmmp+3)
	movf	(main@uwAdcSample+2),w
	movwf	(main@temmmp+2)
	movf	(main@uwAdcSample+1),w
	movwf	(main@temmmp+1)
	movf	(main@uwAdcSample),w
	movwf	(main@temmmp)

	line	169
	
l5164:	
;main.c: 169: uwAdcSample=(temmmp*2560/(12032-(37*temmmp)));
	movlw	0
	movwf	((??_main+0)+0)
	movlw	02Fh
	movwf	((??_main+0)+0+1)
	movlw	0
	movwf	((??_main+0)+0+2)
	movlw	0
	movwf	((??_main+0)+0+3)
	movf	(main@temmmp+3),w
	movwf	(?___lmul+3)
	movf	(main@temmmp+2),w
	movwf	(?___lmul+2)
	movf	(main@temmmp+1),w
	movwf	(?___lmul+1)
	movf	(main@temmmp),w
	movwf	(?___lmul)

	movlw	0
	movwf	3+(?___lmul)+04h
	movlw	0
	movwf	2+(?___lmul)+04h
	movlw	0
	movwf	1+(?___lmul)+04h
	movlw	025h
	movwf	0+(?___lmul)+04h

	fcall	___lmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	comf	(0+(?___lmul)),w
	movwf	(??_main+4)+0
	comf	(1+(?___lmul)),w
	movwf	((??_main+4)+0+1)
	comf	(2+(?___lmul)),w
	movwf	((??_main+4)+0+2)
	comf	(3+(?___lmul)),w
	movwf	((??_main+4)+0+3)
	incf	(??_main+4)+0,f
	skipnz
	incf	((??_main+4)+0+1),f
	skipnz
	incf	((??_main+4)+0+2),f
	skipnz
	incf	((??_main+4)+0+3),f
	movf	0+(??_main+4)+0,w
	addwf	(??_main+0)+0,f
	movf	1+(??_main+4)+0,w
	skipnc
	incfsz	1+(??_main+4)+0,w
	goto	u4360
	goto	u4361
u4360:
	addwf	(??_main+0)+1,f
u4361:
	movf	2+(??_main+4)+0,w
	skipnc
	incfsz	2+(??_main+4)+0,w
	goto	u4362
	goto	u4363
u4362:
	addwf	(??_main+0)+2,f
u4363:
	movf	3+(??_main+4)+0,w
	skipnc
	incf	3+(??_main+4)+0,w
	addwf	(??_main+0)+3,f
	movf	3+(??_main+0)+0,w
	movwf	(?___aldiv+3)
	movf	2+(??_main+0)+0,w
	movwf	(?___aldiv+2)
	movf	1+(??_main+0)+0,w
	movwf	(?___aldiv+1)
	movf	0+(??_main+0)+0,w
	movwf	(?___aldiv)

	movf	(main@temmmp+3),w
	movwf	(?___lmul+3)
	movf	(main@temmmp+2),w
	movwf	(?___lmul+2)
	movf	(main@temmmp+1),w
	movwf	(?___lmul+1)
	movf	(main@temmmp),w
	movwf	(?___lmul)

	movlw	0
	movwf	3+(?___lmul)+04h
	movlw	0
	movwf	2+(?___lmul)+04h
	movlw	0Ah
	movwf	1+(?___lmul)+04h
	movlw	0
	movwf	0+(?___lmul)+04h

	fcall	___lmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(3+(?___lmul)),w
	movwf	3+(?___aldiv)+04h
	movf	(2+(?___lmul)),w
	movwf	2+(?___aldiv)+04h
	movf	(1+(?___lmul)),w
	movwf	1+(?___aldiv)+04h
	movf	(0+(?___lmul)),w
	movwf	0+(?___aldiv)+04h

	fcall	___aldiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(3+(?___aldiv)),w
	movwf	(main@uwAdcSample+3)
	movf	(2+(?___aldiv)),w
	movwf	(main@uwAdcSample+2)
	movf	(1+(?___aldiv)),w
	movwf	(main@uwAdcSample+1)
	movf	(0+(?___aldiv)),w
	movwf	(main@uwAdcSample)

	line	170
	
l5166:	
;main.c: 170: T[i]=fkTempTab[(int)(uwAdcSample-20)];
	movf	(main@uwAdcSample+1),w
	movwf	(??_main+0)+0+1
	movf	(main@uwAdcSample),w
	movwf	(??_main+0)+0
	movlw	01h
	movwf	btemp+1
u4375:
	clrc
	rlf	(??_main+0)+0,f
	rlf	(??_main+0)+1,f
	decfsz	btemp+1,f
	goto	u4375
	movf	0+(??_main+0)+0,w
	addlw	low(0FFD8h)
	movwf	(??_main+2)+0
	movf	1+(??_main+0)+0,w
	skipnc
	addlw	1
	addlw	high(0FFD8h)
	movwf	1+(??_main+2)+0
	movlw	high(_fkTempTab|8000h)
	addwf	1+(??_main+2)+0,w
	movwf	btemp+1
	movlw	low(_fkTempTab|8000h)
	addwf	0+(??_main+2)+0,w
	movwf	fsr0
	skipnc
	incf	btemp+1,f
	fcall	stringtab
	movwf	(??_main+4)+0
	fcall	stringtab
	movwf	(??_main+4)+0+1
	movf	(main@i),w
	movwf	(??_main+6)+0
	addwf	(??_main+6)+0,w
	addlw	_T&0ffh
	movwf	fsr0
	movf	0+(??_main+4)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	1+(??_main+4)+0,w
	movwf	indf
	line	171
;main.c: 171: }
	goto	l5170
	line	172
	
l1736:	
	line	173
	
l5168:	
;main.c: 172: else
;main.c: 173: T[i]=fkTempTab[(int)(uwAdcSample-20)];
	movf	(main@uwAdcSample+1),w
	movwf	(??_main+0)+0+1
	movf	(main@uwAdcSample),w
	movwf	(??_main+0)+0
	movlw	01h
	movwf	btemp+1
u4385:
	clrc
	rlf	(??_main+0)+0,f
	rlf	(??_main+0)+1,f
	decfsz	btemp+1,f
	goto	u4385
	movf	0+(??_main+0)+0,w
	addlw	low(0FFD8h)
	movwf	(??_main+2)+0
	movf	1+(??_main+0)+0,w
	skipnc
	addlw	1
	addlw	high(0FFD8h)
	movwf	1+(??_main+2)+0
	movlw	high(_fkTempTab|8000h)
	addwf	1+(??_main+2)+0,w
	movwf	btemp+1
	movlw	low(_fkTempTab|8000h)
	addwf	0+(??_main+2)+0,w
	movwf	fsr0
	skipnc
	incf	btemp+1,f
	fcall	stringtab
	movwf	(??_main+4)+0
	fcall	stringtab
	movwf	(??_main+4)+0+1
	movf	(main@i),w
	movwf	(??_main+6)+0
	addwf	(??_main+6)+0,w
	addlw	_T&0ffh
	movwf	fsr0
	movf	0+(??_main+4)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	1+(??_main+4)+0,w
	movwf	indf
	goto	l5170
	
l1737:	
	line	162
	
l5170:	
	movlw	low(01h)
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l5172:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u4395
	movlw	low(05h)
	subwf	(main@i),w
u4395:

	skipc
	goto	u4391
	goto	u4390
u4391:
	goto	l5156
u4390:
	goto	l5136
	
l1735:	
	goto	l5136
	line	175
	
l1738:	
	line	131
	goto	l5136
	
l1739:	
	line	178
;main.c: 174: }
;main.c: 175: }
;main.c: 177: return 0;
;	Return value of _main is never used
	
l1740:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_HPSystem
psect	text550,local,class=CODE,delta=2
global __ptext550
__ptext550:

;; *************** function _HPSystem *****************
;; Defined at:
;;		line 151 in file "C:\Users\Administrator\Desktop\pic16f73\HPsystem.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_HPstart
;;		_HPOuUnit
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text550
	file	"C:\Users\Administrator\Desktop\pic16f73\HPsystem.c"
	line	151
	global	__size_of_HPSystem
	__size_of_HPSystem	equ	__end_of_HPSystem-_HPSystem
	
_HPSystem:	
	opt	stack 4
; Regs used in _HPSystem: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	155
	
l5112:	
;HPsystem.c: 155: HPstart();
	fcall	_HPstart
	line	156
;HPsystem.c: 156: HPOuUnit();
	fcall	_HPOuUnit
	line	158
	
l2901:	
	return
	opt stack 0
GLOBAL	__end_of_HPSystem
	__end_of_HPSystem:
;; =============== function _HPSystem ends ============

	signat	_HPSystem,88
	global	_DriveTime
psect	text551,local,class=CODE,delta=2
global __ptext551
__ptext551:

;; *************** function _DriveTime *****************
;; Defined at:
;;		line 65 in file "C:\Users\Administrator\Desktop\pic16f73\DriveTime.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2   17[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       1       0
;;      Totals:         0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_UART_SendByte
;;		_delay2ms
;;		_CountClk
;;		_CountMin
;;		_DriveEEV
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text551
	file	"C:\Users\Administrator\Desktop\pic16f73\DriveTime.c"
	line	65
	global	__size_of_DriveTime
	__size_of_DriveTime	equ	__end_of_DriveTime-_DriveTime
	
_DriveTime:	
	opt	stack 3
; Regs used in _DriveTime: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	66
	
l5034:	
;DriveTime.c: 66: if (Judge.Interrupt)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_Judge),0
	goto	u4211
	goto	u4210
u4211:
	goto	l574
u4210:
	line	68
	
l5036:	
;DriveTime.c: 67: {
;DriveTime.c: 68: Judge.Interrupt=0;
	bcf	(_Judge),0
	line	69
	
l5038:	
;DriveTime.c: 69: InterTimes--;
	movlw	low(01h)
	subwf	(_InterTimes),f
	line	71
	
l5040:	
;DriveTime.c: 71: if(InterTimes==31)
	movf	(_InterTimes),w
	xorlw	01Fh
	skipz
	goto	u4221
	goto	u4220
u4221:
	goto	l563
u4220:
	line	74
	
l5042:	
;DriveTime.c: 72: {
;DriveTime.c: 74: RC4=~RC4;
	movlw	1<<((60)&7)
	xorwf	((60)/8),f
	line	75
	
l5044:	
;DriveTime.c: 75: UART_SendByte(RB0);
	movlw	0
	btfsc	(48/8),(48)&7
	movlw	1
	fcall	_UART_SendByte
	line	76
	
l5046:	
;DriveTime.c: 76: UART_SendByte(RB1);
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(49/8),(49)&7
	movlw	1
	fcall	_UART_SendByte
	line	77
	
l5048:	
;DriveTime.c: 77: UART_SendByte(RB2);
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(50/8),(50)&7
	movlw	1
	fcall	_UART_SendByte
	line	78
	
l5050:	
;DriveTime.c: 78: UART_SendByte(0x21);
	movlw	(021h)
	fcall	_UART_SendByte
	line	79
	
l5052:	
;DriveTime.c: 79: UART_SendByte(0x00);
	movlw	(0)
	fcall	_UART_SendByte
	line	80
	
l5054:	
;DriveTime.c: 80: UART_SendByte(0x0d);
	movlw	(0Dh)
	fcall	_UART_SendByte
	line	81
	
l5056:	
;DriveTime.c: 81: UART_SendByte(0x0a);
	movlw	(0Ah)
	fcall	_UART_SendByte
	line	82
	
l5058:	
;DriveTime.c: 82: delay2ms(100);
	movlw	low(064h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay2ms)
	movlw	high(064h)
	movwf	((?_delay2ms))+1
	fcall	_delay2ms
	line	83
;DriveTime.c: 83: }
	goto	l5068
	line	84
	
l563:	
;DriveTime.c: 84: else if(!RelayS.Com&&(InterTimes==31))RC4=~RC4;
	btfsc	(_RelayS),0
	goto	u4231
	goto	u4230
u4231:
	goto	l5068
u4230:
	
l5060:	
	movf	(_InterTimes),w
	xorlw	01Fh
	skipz
	goto	u4241
	goto	u4240
u4241:
	goto	l5068
u4240:
	
l5062:	
	movlw	1<<((60)&7)
	xorwf	((60)/8),f
	goto	l5068
	
l565:	
	goto	l5068
	line	85
	
l564:	
	goto	l5068
	
l5064:	
	goto	l5068
	line	87
	
l5066:	
	goto	l5068
	line	90
;DriveTime.c: 88: {
	
l567:	
	goto	l5068
	line	91
	
l566:	
	line	92
	
l5068:	
;DriveTime.c: 90: }
;DriveTime.c: 91: }
;DriveTime.c: 92: if (!InterTimes)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_InterTimes),f
	skipz
	goto	u4251
	goto	u4250
u4251:
	goto	l574
u4250:
	line	94
	
l5070:	
;DriveTime.c: 93: {
;DriveTime.c: 94: for(int i=0;i<=4;i++)
	clrf	(DriveTime@i)
	clrf	(DriveTime@i+1)
	
l5072:	
	movf	(DriveTime@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u4265
	movlw	low(05h)
	subwf	(DriveTime@i),w
u4265:

	skipc
	goto	u4261
	goto	u4260
u4261:
	goto	l5076
u4260:
	goto	l5088
	
l5074:	
	goto	l5088
	line	95
	
l569:	
	line	96
	
l5076:	
;DriveTime.c: 95: {
;DriveTime.c: 96: UART_SendByte(i);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(DriveTime@i),w
	fcall	_UART_SendByte
	line	97
	
l5078:	
;DriveTime.c: 97: UART_SendByte(T[i]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(DriveTime@i),w
	movwf	(??_DriveTime+0)+0
	addwf	(??_DriveTime+0)+0,w
	addlw	_T&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	fcall	_UART_SendByte
	line	98
	
l5080:	
;DriveTime.c: 98: UART_SendByte(0x22);
	movlw	(022h)
	fcall	_UART_SendByte
	line	99
	
l5082:	
;DriveTime.c: 99: UART_SendByte(0x00);
	movlw	(0)
	fcall	_UART_SendByte
	line	94
	
l5084:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(DriveTime@i),f
	skipnc
	incf	(DriveTime@i+1),f
	movlw	high(01h)
	addwf	(DriveTime@i+1),f
	
l5086:	
	movf	(DriveTime@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u4275
	movlw	low(05h)
	subwf	(DriveTime@i),w
u4275:

	skipc
	goto	u4271
	goto	u4270
u4271:
	goto	l5076
u4270:
	goto	l5088
	
l570:	
	line	101
	
l5088:	
;DriveTime.c: 100: }
;DriveTime.c: 101: UART_SendByte(0x123);
	movlw	(023h)
	fcall	_UART_SendByte
	line	102
;DriveTime.c: 102: UART_SendByte(Judge.Working);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	rrf	(_Judge),w
	movwf	(??_DriveTime+0)+0
	rrf	(??_DriveTime+0)+0,w
	andlw	(1<<3)-1
	fcall	_UART_SendByte
	line	103
;DriveTime.c: 103: UART_SendByte(SysErr.P6);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	swapf	(_SysErr),w
	movwf	(??_DriveTime+0)+0
	rrf	(??_DriveTime+0)+0,f
	rrf	(??_DriveTime+0)+0,w
	andlw	(1<<1)-1
	fcall	_UART_SendByte
	line	106
	
l5090:	
;DriveTime.c: 106: InterTimes=61;
	movlw	(03Dh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DriveTime+0)+0
	movf	(??_DriveTime+0)+0,w
	movwf	(_InterTimes)
	line	107
	
l5092:	
;DriveTime.c: 107: Clock--;
	movlw	low(01h)
	subwf	(_Clock),f
	line	109
	
l5094:	
;DriveTime.c: 109: CountClk();
	fcall	_CountClk
	line	113
	
l5096:	
;DriveTime.c: 113: if (!Clock)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_Clock),f
	skipz
	goto	u4281
	goto	u4280
u4281:
	goto	l574
u4280:
	line	115
	
l5098:	
;DriveTime.c: 114: {
;DriveTime.c: 115: Clock = 60;Minutes--;
	movlw	(03Ch)
	movwf	(??_DriveTime+0)+0
	movf	(??_DriveTime+0)+0,w
	movwf	(_Clock)
	
l5100:	
	movlw	low(01h)
	subwf	(_Minutes),f
	line	116
	
l5102:	
;DriveTime.c: 116: CountMin();
	fcall	_CountMin
	line	118
	
l5104:	
;DriveTime.c: 118: if (!Minutes)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_Minutes),f
	skipz
	goto	u4291
	goto	u4290
u4291:
	goto	l574
u4290:
	line	120
	
l5106:	
;DriveTime.c: 119: {
;DriveTime.c: 120: Minutes = 60;
	movlw	(03Ch)
	movwf	(??_DriveTime+0)+0
	movf	(??_DriveTime+0)+0,w
	movwf	(_Minutes)
	line	122
	
l5108:	
;DriveTime.c: 122: if(RelayS.Com)DriveEEV();
	btfss	(_RelayS),0
	goto	u4301
	goto	u4300
u4301:
	goto	l574
u4300:
	
l5110:	
	fcall	_DriveEEV
	goto	l574
	
l573:	
	goto	l574
	line	123
	
l572:	
	goto	l574
	line	124
	
l571:	
	goto	l574
	line	125
	
l568:	
	goto	l574
	line	126
	
l562:	
	line	127
	
l574:	
	return
	opt stack 0
GLOBAL	__end_of_DriveTime
	__end_of_DriveTime:
;; =============== function _DriveTime ends ============

	signat	_DriveTime,88
	global	_HPOuUnit
psect	text552,local,class=CODE,delta=2
global __ptext552
__ptext552:

;; *************** function _HPOuUnit *****************
;; Defined at:
;;		line 46 in file "C:\Users\Administrator\Desktop\pic16f73\HPsystem.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       1       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_HPShut
;; This function is called by:
;;		_HPSystem
;; This function uses a non-reentrant model
;;
psect	text552
	file	"C:\Users\Administrator\Desktop\pic16f73\HPsystem.c"
	line	46
	global	__size_of_HPOuUnit
	__size_of_HPOuUnit	equ	__end_of_HPOuUnit-_HPOuUnit
	
_HPOuUnit:	
	opt	stack 4
; Regs used in _HPOuUnit: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	47
	
l4956:	
;HPsystem.c: 47: if (Judge.Working==NoWork)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	rrf	(_Judge),w
	movwf	(??_HPOuUnit+0)+0
	rrf	(??_HPOuUnit+0)+0,w
	andlw	(1<<3)-1
	iorlw	0
	skipz
	goto	u4001
	goto	u4000
u4001:
	goto	l4960
u4000:
	line	48
	
l4958:	
;HPsystem.c: 48: {HPShut();}
	fcall	_HPShut
	goto	l2878
	line	49
	
l2846:	
	
l4960:	
;HPsystem.c: 49: else if (Judge.Working)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	rrf	(_Judge),w
	movwf	(??_HPOuUnit+0)+0
	rrf	(??_HPOuUnit+0)+0,w
	andlw	(1<<3)-1
	xorlw	0
	skipnz
	goto	u4011
	goto	u4010
u4011:
	goto	l2878
u4010:
	line	52
	
l4962:	
;HPsystem.c: 50: {
;HPsystem.c: 52: if (Judge.Defog)
	btfss	0+(_Judge)+01h,2
	goto	u4021
	goto	u4020
u4021:
	goto	l4996
u4020:
	line	55
	
l4964:	
;HPsystem.c: 53: {
;HPsystem.c: 55: if (Judge.DefogStop)
	btfss	0+(_Judge)+01h,4
	goto	u4031
	goto	u4030
u4031:
	goto	l4974
u4030:
	line	57
	
l4966:	
;HPsystem.c: 56: {
;HPsystem.c: 57: if (TM.DefogStop>=30)
	movlw	(01Eh)
	subwf	0+(_TM)+05h,w
	skipc
	goto	u4041
	goto	u4040
u4041:
	goto	l4970
u4040:
	line	59
	
l4968:	
;HPsystem.c: 58: {
;HPsystem.c: 59: Judge.DefogStop=0;Judge.Defog=0;
	bcf	0+(_Judge)+01h,4
	bcf	0+(_Judge)+01h,2
	line	60
;HPsystem.c: 60: TM.DefogStop=0;RelayS.Com=1;
	clrf	0+(_TM)+05h
	bsf	(_RelayS),0
	line	61
;HPsystem.c: 61: }
	goto	l2878
	line	62
	
l2851:	
	
l4970:	
;HPsystem.c: 62: else if (TM.DefogStop>=25)
	movlw	(019h)
	subwf	0+(_TM)+05h,w
	skipc
	goto	u4051
	goto	u4050
u4051:
	goto	l2853
u4050:
	line	63
	
l4972:	
;HPsystem.c: 63: {RelayS.Fway=0;}
	bcf	(_RelayS),3
	goto	l2878
	line	64
	
l2853:	
;HPsystem.c: 64: else {RelayS.Com=0;RelayS.Fan=1;}
	bcf	(_RelayS),0
	bsf	(_RelayS),2
	goto	l2878
	
l2854:	
	goto	l2878
	
l2852:	
	line	65
;HPsystem.c: 65: }
	goto	l2878
	line	67
	
l2850:	
	
l4974:	
;HPsystem.c: 67: else if (TM.Defoging>4800)
	movlw	high(012C1h)
	subwf	1+(_TM)+06h,w
	movlw	low(012C1h)
	skipnz
	subwf	0+(_TM)+06h,w
	skipc
	goto	u4061
	goto	u4060
u4061:
	goto	l4980
u4060:
	line	68
	
l4976:	
;HPsystem.c: 68: {Judge.DefogStop=1;TM.DefogStop=1;}
	bsf	0+(_Judge)+01h,4
	
l4978:	
	clrf	0+(_TM)+05h
	bsf	status,0
	rlf	0+(_TM)+05h,f
	goto	l2878
	line	69
	
l2856:	
	
l4980:	
;HPsystem.c: 69: else if ((TM.Defoging>120)&&(T[UP]>10))
	movlw	high(079h)
	subwf	1+(_TM)+06h,w
	movlw	low(079h)
	skipnz
	subwf	0+(_TM)+06h,w
	skipc
	goto	u4071
	goto	u4070
u4071:
	goto	l4988
u4070:
	
l4982:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_T+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Bh))^80h
	subwf	btemp+1,w
	skipz
	goto	u4085
	movlw	low(0Bh)
	subwf	(_T)^080h,w
u4085:

	skipc
	goto	u4081
	goto	u4080
u4081:
	goto	l4988
u4080:
	line	70
	
l4984:	
;HPsystem.c: 70: {Judge.DefogStop=1;TM.DefogStop=1;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	0+(_Judge)+01h,4
	
l4986:	
	clrf	0+(_TM)+05h
	bsf	status,0
	rlf	0+(_TM)+05h,f
	goto	l2878
	line	72
	
l2858:	
	
l4988:	
;HPsystem.c: 72: else if (TM.Defoging>60)
	movlw	high(03Dh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	1+(_TM)+06h,w
	movlw	low(03Dh)
	skipnz
	subwf	0+(_TM)+06h,w
	skipc
	goto	u4091
	goto	u4090
u4091:
	goto	l4992
u4090:
	line	74
	
l4990:	
;HPsystem.c: 73: {
;HPsystem.c: 74: RelayS.Com=1;}
	bsf	(_RelayS),0
	goto	l2878
	line	75
	
l2860:	
	
l4992:	
;HPsystem.c: 75: else if (TM.Defoging>30)
	movlw	high(01Fh)
	subwf	1+(_TM)+06h,w
	movlw	low(01Fh)
	skipnz
	subwf	0+(_TM)+06h,w
	skipc
	goto	u4101
	goto	u4100
u4101:
	goto	l2862
u4100:
	line	76
	
l4994:	
;HPsystem.c: 76: {RelayS.Fway=1;}
	bsf	(_RelayS),3
	goto	l2878
	line	77
	
l2862:	
;HPsystem.c: 77: else {RelayS.Com=0;RelayS.Fan=0;}
	bcf	(_RelayS),0
	bcf	(_RelayS),2
	goto	l2878
	
l2863:	
	goto	l2878
	
l2861:	
	goto	l2878
	
l2859:	
	goto	l2878
	
l2857:	
	goto	l2878
	
l2855:	
	line	78
;HPsystem.c: 78: }
	goto	l2878
	line	80
	
l2849:	
	
l4996:	
;HPsystem.c: 80: else if((TM.ComStop>=180)||(!TM.ComStop))
	movlw	(0B4h)
	subwf	0+(_TM)+04h,w
	skipnc
	goto	u4111
	goto	u4110
u4111:
	goto	l2867
u4110:
	
l4998:	
	movf	0+(_TM)+04h,f
	skipz
	goto	u4121
	goto	u4120
u4121:
	goto	l2878
u4120:
	
l2867:	
	line	82
;HPsystem.c: 81: {
;HPsystem.c: 82: RelayS.Fway=0;
	bcf	(_RelayS),3
	line	83
	
l5000:	
;HPsystem.c: 83: if (TM.DefogScan>=40)
	movf	0+(_TM)+08h,w
	andlw	(1<<6)-1
	movwf	(??_HPOuUnit+0)+0
	movlw	low(028h)
	subwf	(??_HPOuUnit+0)+0,w
	skipc
	goto	u4131
	goto	u4130
u4131:
	goto	l5010
u4130:
	line	85
	
l5002:	
;HPsystem.c: 84: {
;HPsystem.c: 85: if ((T[UP]<0)&&(T[E]<4))
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(_T+1)^080h,7
	goto	u4141
	goto	u4140
u4141:
	goto	l2878
u4140:
	
l5004:	
	movf	1+(_T)^080h+02h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(04h))^80h
	subwf	btemp+1,w
	skipz
	goto	u4155
	movlw	low(04h)
	subwf	0+(_T)^080h+02h,w
u4155:

	skipnc
	goto	u4151
	goto	u4150
u4151:
	goto	l2878
u4150:
	line	86
	
l5006:	
;HPsystem.c: 86: {Judge.Defog=1;TM.Defoging=1;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	0+(_Judge)+01h,2
	
l5008:	
	movlw	low(01h)
	movwf	0+(_TM)+06h
	movlw	high(01h)
	movwf	(0+(_TM)+06h)+1
	goto	l2878
	
l2869:	
	line	87
;HPsystem.c: 87: }
	goto	l2878
	line	88
	
l2868:	
	
l5010:	
;HPsystem.c: 88: else if (TM.PumpRun>=30)
	movlw	(01Eh)
	subwf	(_TM),w
	skipc
	goto	u4161
	goto	u4160
u4161:
	goto	l5024
u4160:
	line	90
	
l5012:	
;HPsystem.c: 89: {
;HPsystem.c: 90: RelayS.Com=1;
	bsf	(_RelayS),0
	line	91
	
l5014:	
;HPsystem.c: 91: if(!TM.ComRun)
	movf	0+(_TM)+03h,f
	skipz
	goto	u4171
	goto	u4170
u4171:
	goto	l5018
u4170:
	line	92
	
l5016:	
;HPsystem.c: 92: TM.ComRun=1;
	clrf	0+(_TM)+03h
	bsf	status,0
	rlf	0+(_TM)+03h,f
	goto	l5018
	
l2872:	
	line	93
	
l5018:	
;HPsystem.c: 93: TM.ComStop=0;
	clrf	0+(_TM)+04h
	line	94
	
l5020:	
;HPsystem.c: 94: if(!TM.DefogScan)
	movf	0+(_TM)+08h,w
	andlw	(1<<6)-1
	iorlw	0
	skipz
	goto	u4181
	goto	u4180
u4181:
	goto	l2878
u4180:
	line	95
	
l5022:	
;HPsystem.c: 95: TM.DefogScan=1;
	movf	0+(_TM)+08h,w
	andlw	not (((1<<6)-1)<<0)
	iorlw	(01h & ((1<<6)-1))<<0
	movwf	0+(_TM)+08h
	goto	l2878
	
l2873:	
	line	96
;HPsystem.c: 96: }
	goto	l2878
	line	97
	
l2871:	
	
l5024:	
;HPsystem.c: 97: else if (TM.PumpRun>=25)
	movlw	(019h)
	subwf	(_TM),w
	skipc
	goto	u4191
	goto	u4190
u4191:
	goto	l2875
u4190:
	line	98
	
l5026:	
;HPsystem.c: 98: {RelayS.Fan=1;}
	bsf	(_RelayS),2
	goto	l2878
	line	99
	
l2875:	
	line	101
;HPsystem.c: 99: else
;HPsystem.c: 100: {
;HPsystem.c: 101: RelayS.Pump=1;
	bsf	(_RelayS),1
	line	102
	
l5028:	
;HPsystem.c: 102: TM.PumpStop=0;
	clrf	0+(_TM)+01h
	clrf	1+(_TM)+01h
	line	103
	
l5030:	
;HPsystem.c: 103: if (!TM.PumpRun)
	movf	(_TM),f
	skipz
	goto	u4201
	goto	u4200
u4201:
	goto	l2878
u4200:
	line	104
	
l5032:	
;HPsystem.c: 104: {TM.PumpRun=1;}
	clrf	(_TM)
	bsf	status,0
	rlf	(_TM),f
	goto	l2878
	
l2877:	
	goto	l2878
	line	105
	
l2876:	
	goto	l2878
	
l2874:	
	goto	l2878
	
l2870:	
	goto	l2878
	line	106
	
l2865:	
	goto	l2878
	line	107
	
l2864:	
	goto	l2878
	
l2848:	
	goto	l2878
	line	108
	
l2847:	
	
l2878:	
	return
	opt stack 0
GLOBAL	__end_of_HPOuUnit
	__end_of_HPOuUnit:
;; =============== function _HPOuUnit ends ============

	signat	_HPOuUnit,88
	global	_HPstart
psect	text553,local,class=CODE,delta=2
global __ptext553
__ptext553:

;; *************** function _HPstart *****************
;; Defined at:
;;		line 14 in file "C:\Users\Administrator\Desktop\pic16f73\HPsystem.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       2       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_abs
;;		_delay2ms
;; This function is called by:
;;		_HPSystem
;; This function uses a non-reentrant model
;;
psect	text553
	file	"C:\Users\Administrator\Desktop\pic16f73\HPsystem.c"
	line	14
	global	__size_of_HPstart
	__size_of_HPstart	equ	__end_of_HPstart-_HPstart
	
_HPstart:	
	opt	stack 4
; Regs used in _HPstart: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	15
	
l4924:	
;HPsystem.c: 15: if((RB0==0)&&(T[3]<=60))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(48/8),(48)&7
	goto	u3911
	goto	u3910
u3911:
	goto	l2833
u3910:
	
l4926:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	1+(_T)^080h+06h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03Dh))^80h
	subwf	btemp+1,w
	skipz
	goto	u3925
	movlw	low(03Dh)
	subwf	0+(_T)^080h+06h,w
u3925:

	skipnc
	goto	u3921
	goto	u3920
u3921:
	goto	l2833
u3920:
	line	19
	
l4928:	
;HPsystem.c: 16: {
;HPsystem.c: 19: ff=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_ff)
	clrf	(_ff+1)
	line	20
	
l4930:	
;HPsystem.c: 20: if(SysErr.P6)
	btfss	(_SysErr),6
	goto	u3931
	goto	u3930
u3931:
	goto	l4940
u3930:
	line	22
	
l4932:	
;HPsystem.c: 21: {
;HPsystem.c: 22: if(ee==0)
	movf	((_ee+1)),w
	iorwf	((_ee)),w
	skipz
	goto	u3941
	goto	u3940
u3941:
	goto	l4936
u3940:
	line	23
	
l4934:	
;HPsystem.c: 23: {t2=Clock;ee=1;}
	movf	(_Clock),w
	movwf	(??_HPstart+0)+0
	clrf	(??_HPstart+0)+0+1
	movf	0+(??_HPstart+0)+0,w
	movwf	(_t2)
	movf	1+(??_HPstart+0)+0,w
	movwf	(_t2+1)
	movlw	low(01h)
	movwf	(_ee)
	movlw	high(01h)
	movwf	((_ee))+1
	goto	l4936
	
l2835:	
	line	24
	
l4936:	
;HPsystem.c: 24: if(abs(Clock-t2)>29)
	comf	(_t2),w
	movwf	(??_HPstart+0)+0
	comf	(_t2+1),w
	movwf	((??_HPstart+0)+0+1)
	incf	(??_HPstart+0)+0,f
	skipnz
	incf	((??_HPstart+0)+0+1),f
	movf	(_Clock),w
	addwf	0+(??_HPstart+0)+0,w
	movwf	(?_abs)
	movf	1+(??_HPstart+0)+0,w
	skipnc
	incf	1+(??_HPstart+0)+0,w
	movwf	((?_abs))+1
	fcall	_abs
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_abs)),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01Eh))^80h
	subwf	btemp+1,w
	skipz
	goto	u3955
	movlw	low(01Eh)
	subwf	(0+(?_abs)),w
u3955:

	skipc
	goto	u3951
	goto	u3950
u3951:
	goto	l2843
u3950:
	line	25
	
l4938:	
;HPsystem.c: 25: Judge.Working=NoWork;
	movlw	((0 & ((1<<3)-1))<<2)|not (((1<<3)-1)<<2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(_Judge),f
	goto	l2843
	
l2836:	
	line	26
;HPsystem.c: 26: }
	goto	l2843
	line	27
	
l2834:	
	
l4940:	
;HPsystem.c: 27: else if(T[3]<=57)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	1+(_T)^080h+06h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u3965
	movlw	low(03Ah)
	subwf	0+(_T)^080h+06h,w
u3965:

	skipnc
	goto	u3961
	goto	u3960
u3961:
	goto	l2843
u3960:
	line	29
	
l4942:	
;HPsystem.c: 28: {
;HPsystem.c: 29: Judge.Working=WorkH;ee=0;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_Judge),w
	andlw	not (((1<<3)-1)<<2)
	iorlw	(02h & ((1<<3)-1))<<2
	movwf	(_Judge)
	
l4944:	
	clrf	(_ee)
	clrf	(_ee+1)
	goto	l2843
	
l2838:	
	goto	l2843
	line	30
	
l2837:	
;HPsystem.c: 30: }
	goto	l2843
	line	31
	
l2833:	
;HPsystem.c: 31: else if(RB0==1) {delay2ms(1);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(48/8),(48)&7
	goto	u3971
	goto	u3970
u3971:
	goto	l2843
u3970:
	
l4946:	
	movlw	low(01h)
	movwf	(?_delay2ms)
	movlw	high(01h)
	movwf	((?_delay2ms))+1
	fcall	_delay2ms
	line	32
	
l4948:	
;HPsystem.c: 32: if(ff==0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((_ff+1)),w
	iorwf	((_ff)),w
	skipz
	goto	u3981
	goto	u3980
u3981:
	goto	l4952
u3980:
	line	33
	
l4950:	
;HPsystem.c: 33: {t1=Clock;ff=1;}
	movf	(_Clock),w
	movwf	(??_HPstart+0)+0
	clrf	(??_HPstart+0)+0+1
	movf	0+(??_HPstart+0)+0,w
	movwf	(_t1)
	movf	1+(??_HPstart+0)+0,w
	movwf	(_t1+1)
	movlw	low(01h)
	movwf	(_ff)
	movlw	high(01h)
	movwf	((_ff))+1
	goto	l4952
	
l2841:	
	line	34
	
l4952:	
;HPsystem.c: 34: if(abs(Clock-t1)>29)
	comf	(_t1),w
	movwf	(??_HPstart+0)+0
	comf	(_t1+1),w
	movwf	((??_HPstart+0)+0+1)
	incf	(??_HPstart+0)+0,f
	skipnz
	incf	((??_HPstart+0)+0+1),f
	movf	(_Clock),w
	addwf	0+(??_HPstart+0)+0,w
	movwf	(?_abs)
	movf	1+(??_HPstart+0)+0,w
	skipnc
	incf	1+(??_HPstart+0)+0,w
	movwf	((?_abs))+1
	fcall	_abs
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_abs)),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01Eh))^80h
	subwf	btemp+1,w
	skipz
	goto	u3995
	movlw	low(01Eh)
	subwf	(0+(?_abs)),w
u3995:

	skipc
	goto	u3991
	goto	u3990
u3991:
	goto	l2843
u3990:
	line	35
	
l4954:	
;HPsystem.c: 35: Judge.Working=NoWork;
	movlw	((0 & ((1<<3)-1))<<2)|not (((1<<3)-1)<<2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(_Judge),f
	goto	l2843
	
l2842:	
	goto	l2843
	line	36
	
l2840:	
	goto	l2843
	line	38
	
l2839:	
	
l2843:	
	return
	opt stack 0
GLOBAL	__end_of_HPstart
	__end_of_HPstart:
;; =============== function _HPstart ends ============

	signat	_HPstart,88
	global	_eevinit
psect	text554,local,class=CODE,delta=2
global __ptext554
__ptext554:

;; *************** function _eevinit *****************
;; Defined at:
;;		line 27 in file "C:\Users\Administrator\Desktop\pic16f73\eev.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2   13[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       1       0
;;      Totals:         0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_delay2ms
;;		_eevdriver
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text554
	file	"C:\Users\Administrator\Desktop\pic16f73\eev.c"
	line	27
	global	__size_of_eevinit
	__size_of_eevinit	equ	__end_of_eevinit-_eevinit
	
_eevinit:	
	opt	stack 4
; Regs used in _eevinit: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	
l4882:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(eevinit@i)
	movlw	high(01h)
	movwf	((eevinit@i))+1
	line	30
	
l4884:	
;eev.c: 30: PORTC=STEP[0];
	movlw	low(_STEP|8000h)
	movwf	fsr0
	movlw	high(_STEP|8000h)
	movwf	btemp+1
	fcall	stringtab
	movwf	(7)	;volatile
	line	31
	
l4886:	
;eev.c: 31: delay2ms(200);
	movlw	low(0C8h)
	movwf	(?_delay2ms)
	movlw	high(0C8h)
	movwf	((?_delay2ms))+1
	fcall	_delay2ms
	line	32
;eev.c: 32: while(i<250)
	goto	l4894
	
l1115:	
	line	33
	
l4888:	
;eev.c: 33: {eevdriver(1);
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_eevdriver)
	movlw	high(01h)
	movwf	((?_eevdriver))+1
	fcall	_eevdriver
	line	34
	
l4890:	
;eev.c: 34: i++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(eevinit@i),f
	skipnc
	incf	(eevinit@i+1),f
	movlw	high(01h)
	addwf	(eevinit@i+1),f
	line	35
	
l4892:	
;eev.c: 35: delay2ms(8);
	movlw	low(08h)
	movwf	(?_delay2ms)
	movlw	high(08h)
	movwf	((?_delay2ms))+1
	fcall	_delay2ms
	goto	l4894
	line	36
	
l1114:	
	line	32
	
l4894:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(eevinit@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0FAh))^80h
	subwf	btemp+1,w
	skipz
	goto	u3885
	movlw	low(0FAh)
	subwf	(eevinit@i),w
u3885:

	skipc
	goto	u3881
	goto	u3880
u3881:
	goto	l4888
u3880:
	goto	l4902
	
l1116:	
	line	37
;eev.c: 36: }
;eev.c: 37: while(i<560)
	goto	l4902
	
l1118:	
	line	38
	
l4896:	
;eev.c: 38: {eevdriver(0);
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_eevdriver)
	movlw	high(0)
	movwf	((?_eevdriver))+1
	fcall	_eevdriver
	line	39
	
l4898:	
;eev.c: 39: i++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(eevinit@i),f
	skipnc
	incf	(eevinit@i+1),f
	movlw	high(01h)
	addwf	(eevinit@i+1),f
	line	40
	
l4900:	
;eev.c: 40: delay2ms(8);
	movlw	low(08h)
	movwf	(?_delay2ms)
	movlw	high(08h)
	movwf	((?_delay2ms))+1
	fcall	_delay2ms
	goto	l4902
	line	41
	
l1117:	
	line	37
	
l4902:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(eevinit@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0230h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3895
	movlw	low(0230h)
	subwf	(eevinit@i),w
u3895:

	skipc
	goto	u3891
	goto	u3890
u3891:
	goto	l4896
u3890:
	goto	l4904
	
l1119:	
	line	42
	
l4904:	
;eev.c: 41: }
;eev.c: 42: PORTC=STEP[stepcount];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_stepcount),w
	movwf	(??_eevinit+0)+0
	addwf	(??_eevinit+0)+0,w
	addlw	low(_STEP|8000h)
	movwf	fsr0
	movlw	high(_STEP|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(7)	;volatile
	line	43
	
l4906:	
;eev.c: 43: delay2ms(200);
	movlw	low(0C8h)
	movwf	(?_delay2ms)
	movlw	high(0C8h)
	movwf	((?_delay2ms))+1
	fcall	_delay2ms
	line	44
	
l4908:	
;eev.c: 44: i=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(eevinit@i)
	clrf	(eevinit@i+1)
	line	45
;eev.c: 45: while(i<250)
	goto	l4916
	
l1121:	
	line	46
	
l4910:	
;eev.c: 46: {eevdriver(1);
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_eevdriver)
	movlw	high(01h)
	movwf	((?_eevdriver))+1
	fcall	_eevdriver
	line	47
	
l4912:	
;eev.c: 47: i++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(eevinit@i),f
	skipnc
	incf	(eevinit@i+1),f
	movlw	high(01h)
	addwf	(eevinit@i+1),f
	line	48
	
l4914:	
;eev.c: 48: delay2ms(8);
	movlw	low(08h)
	movwf	(?_delay2ms)
	movlw	high(08h)
	movwf	((?_delay2ms))+1
	fcall	_delay2ms
	goto	l4916
	line	49
	
l1120:	
	line	45
	
l4916:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(eevinit@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0FAh))^80h
	subwf	btemp+1,w
	skipz
	goto	u3905
	movlw	low(0FAh)
	subwf	(eevinit@i),w
u3905:

	skipc
	goto	u3901
	goto	u3900
u3901:
	goto	l4910
u3900:
	goto	l4918
	
l1122:	
	line	50
	
l4918:	
;eev.c: 49: }
;eev.c: 50: PORTC=STEP[stepcount];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_stepcount),w
	movwf	(??_eevinit+0)+0
	addwf	(??_eevinit+0)+0,w
	addlw	low(_STEP|8000h)
	movwf	fsr0
	movlw	high(_STEP|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(7)	;volatile
	line	51
	
l4920:	
;eev.c: 51: delay2ms(240);
	movlw	low(0F0h)
	movwf	(?_delay2ms)
	movlw	high(0F0h)
	movwf	((?_delay2ms))+1
	fcall	_delay2ms
	line	52
	
l4922:	
;eev.c: 52: PORTC=0xf0;
	movlw	(0F0h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	56
	
l1123:	
	return
	opt stack 0
GLOBAL	__end_of_eevinit
	__end_of_eevinit:
;; =============== function _eevinit ends ============

	signat	_eevinit,88
	global	_DriveEEV
psect	text555,local,class=CODE,delta=2
global __ptext555
__ptext555:

;; *************** function _DriveEEV *****************
;; Defined at:
;;		line 69 in file "C:\Users\Administrator\Desktop\pic16f73\eev.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  x               2   14[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       2       0
;;      Totals:         0       4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_eevdriver
;;		_delay2ms
;; This function is called by:
;;		_DriveTime
;; This function uses a non-reentrant model
;;
psect	text555
	file	"C:\Users\Administrator\Desktop\pic16f73\eev.c"
	line	69
	global	__size_of_DriveEEV
	__size_of_DriveEEV	equ	__end_of_DriveEEV-_DriveEEV
	
_DriveEEV:	
	opt	stack 3
; Regs used in _DriveEEV: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	70
	
l4848:	
;eev.c: 70: if((EEVSTEP>150)&&(EEVSTEP<400))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_EEVSTEP+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(097h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3835
	movlw	low(097h)
	subwf	(_EEVSTEP),w
u3835:

	skipc
	goto	u3831
	goto	u3830
u3831:
	goto	l1149
u3830:
	
l4850:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_EEVSTEP+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0190h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3845
	movlw	low(0190h)
	subwf	(_EEVSTEP),w
u3845:

	skipnc
	goto	u3841
	goto	u3840
u3841:
	goto	l1149
u3840:
	line	71
	
l4852:	
;eev.c: 71: { int x=T[2]-T[0]-5;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_T)^080h,w
	addlw	low(05h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DriveEEV+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_T+1)^080h,w
	skipnc
	addlw	1
	addlw	high(05h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(??_DriveEEV+0)+0
	comf	(??_DriveEEV+0)+0,f
	comf	(??_DriveEEV+0)+1,f
	incf	(??_DriveEEV+0)+0,f
	skipnz
	incf	(??_DriveEEV+0)+1,f
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_T)^080h+04h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	0+(??_DriveEEV+0)+0,w
	movwf	(DriveEEV@x)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	1+(_T)^080h+04h,w
	skipnc
	incf	1+(_T)^080h+04h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	1+(??_DriveEEV+0)+0,w
	movwf	1+(DriveEEV@x)
	line	72
	
l4854:	
;eev.c: 72: if(x>0)
	movf	(DriveEEV@x+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3855
	movlw	low(01h)
	subwf	(DriveEEV@x),w
u3855:

	skipc
	goto	u3851
	goto	u3850
u3851:
	goto	l4872
u3850:
	goto	l4864
	line	73
	
l4856:	
;eev.c: 73: for(;!x;x--)
	goto	l4864
	line	74
	
l1143:	
	
l4858:	
;eev.c: 74: { eevdriver(1);
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_eevdriver)
	movlw	high(01h)
	movwf	((?_eevdriver))+1
	fcall	_eevdriver
	line	75
	
l4860:	
;eev.c: 75: delay2ms(8);}
	movlw	low(08h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay2ms)
	movlw	high(08h)
	movwf	((?_delay2ms))+1
	fcall	_delay2ms
	line	73
	
l4862:	
	movlw	low(-1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(DriveEEV@x),f
	skipnc
	incf	(DriveEEV@x+1),f
	movlw	high(-1)
	addwf	(DriveEEV@x+1),f
	goto	l4864
	
l1142:	
	
l4864:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(DriveEEV@x+1),w
	iorwf	(DriveEEV@x),w
	skipnz
	goto	u3861
	goto	u3860
u3861:
	goto	l4858
u3860:
	goto	l4874
	
l1144:	
	line	75
	goto	l4874
	line	76
	
l1141:	
	line	77
;eev.c: 76: else
;eev.c: 77: for(;!x;x++)
	goto	l4872
	line	78
	
l1147:	
	
l4866:	
;eev.c: 78: { eevdriver(1);
	movlw	low(01h)
	movwf	(?_eevdriver)
	movlw	high(01h)
	movwf	((?_eevdriver))+1
	fcall	_eevdriver
	line	79
	
l4868:	
;eev.c: 79: delay2ms(8);}
	movlw	low(08h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay2ms)
	movlw	high(08h)
	movwf	((?_delay2ms))+1
	fcall	_delay2ms
	line	77
	
l4870:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(DriveEEV@x),f
	skipnc
	incf	(DriveEEV@x+1),f
	movlw	high(01h)
	addwf	(DriveEEV@x+1),f
	goto	l4872
	
l1146:	
	
l4872:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(DriveEEV@x+1),w
	iorwf	(DriveEEV@x),w
	skipnz
	goto	u3871
	goto	u3870
u3871:
	goto	l4866
u3870:
	goto	l4874
	
l1148:	
	goto	l4874
	line	79
	
l1145:	
	line	80
	
l4874:	
;eev.c: 80: PORTC= STEP[stepcount];
	movf	(_stepcount),w
	movwf	(??_DriveEEV+0)+0
	addwf	(??_DriveEEV+0)+0,w
	addlw	low(_STEP|8000h)
	movwf	fsr0
	movlw	high(_STEP|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(7)	;volatile
	line	82
	
l4876:	
;eev.c: 82: delay2ms(240);
	movlw	low(0F0h)
	movwf	(?_delay2ms)
	movlw	high(0F0h)
	movwf	((?_delay2ms))+1
	fcall	_delay2ms
	line	83
	
l4878:	
;eev.c: 83: PORTC=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	84
	
l4880:	
;eev.c: 84: EEVSTEP+=x;
	movf	(DriveEEV@x),w
	addwf	(_EEVSTEP),f
	skipnc
	incf	(_EEVSTEP+1),f
	movf	(DriveEEV@x+1),w
	addwf	(_EEVSTEP+1),f
	goto	l1149
	line	85
	
l1140:	
	line	86
	
l1149:	
	return
	opt stack 0
GLOBAL	__end_of_DriveEEV
	__end_of_DriveEEV:
;; =============== function _DriveEEV ends ============

	signat	_DriveEEV,88
	global	___aldiv
psect	text556,local,class=CODE,delta=2
global __ptext556
__ptext556:

;; *************** function ___aldiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\aldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4   18[BANK0 ] long 
;;  dividend        4   22[BANK0 ] long 
;; Auto vars:     Size  Location     Type
;;  quotient        4   29[BANK0 ] long 
;;  sign            1   28[BANK0 ] unsigned char 
;;  counter         1   27[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4   18[BANK0 ] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       8       0
;;      Locals:         0       6       0
;;      Temps:          0       1       0
;;      Totals:         0      15       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text556
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\aldiv.c"
	line	5
	global	__size_of___aldiv
	__size_of___aldiv	equ	__end_of___aldiv-___aldiv
	
___aldiv:	
	opt	stack 6
; Regs used in ___aldiv: [wreg+status,2+status,0]
	line	9
	
l4806:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___aldiv@sign)
	line	10
	btfss	(___aldiv@divisor+3),7
	goto	u3731
	goto	u3730
u3731:
	goto	l4812
u3730:
	line	11
	
l4808:	
	comf	(___aldiv@divisor),f
	comf	(___aldiv@divisor+1),f
	comf	(___aldiv@divisor+2),f
	comf	(___aldiv@divisor+3),f
	incf	(___aldiv@divisor),f
	skipnz
	incf	(___aldiv@divisor+1),f
	skipnz
	incf	(___aldiv@divisor+2),f
	skipnz
	incf	(___aldiv@divisor+3),f
	line	12
	
l4810:	
	clrf	(___aldiv@sign)
	bsf	status,0
	rlf	(___aldiv@sign),f
	goto	l4812
	line	13
	
l3109:	
	line	14
	
l4812:	
	btfss	(___aldiv@dividend+3),7
	goto	u3741
	goto	u3740
u3741:
	goto	l4818
u3740:
	line	15
	
l4814:	
	comf	(___aldiv@dividend),f
	comf	(___aldiv@dividend+1),f
	comf	(___aldiv@dividend+2),f
	comf	(___aldiv@dividend+3),f
	incf	(___aldiv@dividend),f
	skipnz
	incf	(___aldiv@dividend+1),f
	skipnz
	incf	(___aldiv@dividend+2),f
	skipnz
	incf	(___aldiv@dividend+3),f
	line	16
	
l4816:	
	movlw	(01h)
	movwf	(??___aldiv+0)+0
	movf	(??___aldiv+0)+0,w
	xorwf	(___aldiv@sign),f
	goto	l4818
	line	17
	
l3110:	
	line	18
	
l4818:	
	movlw	0
	movwf	(___aldiv@quotient+3)
	movlw	0
	movwf	(___aldiv@quotient+2)
	movlw	0
	movwf	(___aldiv@quotient+1)
	movlw	0
	movwf	(___aldiv@quotient)

	line	19
	
l4820:	
	movf	(___aldiv@divisor+3),w
	iorwf	(___aldiv@divisor+2),w
	iorwf	(___aldiv@divisor+1),w
	iorwf	(___aldiv@divisor),w
	skipnz
	goto	u3751
	goto	u3750
u3751:
	goto	l4840
u3750:
	line	20
	
l4822:	
	clrf	(___aldiv@counter)
	bsf	status,0
	rlf	(___aldiv@counter),f
	line	21
	goto	l4826
	
l3113:	
	line	22
	
l4824:	
	movlw	01h
	movwf	(??___aldiv+0)+0
u3765:
	clrc
	rlf	(___aldiv@divisor),f
	rlf	(___aldiv@divisor+1),f
	rlf	(___aldiv@divisor+2),f
	rlf	(___aldiv@divisor+3),f
	decfsz	(??___aldiv+0)+0
	goto	u3765
	line	23
	movlw	(01h)
	movwf	(??___aldiv+0)+0
	movf	(??___aldiv+0)+0,w
	addwf	(___aldiv@counter),f
	goto	l4826
	line	24
	
l3112:	
	line	21
	
l4826:	
	btfss	(___aldiv@divisor+3),(31)&7
	goto	u3771
	goto	u3770
u3771:
	goto	l4824
u3770:
	goto	l4828
	
l3114:	
	goto	l4828
	line	25
	
l3115:	
	line	26
	
l4828:	
	movlw	01h
	movwf	(??___aldiv+0)+0
u3785:
	clrc
	rlf	(___aldiv@quotient),f
	rlf	(___aldiv@quotient+1),f
	rlf	(___aldiv@quotient+2),f
	rlf	(___aldiv@quotient+3),f
	decfsz	(??___aldiv+0)+0
	goto	u3785
	line	27
	
l4830:	
	movf	(___aldiv@divisor+3),w
	subwf	(___aldiv@dividend+3),w
	skipz
	goto	u3795
	movf	(___aldiv@divisor+2),w
	subwf	(___aldiv@dividend+2),w
	skipz
	goto	u3795
	movf	(___aldiv@divisor+1),w
	subwf	(___aldiv@dividend+1),w
	skipz
	goto	u3795
	movf	(___aldiv@divisor),w
	subwf	(___aldiv@dividend),w
u3795:
	skipc
	goto	u3791
	goto	u3790
u3791:
	goto	l4836
u3790:
	line	28
	
l4832:	
	movf	(___aldiv@divisor),w
	subwf	(___aldiv@dividend),f
	movf	(___aldiv@divisor+1),w
	skipc
	incfsz	(___aldiv@divisor+1),w
	subwf	(___aldiv@dividend+1),f
	movf	(___aldiv@divisor+2),w
	skipc
	incfsz	(___aldiv@divisor+2),w
	subwf	(___aldiv@dividend+2),f
	movf	(___aldiv@divisor+3),w
	skipc
	incfsz	(___aldiv@divisor+3),w
	subwf	(___aldiv@dividend+3),f
	line	29
	
l4834:	
	bsf	(___aldiv@quotient)+(0/8),(0)&7
	goto	l4836
	line	30
	
l3116:	
	line	31
	
l4836:	
	movlw	01h
u3805:
	clrc
	rrf	(___aldiv@divisor+3),f
	rrf	(___aldiv@divisor+2),f
	rrf	(___aldiv@divisor+1),f
	rrf	(___aldiv@divisor),f
	addlw	-1
	skipz
	goto	u3805

	line	32
	
l4838:	
	movlw	low(01h)
	subwf	(___aldiv@counter),f
	btfss	status,2
	goto	u3811
	goto	u3810
u3811:
	goto	l4828
u3810:
	goto	l4840
	
l3117:	
	goto	l4840
	line	33
	
l3111:	
	line	34
	
l4840:	
	movf	(___aldiv@sign),w
	skipz
	goto	u3820
	goto	l4844
u3820:
	line	35
	
l4842:	
	comf	(___aldiv@quotient),f
	comf	(___aldiv@quotient+1),f
	comf	(___aldiv@quotient+2),f
	comf	(___aldiv@quotient+3),f
	incf	(___aldiv@quotient),f
	skipnz
	incf	(___aldiv@quotient+1),f
	skipnz
	incf	(___aldiv@quotient+2),f
	skipnz
	incf	(___aldiv@quotient+3),f
	goto	l4844
	
l3118:	
	line	36
	
l4844:	
	movf	(___aldiv@quotient+3),w
	movwf	(?___aldiv+3)
	movf	(___aldiv@quotient+2),w
	movwf	(?___aldiv+2)
	movf	(___aldiv@quotient+1),w
	movwf	(?___aldiv+1)
	movf	(___aldiv@quotient),w
	movwf	(?___aldiv)

	goto	l3119
	
l4846:	
	line	37
	
l3119:	
	return
	opt stack 0
GLOBAL	__end_of___aldiv
	__end_of___aldiv:
;; =============== function ___aldiv ends ============

	signat	___aldiv,8316
	global	___lmul
psect	text557,local,class=CODE,delta=2
global __ptext557
__ptext557:

;; *************** function ___lmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    5[BANK0 ] unsigned long 
;;  multiplicand    4    9[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4   14[BANK0 ] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    5[BANK0 ] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       8       0
;;      Locals:         0       4       0
;;      Temps:          0       1       0
;;      Totals:         0      13       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text557
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lmul.c"
	line	3
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
	opt	stack 6
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	4
	
l4792:	
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(___lmul@product+3)
	movlw	0
	movwf	(___lmul@product+2)
	movlw	0
	movwf	(___lmul@product+1)
	movlw	0
	movwf	(___lmul@product)

	goto	l4794
	line	6
	
l2989:	
	line	7
	
l4794:	
	btfss	(___lmul@multiplier),(0)&7
	goto	u3681
	goto	u3680
u3681:
	goto	l4798
u3680:
	line	8
	
l4796:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3691
	addwf	(___lmul@product+1),f
u3691:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3692
	addwf	(___lmul@product+2),f
u3692:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3693
	addwf	(___lmul@product+3),f
u3693:

	goto	l4798
	
l2990:	
	line	9
	
l4798:	
	movlw	01h
	movwf	(??___lmul+0)+0
u3705:
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	decfsz	(??___lmul+0)+0
	goto	u3705
	line	10
	
l4800:	
	movlw	01h
u3715:
	clrc
	rrf	(___lmul@multiplier+3),f
	rrf	(___lmul@multiplier+2),f
	rrf	(___lmul@multiplier+1),f
	rrf	(___lmul@multiplier),f
	addlw	-1
	skipz
	goto	u3715

	line	11
	movf	(___lmul@multiplier+3),w
	iorwf	(___lmul@multiplier+2),w
	iorwf	(___lmul@multiplier+1),w
	iorwf	(___lmul@multiplier),w
	skipz
	goto	u3721
	goto	u3720
u3721:
	goto	l4794
u3720:
	goto	l4802
	
l2991:	
	line	12
	
l4802:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	goto	l2992
	
l4804:	
	line	13
	
l2992:	
	return
	opt stack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
;; =============== function ___lmul ends ============

	signat	___lmul,8316
	global	_HPShut
psect	text558,local,class=CODE,delta=2
global __ptext558
__ptext558:

;; *************** function _HPShut *****************
;; Defined at:
;;		line 110 in file "C:\Users\Administrator\Desktop\pic16f73\HPsystem.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_HPOuUnit
;; This function uses a non-reentrant model
;;
psect	text558
	file	"C:\Users\Administrator\Desktop\pic16f73\HPsystem.c"
	line	110
	global	__size_of_HPShut
	__size_of_HPShut	equ	__end_of_HPShut-_HPShut
	
_HPShut:	
	opt	stack 4
; Regs used in _HPShut: [wreg+status,2+status,0+btemp+1]
	line	111
	
l4754:	
;HPsystem.c: 111: if (TM.PumpStop>=360)
	movlw	high(0168h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	1+(_TM)+01h,w
	movlw	low(0168h)
	skipnz
	subwf	0+(_TM)+01h,w
	skipc
	goto	u3551
	goto	u3550
u3551:
	goto	l4770
u3550:
	line	114
	
l4756:	
;HPsystem.c: 112: {
;HPsystem.c: 114: if (T[E]>1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	1+(_T)^080h+02h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(02h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3565
	movlw	low(02h)
	subwf	0+(_T)^080h+02h,w
u3565:

	skipc
	goto	u3561
	goto	u3560
u3561:
	goto	l2882
u3560:
	line	115
	
l4758:	
;HPsystem.c: 115: {TM.PumpStop=1;}
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_TM)+01h
	movlw	high(01h)
	movwf	(0+(_TM)+01h)+1
	goto	l2898
	line	116
	
l2882:	
	line	118
;HPsystem.c: 116: else
;HPsystem.c: 117: {
;HPsystem.c: 118: RelayS.Pump=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RelayS),1
	line	119
	
l4760:	
;HPsystem.c: 119: if (!TM.PumpRun)
	movf	(_TM),f
	skipz
	goto	u3571
	goto	u3570
u3571:
	goto	l4764
u3570:
	line	120
	
l4762:	
;HPsystem.c: 120: {TM.PumpRun=1;}
	clrf	(_TM)
	bsf	status,0
	rlf	(_TM),f
	goto	l2898
	line	121
	
l2884:	
	
l4764:	
;HPsystem.c: 121: else if (TM.PumpRun>=60)
	movlw	(03Ch)
	subwf	(_TM),w
	skipc
	goto	u3581
	goto	u3580
u3581:
	goto	l2898
u3580:
	line	122
	
l4766:	
;HPsystem.c: 122: {TM.PumpRun=0;TM.PumpStop=1;}
	clrf	(_TM)
	
l4768:	
	movlw	low(01h)
	movwf	0+(_TM)+01h
	movlw	high(01h)
	movwf	(0+(_TM)+01h)+1
	goto	l2898
	
l2886:	
	goto	l2898
	line	123
	
l2885:	
	goto	l2898
	
l2883:	
	line	124
;HPsystem.c: 123: }
;HPsystem.c: 124: }
	goto	l2898
	line	125
	
l2881:	
	
l4770:	
;HPsystem.c: 125: else if(TM.ComRun>=120)
	movlw	(078h)
	subwf	0+(_TM)+03h,w
	skipc
	goto	u3591
	goto	u3590
u3591:
	goto	l4778
u3590:
	line	129
	
l4772:	
;HPsystem.c: 126: {
;HPsystem.c: 129: RelayS.Com=0;TM.ComRun=0;
	bcf	(_RelayS),0
	clrf	0+(_TM)+03h
	line	131
	
l4774:	
;HPsystem.c: 131: if (!TM.ComStop)
	movf	0+(_TM)+04h,f
	skipz
	goto	u3601
	goto	u3600
u3601:
	goto	l2898
u3600:
	line	132
	
l4776:	
;HPsystem.c: 132: {TM.ComStop=1;}
	clrf	0+(_TM)+04h
	bsf	status,0
	rlf	0+(_TM)+04h,f
	goto	l2898
	
l2889:	
	line	134
;HPsystem.c: 134: }
	goto	l2898
	line	137
	
l2888:	
	
l4778:	
;HPsystem.c: 137: else if (TM.ComStop>=35||(TM.ComRun==0&&TM.ComStop==0))
	movlw	(023h)
	subwf	0+(_TM)+04h,w
	skipnc
	goto	u3611
	goto	u3610
u3611:
	goto	l2893
u3610:
	
l4780:	
	movf	0+(_TM)+03h,f
	skipz
	goto	u3621
	goto	u3620
u3621:
	goto	l2898
u3620:
	
l4782:	
	movf	0+(_TM)+04h,f
	skipz
	goto	u3631
	goto	u3630
u3631:
	goto	l2898
u3630:
	
l2893:	
	line	138
;HPsystem.c: 138: { RelayS.Pump=0;TM.PumpRun=0;
	bcf	(_RelayS),1
	clrf	(_TM)
	line	139
	
l4784:	
;HPsystem.c: 139: if (!TM.PumpStop)
	movf	(1+(_TM)+01h),w
	iorwf	(0+(_TM)+01h),w
	skipz
	goto	u3641
	goto	u3640
u3641:
	goto	l2894
u3640:
	line	140
	
l4786:	
;HPsystem.c: 140: {TM.PumpStop=1;}
	movlw	low(01h)
	movwf	0+(_TM)+01h
	movlw	high(01h)
	movwf	(0+(_TM)+01h)+1
	
l2894:	
	line	141
;HPsystem.c: 141: if (TM.ComStop>=40||(TM.ComRun==0&&TM.ComStop==0))
	movlw	(028h)
	subwf	0+(_TM)+04h,w
	skipnc
	goto	u3651
	goto	u3650
u3651:
	goto	l2897
u3650:
	
l4788:	
	movf	0+(_TM)+03h,f
	skipz
	goto	u3661
	goto	u3660
u3661:
	goto	l2898
u3660:
	
l4790:	
	movf	0+(_TM)+04h,f
	skipz
	goto	u3671
	goto	u3670
u3671:
	goto	l2898
u3670:
	
l2897:	
	line	144
;HPsystem.c: 143: {
;HPsystem.c: 144: RelayS.Fan=0;
	bcf	(_RelayS),2
	goto	l2898
	line	145
	
l2895:	
	goto	l2898
	line	146
	
l2891:	
	goto	l2898
	line	147
	
l2890:	
	goto	l2898
	
l2887:	
	
l2898:	
	return
	opt stack 0
GLOBAL	__end_of_HPShut
	__end_of_HPShut:
;; =============== function _HPShut ends ============

	signat	_HPShut,88
	global	_abs
psect	text559,local,class=CODE,delta=2
global __ptext559
__ptext559:

;; *************** function _abs *****************
;; Defined at:
;;		line 5 in file "../../common/abs.c"
;; Parameters:    Size  Location     Type
;;  a               2    5[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2    5[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       0       0
;;      Temps:          0       2       0
;;      Totals:         0       4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_HPstart
;; This function uses a non-reentrant model
;;
psect	text559
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\abs.c"
	line	5
	global	__size_of_abs
	__size_of_abs	equ	__end_of_abs-_abs
	
_abs:	
	opt	stack 4
; Regs used in _abs: [wreg+status,2+status,0]
	line	6
	
l4748:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(abs@a+1),7
	goto	u3541
	goto	u3540
u3541:
	goto	l2904
u3540:
	line	7
	
l4750:	
	comf	(abs@a),w
	movwf	(??_abs+0)+0
	comf	(abs@a+1),w
	movwf	((??_abs+0)+0+1)
	incf	(??_abs+0)+0,f
	skipnz
	incf	((??_abs+0)+0+1),f
	movf	0+(??_abs+0)+0,w
	movwf	(?_abs)
	movf	1+(??_abs+0)+0,w
	movwf	(?_abs+1)
	goto	l2905
	
l4752:	
	goto	l2905
	
l2904:	
	line	8
	line	9
	
l2905:	
	return
	opt stack 0
GLOBAL	__end_of_abs
	__end_of_abs:
;; =============== function _abs ends ============

	signat	_abs,4218
	global	_DriveRelay
psect	text560,local,class=CODE,delta=2
global __ptext560
__ptext560:

;; *************** function _DriveRelay *****************
;; Defined at:
;;		line 20 in file "C:\Users\Administrator\Desktop\pic16f73\DriveRelay.c"
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
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text560
	file	"C:\Users\Administrator\Desktop\pic16f73\DriveRelay.c"
	line	20
	global	__size_of_DriveRelay
	__size_of_DriveRelay	equ	__end_of_DriveRelay-_DriveRelay
	
_DriveRelay:	
	opt	stack 6
; Regs used in _DriveRelay: []
	line	21
	
l4732:	
;DriveRelay.c: 21: if(RelayS.Com){if(RB7==0)RB7=1;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_RelayS),0
	goto	u3471
	goto	u3470
u3471:
	goto	l2269
u3470:
	
l4734:	
	btfsc	(55/8),(55)&7
	goto	u3481
	goto	u3480
u3481:
	goto	l2271
u3480:
	
l4736:	
	bsf	(55/8),(55)&7
	goto	l2271
	
l2270:	
	goto	l2271
	line	22
	
l2269:	
;DriveRelay.c: 22: else {RB7=0;}
	bcf	(55/8),(55)&7
	
l2271:	
	line	23
;DriveRelay.c: 23: if(RelayS.Pump){RB4=1;}
	btfss	(_RelayS),1
	goto	u3491
	goto	u3490
u3491:
	goto	l2272
u3490:
	
l4738:	
	bsf	(52/8),(52)&7
	goto	l2273
	line	24
	
l2272:	
;DriveRelay.c: 24: else {RB4=0;}
	bcf	(52/8),(52)&7
	
l2273:	
	line	25
;DriveRelay.c: 25: if(RelayS.Fan){if(RB5==0)RB5=1;}
	btfss	(_RelayS),2
	goto	u3501
	goto	u3500
u3501:
	goto	l2274
u3500:
	
l4740:	
	btfsc	(53/8),(53)&7
	goto	u3511
	goto	u3510
u3511:
	goto	l2276
u3510:
	
l4742:	
	bsf	(53/8),(53)&7
	goto	l2276
	
l2275:	
	goto	l2276
	line	26
	
l2274:	
;DriveRelay.c: 26: else {RB5=0;}
	bcf	(53/8),(53)&7
	
l2276:	
	line	27
;DriveRelay.c: 27: if(RelayS.Fway){if(RB6==0)RB6=1;}
	btfss	(_RelayS),3
	goto	u3521
	goto	u3520
u3521:
	goto	l2277
u3520:
	
l4744:	
	btfsc	(54/8),(54)&7
	goto	u3531
	goto	u3530
u3531:
	goto	l2280
u3530:
	
l4746:	
	bsf	(54/8),(54)&7
	goto	l2280
	
l2278:	
	goto	l2280
	line	28
	
l2277:	
;DriveRelay.c: 28: else {RB6=0;}
	bcf	(54/8),(54)&7
	goto	l2280
	
l2279:	
	line	30
	
l2280:	
	return
	opt stack 0
GLOBAL	__end_of_DriveRelay
	__end_of_DriveRelay:
;; =============== function _DriveRelay ends ============

	signat	_DriveRelay,88
	global	_serial_init
psect	text561,local,class=CODE,delta=2
global __ptext561
__ptext561:

;; *************** function _serial_init *****************
;; Defined at:
;;		line 100 in file "C:\Users\Administrator\Desktop\pic16f73\main.c"
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text561
	file	"C:\Users\Administrator\Desktop\pic16f73\main.c"
	line	100
	global	__size_of_serial_init
	__size_of_serial_init	equ	__end_of_serial_init-_serial_init
	
_serial_init:	
	opt	stack 6
; Regs used in _serial_init: [wreg]
	line	102
	
l4724:	
;main.c: 102: TXSTA=0x24;
	movlw	(024h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(152)^080h	;volatile
	line	103
;main.c: 103: RCSTA=0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(24)	;volatile
	line	104
;main.c: 104: SPBRG=0x19;
	movlw	(019h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	105
	
l4726:	
;main.c: 105: GIE=1;
	bsf	(95/8),(95)&7
	line	106
	
l4728:	
;main.c: 106: PEIE=1;
	bsf	(94/8),(94)&7
	line	107
	
l4730:	
;main.c: 107: RCIE=0;
	bcf	(1125/8)^080h,(1125)&7
	line	108
	
l1725:	
	return
	opt stack 0
GLOBAL	__end_of_serial_init
	__end_of_serial_init:
;; =============== function _serial_init ends ============

	signat	_serial_init,88
	global	_timer0_init
psect	text562,local,class=CODE,delta=2
global __ptext562
__ptext562:

;; *************** function _timer0_init *****************
;; Defined at:
;;		line 53 in file "C:\Users\Administrator\Desktop\pic16f73\main.c"
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text562
	file	"C:\Users\Administrator\Desktop\pic16f73\main.c"
	line	53
	global	__size_of_timer0_init
	__size_of_timer0_init	equ	__end_of_timer0_init-_timer0_init
	
_timer0_init:	
	opt	stack 6
; Regs used in _timer0_init: [wreg]
	line	54
	
l4706:	
;main.c: 54: T0CS=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1037/8)^080h,(1037)&7
	line	55
;main.c: 55: PSA=1;
	bsf	(1035/8)^080h,(1035)&7
	line	56
;main.c: 56: T0IF=0;
	bcf	(90/8),(90)&7
	line	57
;main.c: 57: T0IE=1;
	bsf	(93/8),(93)&7
	line	58
	
l4708:	
;main.c: 58: TMR0=0xAA;
	movlw	(0AAh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	line	62
	
l4710:	
;main.c: 62: GIE=1;
	bsf	(95/8),(95)&7
	line	63
	
l1704:	
	return
	opt stack 0
GLOBAL	__end_of_timer0_init
	__end_of_timer0_init:
;; =============== function _timer0_init ends ============

	signat	_timer0_init,88
	global	_ADC
psect	text563,local,class=CODE,delta=2
global __ptext563
__ptext563:

;; *************** function _ADC *****************
;; Defined at:
;;		line 41 in file "C:\Users\Administrator\Desktop\pic16f73\main.c"
;; Parameters:    Size  Location     Type
;;  x               2    5[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       0       0
;;      Temps:          0       1       0
;;      Totals:         0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text563
	file	"C:\Users\Administrator\Desktop\pic16f73\main.c"
	line	41
	global	__size_of_ADC
	__size_of_ADC	equ	__end_of_ADC-_ADC
	
_ADC:	
	opt	stack 6
; Regs used in _ADC: [wreg+status,2+status,0]
	line	42
	
l4696:	
;main.c: 42: ADCON1=0x02;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	43
;main.c: 43: ADCON0=0b01000001;
	movlw	(041h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	45
	
l4698:	
;main.c: 45: ADCON0|=x;
	movf	(ADC@x),w
	movwf	(??_ADC+0)+0
	movf	(??_ADC+0)+0,w
	iorwf	(31),f	;volatile
	line	46
	
l4700:	
;main.c: 46: ADON=0b1;
	bsf	(248/8),(248)&7
	line	47
;main.c: 47: while(GO);
	goto	l1698
	
l1699:	
	
l1698:	
	btfsc	(250/8),(250)&7
	goto	u3441
	goto	u3440
u3441:
	goto	l1698
u3440:
	goto	l4702
	
l1700:	
	line	48
	
l4702:	
;main.c: 48: return ADRES;
	movf	(30),w	;volatile
	goto	l1701
	
l4704:	
	line	50
	
l1701:	
	return
	opt stack 0
GLOBAL	__end_of_ADC
	__end_of_ADC:
;; =============== function _ADC ends ============

	signat	_ADC,4217
	global	_eevdriver
psect	text564,local,class=CODE,delta=2
global __ptext564
__ptext564:

;; *************** function _eevdriver *****************
;; Defined at:
;;		line 9 in file "C:\Users\Administrator\Desktop\pic16f73\eev.c"
;; Parameters:    Size  Location     Type
;;  x               2    5[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  stepx           2   10[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       2       0
;;      Temps:          0       3       0
;;      Totals:         0       7       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    2
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_eevinit
;;		_DriveEEV
;; This function uses a non-reentrant model
;;
psect	text564
	file	"C:\Users\Administrator\Desktop\pic16f73\eev.c"
	line	9
	global	__size_of_eevdriver
	__size_of_eevdriver	equ	__end_of_eevdriver-_eevdriver
	
_eevdriver:	
	opt	stack 3
; Regs used in _eevdriver: [wreg-fsr0h+status,2+status,0+btemp+1+pclath]
	
l4672:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(eevdriver@stepx)
	clrf	(eevdriver@stepx+1)
	line	10
	
l4674:	
;eev.c: 10: if(x){
	movf	(eevdriver@x+1),w
	iorwf	(eevdriver@x),w
	skipnz
	goto	u3411
	goto	u3410
u3411:
	goto	l4686
u3410:
	line	11
	
l4676:	
;eev.c: 11: stepx|=STEP[stepcount++];
	movf	(_stepcount),w
	movwf	(??_eevdriver+0)+0
	addwf	(??_eevdriver+0)+0,w
	addlw	low(_STEP|8000h)
	movwf	fsr0
	movlw	high(_STEP|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(??_eevdriver+1)+0
	fcall	stringtab
	movwf	(??_eevdriver+1)+0+1
	movf	0+(??_eevdriver+1)+0,w
	iorwf	(eevdriver@stepx),f
	movf	1+(??_eevdriver+1)+0,w
	iorwf	(eevdriver@stepx+1),f
	
l4678:	
	movlw	low(01h)
	addwf	(_stepcount),f
	skipnc
	incf	(_stepcount+1),f
	movlw	high(01h)
	addwf	(_stepcount+1),f
	line	13
	
l4680:	
;eev.c: 13: PORTC=stepx;
	movf	(eevdriver@stepx),w
	movwf	(7)	;volatile
	line	14
	
l4682:	
;eev.c: 14: if(stepcount==8)
	movlw	08h
	xorwf	(_stepcount),w
	iorwf	(_stepcount+1),w
	skipz
	goto	u3421
	goto	u3420
u3421:
	goto	l1111
u3420:
	line	15
	
l4684:	
;eev.c: 15: stepcount=0;
	clrf	(_stepcount)
	clrf	(_stepcount+1)
	goto	l1111
	
l1108:	
	line	16
;eev.c: 16: }
	goto	l1111
	line	17
	
l1107:	
	line	18
	
l4686:	
;eev.c: 17: else
;eev.c: 18: {stepx=STEP[stepcount--];
	movf	(_stepcount),w
	movwf	(??_eevdriver+0)+0
	addwf	(??_eevdriver+0)+0,w
	addlw	low(_STEP|8000h)
	movwf	fsr0
	movlw	high(_STEP|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(eevdriver@stepx)
	fcall	stringtab
	movwf	(eevdriver@stepx+1)
	
l4688:	
	movlw	low(-1)
	addwf	(_stepcount),f
	skipnc
	incf	(_stepcount+1),f
	movlw	high(-1)
	addwf	(_stepcount+1),f
	line	19
	
l4690:	
;eev.c: 19: PORTC=stepx;
	movf	(eevdriver@stepx),w
	movwf	(7)	;volatile
	line	20
	
l4692:	
;eev.c: 20: if(stepcount==-1)
	movlw	high(-1)
	xorwf	(_stepcount+1),w
	skipz
	goto	u3435
	movlw	low(-1)
	xorwf	(_stepcount),w
u3435:

	skipz
	goto	u3431
	goto	u3430
u3431:
	goto	l1111
u3430:
	line	21
	
l4694:	
;eev.c: 21: stepcount=7;
	movlw	low(07h)
	movwf	(_stepcount)
	movlw	high(07h)
	movwf	((_stepcount))+1
	goto	l1111
	
l1110:	
	goto	l1111
	line	22
	
l1109:	
	line	23
	
l1111:	
	return
	opt stack 0
GLOBAL	__end_of_eevdriver
	__end_of_eevdriver:
;; =============== function _eevdriver ends ============

	signat	_eevdriver,4216
	global	_delay2ms
psect	text565,local,class=CODE,delta=2
global __ptext565
__ptext565:

;; *************** function _delay2ms *****************
;; Defined at:
;;		line 89 in file "C:\Users\Administrator\Desktop\pic16f73\main.c"
;; Parameters:    Size  Location     Type
;;  x               2    5[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  b               2    9[BANK0 ] unsigned int 
;;  a               2    7[BANK0 ] unsigned int 
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DriveTime
;;		_eevinit
;;		_DriveEEV
;;		_HPstart
;; This function uses a non-reentrant model
;;
psect	text565
	file	"C:\Users\Administrator\Desktop\pic16f73\main.c"
	line	89
	global	__size_of_delay2ms
	__size_of_delay2ms	equ	__end_of_delay2ms-_delay2ms
	
_delay2ms:	
	opt	stack 4
; Regs used in _delay2ms: [wreg+status,2+status,0]
	line	91
	
l4652:	
;main.c: 90: unsigned int a,b;
;main.c: 91: for(a=x; a>0; a--)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(delay2ms@x+1),w
	clrf	(delay2ms@a+1)
	addwf	(delay2ms@a+1)
	movf	(delay2ms@x),w
	clrf	(delay2ms@a)
	addwf	(delay2ms@a)

	
l4654:	
	movf	((delay2ms@a+1)),w
	iorwf	((delay2ms@a)),w
	skipz
	goto	u3371
	goto	u3370
u3371:
	goto	l4658
u3370:
	goto	l1716
	
l4656:	
	goto	l1716
	line	92
	
l1712:	
	
l4658:	
;main.c: 92: for(b=152; b>0; b--);
	movlw	low(098h)
	movwf	(delay2ms@b)
	movlw	high(098h)
	movwf	((delay2ms@b))+1
	
l4660:	
	movf	((delay2ms@b+1)),w
	iorwf	((delay2ms@b)),w
	skipz
	goto	u3381
	goto	u3380
u3381:
	goto	l4664
u3380:
	goto	l4668
	
l4662:	
	goto	l4668
	
l1714:	
	
l4664:	
	movlw	low(01h)
	subwf	(delay2ms@b),f
	movlw	high(01h)
	skipc
	decf	(delay2ms@b+1),f
	subwf	(delay2ms@b+1),f
	
l4666:	
	movf	((delay2ms@b+1)),w
	iorwf	((delay2ms@b)),w
	skipz
	goto	u3391
	goto	u3390
u3391:
	goto	l4664
u3390:
	goto	l4668
	
l1715:	
	line	91
	
l4668:	
	movlw	low(01h)
	subwf	(delay2ms@a),f
	movlw	high(01h)
	skipc
	decf	(delay2ms@a+1),f
	subwf	(delay2ms@a+1),f
	
l4670:	
	movf	((delay2ms@a+1)),w
	iorwf	((delay2ms@a)),w
	skipz
	goto	u3401
	goto	u3400
u3401:
	goto	l4658
u3400:
	goto	l1716
	
l1713:	
	line	93
	
l1716:	
	return
	opt stack 0
GLOBAL	__end_of_delay2ms
	__end_of_delay2ms:
;; =============== function _delay2ms ends ============

	signat	_delay2ms,4216
	global	_UART_SendByte
psect	text566,local,class=CODE,delta=2
global __ptext566
__ptext566:

;; *************** function _UART_SendByte *****************
;; Defined at:
;;		line 95 in file "C:\Users\Administrator\Desktop\pic16f73\main.c"
;; Parameters:    Size  Location     Type
;;  dat             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  dat             1    5[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DriveTime
;; This function uses a non-reentrant model
;;
psect	text566
	file	"C:\Users\Administrator\Desktop\pic16f73\main.c"
	line	95
	global	__size_of_UART_SendByte
	__size_of_UART_SendByte	equ	__end_of_UART_SendByte-_UART_SendByte
	
_UART_SendByte:	
	opt	stack 5
; Regs used in _UART_SendByte: [wreg]
;UART_SendByte@dat stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(UART_SendByte@dat)
	line	96
	
l4650:	
;main.c: 96: TXREG=dat;
	movf	(UART_SendByte@dat),w
	movwf	(25)	;volatile
	line	97
;main.c: 97: while(TRMT==0);
	goto	l1719
	
l1720:	
	
l1719:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1217/8)^080h,(1217)&7
	goto	u3361
	goto	u3360
u3361:
	goto	l1719
u3360:
	goto	l1722
	
l1721:	
	line	98
	
l1722:	
	return
	opt stack 0
GLOBAL	__end_of_UART_SendByte
	__end_of_UART_SendByte:
;; =============== function _UART_SendByte ends ============

	signat	_UART_SendByte,4216
	global	_CountMin
psect	text567,local,class=CODE,delta=2
global __ptext567
__ptext567:

;; *************** function _CountMin *****************
;; Defined at:
;;		line 54 in file "C:\Users\Administrator\Desktop\pic16f73\DriveTime.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       1       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DriveTime
;; This function uses a non-reentrant model
;;
psect	text567
	file	"C:\Users\Administrator\Desktop\pic16f73\DriveTime.c"
	line	54
	global	__size_of_CountMin
	__size_of_CountMin	equ	__end_of_CountMin-_CountMin
	
_CountMin:	
	opt	stack 5
; Regs used in _CountMin: [wreg+status,2+status,0]
	line	62
	
l4644:	
;DriveTime.c: 62: if ((0<TM.DefogScan)&&(TM.DefogScan<40)) {TM.DefogScan++;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TM)+08h,w
	andlw	(1<<6)-1
	xorlw	0
	skipnz
	goto	u3341
	goto	u3340
u3341:
	goto	l559
u3340:
	
l4646:	
	movf	0+(_TM)+08h,w
	andlw	(1<<6)-1
	movwf	(??_CountMin+0)+0
	movlw	low(028h)
	subwf	(??_CountMin+0)+0,w
	skipnc
	goto	u3351
	goto	u3350
u3351:
	goto	l559
u3350:
	
l4648:	
	movf	0+(_TM)+08h,w
	andlw	(1<<6)-1
	movwf	((??_CountMin+0)+0)
	incf	(??_CountMin+0)+0
	movf	0+(_TM)+08h,w
	xorwf	((??_CountMin+0)+0),w
	andlw	not ((1<<6)-1)
	xorwf	((??_CountMin+0)+0),w
	movwf	0+(_TM)+08h
	goto	l559
	
l558:	
	line	63
	
l559:	
	return
	opt stack 0
GLOBAL	__end_of_CountMin
	__end_of_CountMin:
;; =============== function _CountMin ends ============

	signat	_CountMin,88
	global	_CountClk
psect	text568,local,class=CODE,delta=2
global __ptext568
__ptext568:

;; *************** function _CountClk *****************
;; Defined at:
;;		line 40 in file "C:\Users\Administrator\Desktop\pic16f73\DriveTime.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       1       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DriveTime
;; This function uses a non-reentrant model
;;
psect	text568
	file	"C:\Users\Administrator\Desktop\pic16f73\DriveTime.c"
	line	40
	global	__size_of_CountClk
	__size_of_CountClk	equ	__end_of_CountClk-_CountClk
	
_CountClk:	
	opt	stack 5
; Regs used in _CountClk: [wreg-fsr0h+status,2+status,0]
	line	44
	
l4610:	
;DriveTime.c: 44: if ((0<TM.PumpRun)&&(TM.PumpRun<30)) {TM.PumpRun++;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_TM),w
	skipz
	goto	u3220
	goto	l4616
u3220:
	
l4612:	
	movlw	(01Eh)
	subwf	(_TM),w
	skipnc
	goto	u3231
	goto	u3230
u3231:
	goto	l4616
u3230:
	
l4614:	
	movlw	(01h)
	movwf	(??_CountClk+0)+0
	movf	(??_CountClk+0)+0,w
	addwf	(_TM),f
	goto	l4616
	
l549:	
	line	45
	
l4616:	
;DriveTime.c: 45: if ((0<TM.PumpStop)&&(TM.PumpStop<360)) {TM.PumpStop++;}
	movlw	(01h)
	addlw	_TM&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	incf	fsr0,f
	iorwf	indf,w
	skipnz
	goto	u3241
	goto	u3240
u3241:
	goto	l550
u3240:
	
l4618:	
	movlw	high(0168h)
	subwf	1+(_TM)+01h,w
	movlw	low(0168h)
	skipnz
	subwf	0+(_TM)+01h,w
	skipnc
	goto	u3251
	goto	u3250
u3251:
	goto	l550
u3250:
	
l4620:	
	movlw	low(01h)
	addwf	0+(_TM)+01h,f
	skipnc
	incf	1+(_TM)+01h,f
	movlw	high(01h)
	addwf	1+(_TM)+01h,f
	
l550:	
	line	46
;DriveTime.c: 46: if ((0<TM.ComRun)&&(TM.ComRun<120)) {TM.ComRun++;}
	movf	0+(_TM)+03h,w
	skipz
	goto	u3260
	goto	l4626
u3260:
	
l4622:	
	movlw	(078h)
	subwf	0+(_TM)+03h,w
	skipnc
	goto	u3271
	goto	u3270
u3271:
	goto	l4626
u3270:
	
l4624:	
	movlw	(01h)
	movwf	(??_CountClk+0)+0
	movf	(??_CountClk+0)+0,w
	addwf	0+(_TM)+03h,f
	goto	l4626
	
l551:	
	line	47
	
l4626:	
;DriveTime.c: 47: if ((0<TM.ComStop)&&(TM.ComStop<180)) {TM.ComStop++;}
	movf	0+(_TM)+04h,w
	skipz
	goto	u3280
	goto	l4632
u3280:
	
l4628:	
	movlw	(0B4h)
	subwf	0+(_TM)+04h,w
	skipnc
	goto	u3291
	goto	u3290
u3291:
	goto	l4632
u3290:
	
l4630:	
	movlw	(01h)
	movwf	(??_CountClk+0)+0
	movf	(??_CountClk+0)+0,w
	addwf	0+(_TM)+04h,f
	goto	l4632
	
l552:	
	line	50
	
l4632:	
;DriveTime.c: 50: if ((0<TM.DefogStop)&&(TM.DefogStop<30)) {TM.DefogStop++;}
	movf	0+(_TM)+05h,w
	skipz
	goto	u3300
	goto	l4638
u3300:
	
l4634:	
	movlw	(01Eh)
	subwf	0+(_TM)+05h,w
	skipnc
	goto	u3311
	goto	u3310
u3311:
	goto	l4638
u3310:
	
l4636:	
	movlw	(01h)
	movwf	(??_CountClk+0)+0
	movf	(??_CountClk+0)+0,w
	addwf	0+(_TM)+05h,f
	goto	l4638
	
l553:	
	line	51
	
l4638:	
;DriveTime.c: 51: if ((0<TM.Defoging)&&(TM.Defoging<4800)){TM.DefogStop++;}
	movlw	(06h)
	addlw	_TM&0ffh
	movwf	fsr0
	movf	indf,w
	incf	fsr0,f
	iorwf	indf,w
	skipnz
	goto	u3321
	goto	u3320
u3321:
	goto	l555
u3320:
	
l4640:	
	movlw	high(012C0h)
	subwf	1+(_TM)+06h,w
	movlw	low(012C0h)
	skipnz
	subwf	0+(_TM)+06h,w
	skipnc
	goto	u3331
	goto	u3330
u3331:
	goto	l555
u3330:
	
l4642:	
	movlw	(01h)
	movwf	(??_CountClk+0)+0
	movf	(??_CountClk+0)+0,w
	addwf	0+(_TM)+05h,f
	goto	l555
	
l554:	
	line	52
	
l555:	
	return
	opt stack 0
GLOBAL	__end_of_CountClk
	__end_of_CountClk:
;; =============== function _CountClk ends ============

	signat	_CountClk,88
	global	_ISR
psect	text569,local,class=CODE,delta=2
global __ptext569
__ptext569:

;; *************** function _ISR *****************
;; Defined at:
;;		line 65 in file "C:\Users\Administrator\Desktop\pic16f73\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       5       0
;;      Totals:         0       5       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text569
	file	"C:\Users\Administrator\Desktop\pic16f73\main.c"
	line	65
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 3
; Regs used in _ISR: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ISR+1)
	movf	fsr0,w
	movwf	(??_ISR+2)
	movf	pclath,w
	movwf	(??_ISR+3)
	movf	btemp+1,w
	movwf	(??_ISR+4)
	ljmp	_ISR
psect	text569
	line	67
	
i1l4712:	
;main.c: 67: if(TMR0IF==1)
	btfss	(90/8),(90)&7
	goto	u345_21
	goto	u345_20
u345_21:
	goto	i1l1709
u345_20:
	line	69
	
i1l4714:	
;main.c: 68: {
;main.c: 69: TMR0=0xAA;
	movlw	(0AAh)
	movwf	(1)	;volatile
	line	70
	
i1l4716:	
;main.c: 70: T0IF=0;
	bcf	(90/8),(90)&7
	line	71
	
i1l4718:	
;main.c: 71: temp1++;
	movlw	(01h)
	movwf	(??_ISR+0)+0
	movf	(??_ISR+0)+0,w
	addwf	(_temp1),f
	line	73
	
i1l4720:	
;main.c: 73: if(temp1>164)
	movlw	(0A5h)
	subwf	(_temp1),w
	skipc
	goto	u346_21
	goto	u346_20
u346_21:
	goto	i1l1709
u346_20:
	line	75
	
i1l4722:	
;main.c: 74: {
;main.c: 75: Judge.Interrupt=1;
	bsf	(_Judge),0
	line	76
;main.c: 76: temp1=0;
	clrf	(_temp1)
	goto	i1l1709
	line	78
	
i1l1708:	
	goto	i1l1709
	line	80
	
i1l1707:	
	line	82
	
i1l1709:	
	movf	(??_ISR+4),w
	movwf	btemp+1
	movf	(??_ISR+3),w
	movwf	pclath
	movf	(??_ISR+2),w
	movwf	fsr0
	swapf	(??_ISR+1)^00h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
psect	text570,local,class=CODE,delta=2
global __ptext570
__ptext570:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
