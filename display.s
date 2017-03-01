	.file	"display.c"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__CCP__  = 0x34
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	lcd_putint
	.type	lcd_putint, @function
lcd_putint:
	push r29
	push r28
	rcall .
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 3 */
	std Y+3,r25
	std Y+2,r24
	ldi r24,lo8(15)
	std Y+1,r24
.L2:
	ldd r25,Y+1
	ldd r24,Y+1
	subi r24,lo8(-(-1))
	std Y+1,r24
	mov r24,r25
	ldi r22,lo8(1)
	call lcd_gotoxy
	ldd r24,Y+2
	ldd r25,Y+3
	ldi r18,lo8(10)
	ldi r19,hi8(10)
	movw r22,r18
	call __udivmodhi4
	subi r24,lo8(-(48))
	call lcd_putc
	ldd r24,Y+2
	ldd r25,Y+3
	ldi r18,lo8(10)
	ldi r19,hi8(10)
	movw r22,r18
	call __udivmodhi4
	movw r24,r22
	std Y+3,r25
	std Y+2,r24
	ldd r24,Y+2
	ldd r25,Y+3
	sbiw r24,0
	brne .L2
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r28
	pop r29
	ret
	.size	lcd_putint, .-lcd_putint
