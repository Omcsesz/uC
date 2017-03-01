	.file	"main.c"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__CCP__  = 0x34
__tmp_reg__ = 0
__zero_reg__ = 1
	.data
.LC0:
	.string	"Kapacitasmero v1.0"
	.text
.global	main
	.type	main, @function
main:
	push r29
	push r28
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,28
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 28 */
	ldi r24,lo8(0x3f800000)
	ldi r25,hi8(0x3f800000)
	ldi r26,hlo8(0x3f800000)
	ldi r27,hhi8(0x3f800000)
	std Y+25,r24
	std Y+26,r25
	std Y+27,r26
	std Y+28,r27
	ldd r22,Y+25
	ldd r23,Y+26
	ldd r24,Y+27
	ldd r25,Y+28
	ldi r18,lo8(0x437a0000)
	ldi r19,hi8(0x437a0000)
	ldi r20,hlo8(0x437a0000)
	ldi r21,hhi8(0x437a0000)
	call __mulsf3
	movw r26,r24
	movw r24,r22
	std Y+21,r24
	std Y+22,r25
	std Y+23,r26
	std Y+24,r27
	ldd r22,Y+21
	ldd r23,Y+22
	ldd r24,Y+23
	ldd r25,Y+24
	ldi r18,lo8(0x3f800000)
	ldi r19,hi8(0x3f800000)
	ldi r20,hlo8(0x3f800000)
	ldi r21,hhi8(0x3f800000)
	call __ltsf2
	tst r24
	brge .L27
.L23:
	ldi r24,lo8(1)
	ldi r25,hi8(1)
	std Y+20,r25
	std Y+19,r24
	rjmp .L4
.L27:
	ldd r22,Y+21
	ldd r23,Y+22
	ldd r24,Y+23
	ldd r25,Y+24
	ldi r18,lo8(0x477fff00)
	ldi r19,hi8(0x477fff00)
	ldi r20,hlo8(0x477fff00)
	ldi r21,hhi8(0x477fff00)
	call __gtsf2
	cp __zero_reg__,r24
	brge .L28
.L24:
	ldd r22,Y+25
	ldd r23,Y+26
	ldd r24,Y+27
	ldd r25,Y+28
	ldi r18,lo8(0x41200000)
	ldi r19,hi8(0x41200000)
	ldi r20,hlo8(0x41200000)
	ldi r21,hhi8(0x41200000)
	call __mulsf3
	movw r26,r24
	movw r24,r22
	movw r22,r24
	movw r24,r26
	call __fixunssfsi
	movw r26,r24
	movw r24,r22
	std Y+20,r25
	std Y+19,r24
	rjmp .L7
.L8:
	ldi r24,lo8(25)
	ldi r25,hi8(25)
	std Y+18,r25
	std Y+17,r24
	ldd r24,Y+17
	ldd r25,Y+18
/* #APP */
 ;  105 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay_basic.h" 1
	1: sbiw r24,1
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	std Y+18,r25
	std Y+17,r24
	ldd r24,Y+19
	ldd r25,Y+20
	sbiw r24,1
	std Y+20,r25
	std Y+19,r24
.L7:
	ldd r24,Y+19
	ldd r25,Y+20
	sbiw r24,0
	brne .L8
	rjmp .L9
.L28:
	ldd r22,Y+21
	ldd r23,Y+22
	ldd r24,Y+23
	ldd r25,Y+24
	call __fixunssfsi
	movw r26,r24
	movw r24,r22
	std Y+20,r25
	std Y+19,r24
.L4:
	ldd r24,Y+19
	ldd r25,Y+20
	std Y+16,r25
	std Y+15,r24
	ldd r24,Y+15
	ldd r25,Y+16
/* #APP */
 ;  105 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay_basic.h" 1
	1: sbiw r24,1
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	std Y+16,r25
	std Y+15,r24
.L9:
	ldi r24,lo8(12)
	call lcd_init
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	call lcd_puts
	ldi r30,lo8(40)
	ldi r31,hi8(40)
	ldi r24,lo8(43)
	st Z,r24
	ldi r26,lo8(80)
	ldi r27,hi8(80)
	ldi r30,lo8(80)
	ldi r31,hi8(80)
	ld r24,Z
	andi r24,lo8(-9)
	st X,r24
	ldi r30,lo8(59)
	ldi r31,hi8(59)
	ldi r24,lo8(4)
	st Z,r24
.L10:
	ldi r30,lo8(57)
	ldi r31,hi8(57)
	ld r24,Z
	mov r24,r24
	ldi r25,lo8(0)
	andi r24,lo8(4)
	andi r25,hi8(4)
	sbiw r24,0
	brne .L10
	call lcd_clrscr
	ldi r30,lo8(56)
	ldi r31,hi8(56)
	ldi r24,lo8(3)
	st Z,r24
	ldi r30,lo8(55)
	ldi r31,hi8(55)
	ldi r24,lo8(-128)
	st Z,r24
	ldi r24,lo8(0x43960000)
	ldi r25,hi8(0x43960000)
	ldi r26,hlo8(0x43960000)
	ldi r27,hhi8(0x43960000)
	std Y+11,r24
	std Y+12,r25
	std Y+13,r26
	std Y+14,r27
	ldd r22,Y+11
	ldd r23,Y+12
	ldd r24,Y+13
	ldd r25,Y+14
	ldi r18,lo8(0x437a0000)
	ldi r19,hi8(0x437a0000)
	ldi r20,hlo8(0x437a0000)
	ldi r21,hhi8(0x437a0000)
	call __mulsf3
	movw r26,r24
	movw r24,r22
	std Y+7,r24
	std Y+8,r25
	std Y+9,r26
	std Y+10,r27
	ldd r22,Y+7
	ldd r23,Y+8
	ldd r24,Y+9
	ldd r25,Y+10
	ldi r18,lo8(0x3f800000)
	ldi r19,hi8(0x3f800000)
	ldi r20,hlo8(0x3f800000)
	ldi r21,hhi8(0x3f800000)
	call __ltsf2
	tst r24
	brge .L29
.L25:
	ldi r24,lo8(1)
	ldi r25,hi8(1)
	std Y+6,r25
	std Y+5,r24
	rjmp .L13
.L29:
	ldd r22,Y+7
	ldd r23,Y+8
	ldd r24,Y+9
	ldd r25,Y+10
	ldi r18,lo8(0x477fff00)
	ldi r19,hi8(0x477fff00)
	ldi r20,hlo8(0x477fff00)
	ldi r21,hhi8(0x477fff00)
	call __gtsf2
	cp __zero_reg__,r24
	brge .L30
.L26:
	ldd r22,Y+11
	ldd r23,Y+12
	ldd r24,Y+13
	ldd r25,Y+14
	ldi r18,lo8(0x41200000)
	ldi r19,hi8(0x41200000)
	ldi r20,hlo8(0x41200000)
	ldi r21,hhi8(0x41200000)
	call __mulsf3
	movw r26,r24
	movw r24,r22
	movw r22,r24
	movw r24,r26
	call __fixunssfsi
	movw r26,r24
	movw r24,r22
	std Y+6,r25
	std Y+5,r24
	rjmp .L16
.L17:
	ldi r24,lo8(25)
	ldi r25,hi8(25)
	std Y+4,r25
	std Y+3,r24
	ldd r24,Y+3
	ldd r25,Y+4
/* #APP */
 ;  105 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay_basic.h" 1
	1: sbiw r24,1
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	std Y+4,r25
	std Y+3,r24
	ldd r24,Y+5
	ldd r25,Y+6
	sbiw r24,1
	std Y+6,r25
	std Y+5,r24
.L16:
	ldd r24,Y+5
	ldd r25,Y+6
	sbiw r24,0
	brne .L17
	rjmp .L18
.L30:
	ldd r22,Y+7
	ldd r23,Y+8
	ldd r24,Y+9
	ldd r25,Y+10
	call __fixunssfsi
	movw r26,r24
	movw r24,r22
	std Y+6,r25
	std Y+5,r24
.L13:
	ldd r24,Y+5
	ldd r25,Y+6
	std Y+2,r25
	std Y+1,r24
	ldd r24,Y+1
	ldd r25,Y+2
/* #APP */
 ;  105 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay_basic.h" 1
	1: sbiw r24,1
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	std Y+2,r25
	std Y+1,r24
.L18:
	ldi r30,lo8(55)
	ldi r31,hi8(55)
	st Z,__zero_reg__
	ldi r22,lo8(0)
	ldi r30,lo8(55)
	ldi r31,hi8(55)
	ldi r24,lo8(32)
	st Z,r24
	ldi r30,lo8(56)
	ldi r31,hi8(56)
	ldi r24,lo8(32)
	st Z,r24
	rjmp .L19
.L20:
	mov r24,r22
	subi r24,lo8(-(1))
	mov r22,r24
/* #APP */
 ;  64 "main.c" 1
	nop
 ;  0 "" 2
 ;  65 "main.c" 1
	nop
 ;  0 "" 2
 ;  66 "main.c" 1
	nop
 ;  0 "" 2
/* #NOAPP */
.L19:
	ldi r30,lo8(40)
	ldi r31,hi8(40)
	ld r24,Z
	mov r24,r24
	ldi r25,lo8(0)
	andi r24,lo8(32)
	andi r25,hi8(32)
	sbiw r24,0
	brne .L20
	mov r24,r22
	mov r24,r24
	ldi r25,lo8(0)
	call lcd_putint
	ldi r24,lo8(0)
	ldi r22,lo8(0)
	call lcd_gotoxy
.L21:
	rjmp .L21
	.size	main, .-main
.global __do_copy_data
