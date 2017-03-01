#include <inttypes.h>
#include <avr/io.h> 
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <util/delay.h>
#include "LCD.h"
#include "display.h"

register unsigned char	eltelt_ido asm ("r22");

int main(void)
{
	
	_delay_ms(1);
	
	//LCD inicializ�l�sa, bekapcsolja a kijelz�t, �s egy villog� kurzort helyez a bal fels� sarokba
	lcd_init(LCD_DISP_ON);
	//lcd_gotoxy(1,0);
	//Udvozlo szoveg
	lcd_puts("Kapacitasmero v1.0");
	
	//Az A port legyen kimenet
	//a mereshez beallitjuk az ADC egyik labat (PA0) inputnak
	//DDRA= 0b11111111;
	
	// ACD:   Analog Comparator Disable               (ACSR.7)
	// ACBG:  Analog Comparator Bandgap               (ACSR.6)
	// ACO:   Analog Comparator Output                (ACSR.5)
	// ACI:   Analog Comparator Interrupt Flag        (ACSR.4) 
	// ACIE:  Analog Comparator Interrupt Enable      (ACSR.3)
	// ACIC:  Analog Comparator Input Capture Enable  (ACSR.2)
	// ACIS0: Analog Comparator Interrupt Mode Select (ACSR.1)
	// ACIS1: Analog Comparator Interrupt Mode Select (ACSR.0)
	ACSR= (1<<ACO)|(1<<ACIS0)|(1<<ACIS1)|(1<<ACIE); //analog komparator bekapcsolva
	
	// ACME: Analog Comparator Multiplexer Enable     (SFIOR.3)
	SFIOR&= ~(1 << ACME); //disable

	PORTA = (1<<2);
	while(PINA & (1<<2));
	lcd_clrscr();
	
	// beallitjuk, hogy milyen ellen�ll�sokon keresztul toltodjon
	// tri-state: PIN=0-PORT=0
	PORTB = 3;
	DDRB= (1<<7);//ooooii--
	//am�g ki nem s�l
	_delay_ms(300); ///TODO
	DDRB= 0;
	
	//ki van s�tve
	
	eltelt_ido = 0;
	
	DDRB=  (1<<5);
	PORTB= (1<<5); //100k-n kereszt�l t�ltj�k
	while(ACSR&(1<<5)){ //ink�bb ind�tani egy timert, �s az anal�g kompar�tor interrupja le�ll�tja a timert
		// a ciklus addig megy, am�g a timer j�r
		eltelt_ido++;
		asm("nop");
		asm("nop");
		asm("nop");
	}
	lcd_putint(eltelt_ido);
	lcd_gotoxy(0,0);	
	
//	while(1){
	//}
}
