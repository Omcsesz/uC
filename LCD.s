	.file	"LCD.c"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__CCP__  = 0x34
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.type	toggle_e, @function
toggle_e:
	push r29
	push r28
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 0 */
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	ori r24,lo8(64)
	st X,r24
/* #APP */
 ;  111 "LCD.c" 1
	rjmp 1f
 1:
 ;  0 "" 2
/* #NOAPP */
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	andi r24,lo8(-65)
	st X,r24
/* epilogue start */
	pop r28
	pop r29
	ret
	.size	toggle_e, .-toggle_e
	.type	lcd_write, @function
lcd_write:
	push r29
	push r28
	rcall .
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 3 */
	std Y+2,r24
	std Y+3,r22
	ldd r24,Y+3
	tst r24
	breq .L4
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	ori r24,lo8(-128)
	st X,r24
	rjmp .L5
.L4:
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	andi r24,lo8(127)
	st X,r24
.L5:
	ldi r26,lo8(49)
	ldi r27,hi8(49)
	ldi r30,lo8(49)
	ldi r31,hi8(49)
	ld r24,Z
	ori r24,lo8(32)
	st X,r24
	ldi r26,lo8(49)
	ldi r27,hi8(49)
	ldi r30,lo8(49)
	ldi r31,hi8(49)
	ld r24,Z
	ori r24,lo8(16)
	st X,r24
	ldi r26,lo8(49)
	ldi r27,hi8(49)
	ldi r30,lo8(49)
	ldi r31,hi8(49)
	ld r24,Z
	ori r24,lo8(8)
	st X,r24
	ldi r26,lo8(49)
	ldi r27,hi8(49)
	ldi r30,lo8(49)
	ldi r31,hi8(49)
	ld r24,Z
	ori r24,lo8(4)
	st X,r24
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	andi r24,lo8(-5)
	st X,r24
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	andi r24,lo8(-9)
	st X,r24
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	andi r24,lo8(-17)
	st X,r24
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	andi r24,lo8(-33)
	st X,r24
	ldd r24,Y+2
	tst r24
	brge .L6
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	ori r24,lo8(4)
	st X,r24
.L6:
	ldd r24,Y+2
	mov r24,r24
	ldi r25,lo8(0)
	andi r24,lo8(64)
	andi r25,hi8(64)
	sbiw r24,0
	breq .L7
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	ori r24,lo8(8)
	st X,r24
.L7:
	ldd r24,Y+2
	mov r24,r24
	ldi r25,lo8(0)
	andi r24,lo8(32)
	andi r25,hi8(32)
	sbiw r24,0
	breq .L8
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	ori r24,lo8(16)
	st X,r24
.L8:
	ldd r24,Y+2
	mov r24,r24
	ldi r25,lo8(0)
	andi r24,lo8(16)
	andi r25,hi8(16)
	sbiw r24,0
	breq .L9
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	ori r24,lo8(32)
	st X,r24
.L9:
	call toggle_e
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	andi r24,lo8(-5)
	st X,r24
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	andi r24,lo8(-9)
	st X,r24
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	andi r24,lo8(-17)
	st X,r24
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	andi r24,lo8(-33)
	st X,r24
	ldd r24,Y+2
	mov r24,r24
	ldi r25,lo8(0)
	andi r24,lo8(8)
	andi r25,hi8(8)
	sbiw r24,0
	breq .L10
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	ori r24,lo8(4)
	st X,r24
.L10:
	ldd r24,Y+2
	mov r24,r24
	ldi r25,lo8(0)
	andi r24,lo8(4)
	andi r25,hi8(4)
	sbiw r24,0
	breq .L11
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	ori r24,lo8(8)
	st X,r24
.L11:
	ldd r24,Y+2
	mov r24,r24
	ldi r25,lo8(0)
	andi r24,lo8(2)
	andi r25,hi8(2)
	sbiw r24,0
	breq .L12
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	ori r24,lo8(16)
	st X,r24
.L12:
	ldd r24,Y+2
	mov r24,r24
	ldi r25,lo8(0)
	andi r24,lo8(1)
	andi r25,hi8(1)
	tst r24
	breq .L13
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	ori r24,lo8(32)
	st X,r24
.L13:
	call toggle_e
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	ori r24,lo8(32)
	st X,r24
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	ori r24,lo8(16)
	st X,r24
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	ori r24,lo8(8)
	st X,r24
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	ori r24,lo8(4)
	st X,r24
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r28
	pop r29
	ret
	.size	lcd_write, .-lcd_write
	.type	lcd_read, @function
lcd_read:
	push r29
	push r28
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
	std Y+2,r24
	ldd r24,Y+2
	tst r24
	breq .L16
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	ori r24,lo8(-128)
	st X,r24
	rjmp .L17
.L16:
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	andi r24,lo8(127)
	st X,r24
.L17:
	ldi r26,lo8(49)
	ldi r27,hi8(49)
	ldi r30,lo8(49)
	ldi r31,hi8(49)
	ld r24,Z
	andi r24,lo8(-33)
	st X,r24
	ldi r26,lo8(49)
	ldi r27,hi8(49)
	ldi r30,lo8(49)
	ldi r31,hi8(49)
	ld r24,Z
	andi r24,lo8(-17)
	st X,r24
	ldi r26,lo8(49)
	ldi r27,hi8(49)
	ldi r30,lo8(49)
	ldi r31,hi8(49)
	ld r24,Z
	andi r24,lo8(-9)
	st X,r24
	ldi r26,lo8(49)
	ldi r27,hi8(49)
	ldi r30,lo8(49)
	ldi r31,hi8(49)
	ld r24,Z
	andi r24,lo8(-5)
	st X,r24
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	ori r24,lo8(64)
	st X,r24
/* #APP */
 ;  244 "LCD.c" 1
	rjmp 1f
 1:
 ;  0 "" 2
/* #NOAPP */
	std Y+1,__zero_reg__
	ldi r30,lo8(48)
	ldi r31,hi8(48)
	ld r24,Z
	mov r24,r24
	ldi r25,lo8(0)
	andi r24,lo8(32)
	andi r25,hi8(32)
	sbiw r24,0
	breq .L18
	ldd r24,Y+1
	ori r24,lo8(16)
	std Y+1,r24
.L18:
	ldi r30,lo8(48)
	ldi r31,hi8(48)
	ld r24,Z
	mov r24,r24
	ldi r25,lo8(0)
	andi r24,lo8(16)
	andi r25,hi8(16)
	sbiw r24,0
	breq .L19
	ldd r24,Y+1
	ori r24,lo8(32)
	std Y+1,r24
.L19:
	ldi r30,lo8(48)
	ldi r31,hi8(48)
	ld r24,Z
	mov r24,r24
	ldi r25,lo8(0)
	andi r24,lo8(8)
	andi r25,hi8(8)
	sbiw r24,0
	breq .L20
	ldd r24,Y+1
	ori r24,lo8(64)
	std Y+1,r24
.L20:
	ldi r30,lo8(48)
	ldi r31,hi8(48)
	ld r24,Z
	mov r24,r24
	ldi r25,lo8(0)
	andi r24,lo8(4)
	andi r25,hi8(4)
	sbiw r24,0
	breq .L21
	ldd r24,Y+1
	ori r24,lo8(-128)
	std Y+1,r24
.L21:
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	andi r24,lo8(-65)
	st X,r24
/* #APP */
 ;  252 "LCD.c" 1
	rjmp 1f
 1:
 ;  0 "" 2
/* #NOAPP */
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	ori r24,lo8(64)
	st X,r24
/* #APP */
 ;  256 "LCD.c" 1
	rjmp 1f
 1:
 ;  0 "" 2
/* #NOAPP */
	ldi r30,lo8(48)
	ldi r31,hi8(48)
	ld r24,Z
	mov r24,r24
	ldi r25,lo8(0)
	andi r24,lo8(32)
	andi r25,hi8(32)
	sbiw r24,0
	breq .L22
	ldd r24,Y+1
	ori r24,lo8(1)
	std Y+1,r24
.L22:
	ldi r30,lo8(48)
	ldi r31,hi8(48)
	ld r24,Z
	mov r24,r24
	ldi r25,lo8(0)
	andi r24,lo8(16)
	andi r25,hi8(16)
	sbiw r24,0
	breq .L23
	ldd r24,Y+1
	ori r24,lo8(2)
	std Y+1,r24
.L23:
	ldi r30,lo8(48)
	ldi r31,hi8(48)
	ld r24,Z
	mov r24,r24
	ldi r25,lo8(0)
	andi r24,lo8(8)
	andi r25,hi8(8)
	sbiw r24,0
	breq .L24
	ldd r24,Y+1
	ori r24,lo8(4)
	std Y+1,r24
.L24:
	ldi r30,lo8(48)
	ldi r31,hi8(48)
	ld r24,Z
	mov r24,r24
	ldi r25,lo8(0)
	andi r24,lo8(4)
	andi r25,hi8(4)
	sbiw r24,0
	breq .L25
	ldd r24,Y+1
	ori r24,lo8(8)
	std Y+1,r24
.L25:
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	andi r24,lo8(-65)
	st X,r24
	ldd r24,Y+1
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop r28
	pop r29
	ret
	.size	lcd_read, .-lcd_read
.global	lcd_waitbusy
	.type	lcd_waitbusy, @function
lcd_waitbusy:
	push r29
	push r28
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,14
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 14 */
	ldi r24,lo8(0x41200000)
	ldi r25,hi8(0x41200000)
	ldi r26,hlo8(0x41200000)
	ldi r27,hhi8(0x41200000)
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
	brge .L39
.L37:
	ldi r24,lo8(1)
	ldi r25,hi8(1)
	std Y+6,r25
	std Y+5,r24
	rjmp .L30
.L39:
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
	brge .L40
.L38:
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
	rjmp .L33
.L34:
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
.L33:
	ldd r24,Y+5
	ldd r25,Y+6
	sbiw r24,0
	brne .L34
	rjmp .L35
.L40:
	ldd r22,Y+7
	ldd r23,Y+8
	ldd r24,Y+9
	ldd r25,Y+10
	call __fixunssfsi
	movw r26,r24
	movw r24,r22
	std Y+6,r25
	std Y+5,r24
.L30:
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
.L35:
	ldi r24,lo8(0)
/* epilogue start */
	adiw r28,14
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r28
	pop r29
	ret
	.size	lcd_waitbusy, .-lcd_waitbusy
.global	lcd_command
	.type	lcd_command, @function
lcd_command:
	push r29
	push r28
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
	std Y+1,r24
	call lcd_waitbusy
	ldd r24,Y+1
	ldi r22,lo8(0)
	call lcd_write
/* epilogue start */
	pop __tmp_reg__
	pop r28
	pop r29
	ret
	.size	lcd_command, .-lcd_command
.global	lcd_gotoxy
	.type	lcd_gotoxy, @function
lcd_gotoxy:
	push r29
	push r28
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
	std Y+1,r24
	std Y+2,r22
	ldd r24,Y+2
	tst r24
	brne .L44
	ldd r24,Y+1
	subi r24,lo8(-(-128))
	call lcd_command
	rjmp .L46
.L44:
	ldd r24,Y+1
	subi r24,lo8(-(-64))
	call lcd_command
.L46:
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop r28
	pop r29
	ret
	.size	lcd_gotoxy, .-lcd_gotoxy
.global	lcd_getxy
	.type	lcd_getxy, @function
lcd_getxy:
	push r29
	push r28
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 0 */
	call lcd_waitbusy
	mov r24,r24
	ldi r25,lo8(0)
/* epilogue start */
	pop r28
	pop r29
	ret
	.size	lcd_getxy, .-lcd_getxy
.global	lcd_clrscr
	.type	lcd_clrscr, @function
lcd_clrscr:
	push r29
	push r28
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 0 */
	ldi r24,lo8(1)
	call lcd_command
/* epilogue start */
	pop r28
	pop r29
	ret
	.size	lcd_clrscr, .-lcd_clrscr
.global	lcd_home
	.type	lcd_home, @function
lcd_home:
	push r29
	push r28
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 0 */
	ldi r24,lo8(2)
	call lcd_command
/* epilogue start */
	pop r28
	pop r29
	ret
	.size	lcd_home, .-lcd_home
.global	lcd_scrollup
	.type	lcd_scrollup, @function
lcd_scrollup:
	push r29
	push r28
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 0 */
/* epilogue start */
	pop r28
	pop r29
	ret
	.size	lcd_scrollup, .-lcd_scrollup
.global	lcd_putc
	.type	lcd_putc, @function
lcd_putc:
	push r29
	push r28
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
	std Y+2,r24
	call lcd_waitbusy
	std Y+1,r24
	ldd r24,Y+2
	cpi r24,lo8(10)
	brne .L56
	ldd r24,Y+1
	call lcd_newline
	rjmp .L60
.L56:
	ldd r24,Y+2
	ldi r22,lo8(1)
	call lcd_write
	call lcd_waitbusy
	std Y+1,r24
	ldd r24,Y+1
	cpi r24,lo8(16)
	brne .L58
	ldi r24,lo8(-64)
	ldi r22,lo8(0)
	call lcd_write
	rjmp .L59
.L58:
	ldd r24,Y+1
	cpi r24,lo8(80)
	brne .L59
	ldi r24,lo8(-128)
	ldi r22,lo8(0)
	call lcd_write
.L59:
	call lcd_waitbusy
.L60:
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop r28
	pop r29
	ret
	.size	lcd_putc, .-lcd_putc
	.type	lcd_newline, @function
lcd_newline:
	push r29
	push r28
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
	std Y+1,r24
	ldd r24,Y+1
	cpi r24,lo8(64)
	brsh .L62
	ldi r24,lo8(64)
	std Y+2,r24
	rjmp .L63
.L62:
	std Y+2,__zero_reg__
.L63:
	ldd r24,Y+2
	subi r24,lo8(-(-128))
	call lcd_command
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop r28
	pop r29
	ret
	.size	lcd_newline, .-lcd_newline
.global	lcd_puts
	.type	lcd_puts, @function
lcd_puts:
	push r29
	push r28
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 4 */
	std Y+2,r25
	std Y+1,r24
	rjmp .L66
.L68:
	ldd r24,Y+3
	call lcd_putc
.L66:
	ldd r30,Y+1
	ldd r31,Y+2
	ld r24,Z
	std Y+3,r24
	ldd r24,Y+3
	std Y+4,r24
	ldd r24,Y+4
	tst r24
	breq .L67
	ldi r24,lo8(1)
	std Y+4,r24
.L67:
	ldd r24,Y+4
	ldd r18,Y+1
	ldd r19,Y+2
	subi r18,lo8(-(1))
	sbci r19,hi8(-(1))
	std Y+2,r19
	std Y+1,r18
	tst r24
	brne .L68
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r28
	pop r29
	ret
	.size	lcd_puts, .-lcd_puts
.global	lcd_puts_p
	.type	lcd_puts_p, @function
lcd_puts_p:
	push r29
	push r28
	rcall .
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
	std Y+5,r25
	std Y+4,r24
	rjmp .L71
.L72:
	ldd r24,Y+6
	call lcd_putc
.L71:
	ldd r24,Y+4
	ldd r25,Y+5
	std Y+3,r25
	std Y+2,r24
	ldd r24,Y+4
	ldd r25,Y+5
	adiw r24,1
	std Y+5,r25
	std Y+4,r24
	ldd r30,Y+2
	ldd r31,Y+3
/* #APP */
 ;  536 "LCD.c" 1
	lpm r24, Z
	
 ;  0 "" 2
/* #NOAPP */
	std Y+1,r24
	ldd r24,Y+1
	std Y+6,r24
	ldd r24,Y+6
	tst r24
	brne .L72
/* epilogue start */
	adiw r28,6
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r28
	pop r29
	ret
	.size	lcd_puts_p, .-lcd_puts_p
.global	lcd_init
	.type	lcd_init, @function
lcd_init:
	push r29
	push r28
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
	std Y+1,r24
	ldi r26,lo8(49)
	ldi r27,hi8(49)
	ldi r30,lo8(49)
	ldi r31,hi8(49)
	ld r24,Z
	ori r24,lo8(-128)
	st X,r24
	ldi r26,lo8(49)
	ldi r27,hi8(49)
	ldi r30,lo8(49)
	ldi r31,hi8(49)
	ld r24,Z
	ori r24,lo8(64)
	st X,r24
	ldi r26,lo8(49)
	ldi r27,hi8(49)
	ldi r30,lo8(49)
	ldi r31,hi8(49)
	ld r24,Z
	ori r24,lo8(32)
	st X,r24
	ldi r26,lo8(49)
	ldi r27,hi8(49)
	ldi r30,lo8(49)
	ldi r31,hi8(49)
	ld r24,Z
	ori r24,lo8(16)
	st X,r24
	ldi r26,lo8(49)
	ldi r27,hi8(49)
	ldi r30,lo8(49)
	ldi r31,hi8(49)
	ld r24,Z
	ori r24,lo8(8)
	st X,r24
	ldi r26,lo8(49)
	ldi r27,hi8(49)
	ldi r30,lo8(49)
	ldi r31,hi8(49)
	ld r24,Z
	ori r24,lo8(4)
	st X,r24
	ldi r24,lo8(32000)
	ldi r25,hi8(32000)
	call _delayFourCycles
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	ori r24,lo8(16)
	st X,r24
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	ori r24,lo8(32)
	st X,r24
	call toggle_e
	ldi r24,lo8(9984)
	ldi r25,hi8(9984)
	call _delayFourCycles
	call toggle_e
	ldi r24,lo8(128)
	ldi r25,hi8(128)
	call _delayFourCycles
	call toggle_e
	ldi r24,lo8(128)
	ldi r25,hi8(128)
	call _delayFourCycles
	ldi r26,lo8(50)
	ldi r27,hi8(50)
	ldi r30,lo8(50)
	ldi r31,hi8(50)
	ld r24,Z
	andi r24,lo8(-33)
	st X,r24
	call toggle_e
	ldi r24,lo8(128)
	ldi r25,hi8(128)
	call _delayFourCycles
	ldi r24,lo8(40)
	call lcd_command
	ldi r24,lo8(8)
	call lcd_command
	call lcd_clrscr
	ldi r24,lo8(6)
	call lcd_command
	ldd r24,Y+1
	call lcd_command
/* epilogue start */
	pop __tmp_reg__
	pop r28
	pop r29
	ret
	.size	lcd_init, .-lcd_init
	.type	_delayFourCycles, @function
_delayFourCycles:
	push r29
	push r28
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
	std Y+2,r25
	std Y+1,r24
	ldd r24,Y+1
	ldd r25,Y+2
	sbiw r24,0
	brne .L77
/* #APP */
 ;  88 "LCD.c" 1
	rjmp 1f
 1:
 ;  0 "" 2
/* #NOAPP */
	rjmp .L79
.L77:
	ldd r24,Y+1
	ldd r25,Y+2
/* #APP */
 ;  90 "LCD.c" 1
	1: sbiw r24,1
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	std Y+2,r25
	std Y+1,r24
.L79:
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop r28
	pop r29
	ret
	.size	_delayFourCycles, .-_delayFourCycles
