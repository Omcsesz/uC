#include <inttypes.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <util/delay.h>
#include "LCD.h"
#include "display.h"
#include "UART.h"

/************************************************************************/
/* enum, amelyben felsoroljuk, hoy gmilyen allapotban van eppen a meres                                                                    */
/************************************************************************/
enum MERES_STATUS {
	KESZ,
	FOLYAMATBAN,
	TULCSORDULAS	
};

/************************************************************************/
/* Valtozo, amelyben taroljuk az aktualis meres allapotat                                                                     */
/************************************************************************/
volatile enum MERES_STATUS megmerte; //a RAMból való swappolás elkerulesere
											//1, ha a mérés kész
const char helloString[]= "Kapacitasmero v1.0";

/************************************************************************/
/* ha tulcsordulas tortent, az allaoptvaltozot beallitjuk               */
/************************************************************************/
ISR(TIMER1_OVF_vect){
	TCCR1B=0; //kikapcsolja a szamlalo orajelet
	cli();
	megmerte = TULCSORDULAS;
}

/************************************************************************/
/* az analog komparator interruptja                                                                     */
/************************************************************************/
ISR(ANA_COMP_vect){
	TCCR1B=0;
	cli();
	UARTWriteString("Komparator interrupt\n\r");
	megmerte = KESZ;
}

/************************************************************************/
/* A lehetseges ellenallasertekek, amelyeken keresztul toltjuk a kondit */
/************************************************************************/
enum TOLTO_ELLENALLAS{
	R1K = 3,
	R10K = 2,
	R100K = 1,
	R1M = 0
};

//Ebben adjuk vissza a mert idot
uint16_t mert_ido;

char meres(enum TOLTO_ELLENALLAS ezzel){
	// beallitjuk, hogy milyen ellenállásokon keresztul toltodjon
	// tri-state: PIN=0-PORT=0
	PORTB = 3;
	DDRB= (1<<7);
	_delay_ms(300); //300msec alatt kisul
	DDRB= 0;
	PORTB = 0;
	//ki van sütve
	
	megmerte = FOLYAMATBAN;	
	
	//Timer init
	//TCCR: Timer Counter Control Register
	//TCNT: Timer Counter
	TCNT1 = 0; //0-ról ekzdjük a számolást
	TIMSK = (1<<TOIE1); //túlcsordulásra interruptot bekapcsoljuk
	
	sei();
	TCCR1B |=  (1<<CS12) | (1<<CS10); // (8kHz) -en elindítjuk a számlálót
	
	/************************************************************************/
	/* Kivalasztjuk, melyik ellenallason keresztul toltjuk a kondit        */
	/************************************************************************/
	switch(ezzel){
		case R1K:
			DDRB =  (1<<4);
			PORTB = (1<<4);
			break;
		case R10K:
			DDRB =  (1<<5);
			PORTB = (1<<5);
			break;
		case R100K:
			DDRB =  (1<<6);
			PORTB = (1<<6);
			break;
		case R1M:
			DDRB =  (1<<7);
			PORTB = (1<<7);
			break;
	};

	while (megmerte == FOLYAMATBAN); //varunk, amig az egyik interrupt nem valtoztatja az allapotot
	cli();
	
	if (megmerte == TULCSORDULAS){
		//nem sikerult a meres	
		return TULCSORDULAS;
	}
	
	mert_ido = TCNT1; // mert idot elmentjuk
	return KESZ;
}

int main(void){
	_delay_ms(1);
	//LCD inicializálása, bekapcsolja a kijelzőt, és egy villogó kurzort helyez a bal felső sarokba
	lcd_init(LCD_DISP_ON);
	//Udvozlo szoveg kiirasa LCD-re
	lcd_puts(helloString);
	
	initUART();
	UARTWriteString("\r\n\r\n");
	UARTWriteString(helloString);
	
	/*Az A port legyen kimenet
	//a mereshez beallitjuk az ADC egyik labat (PA0) inputnak
	//DDRA= 0b11111111;*/	
	/* ACD:   Analog Comparator Disable               (ACSR.7)
	// ACBG:  Analog Comparator Bandgap               (ACSR.6)
	// ACO:   Analog Comparator Output                (ACSR.5)
	// ACI:   Analog Comparator Interrupt Flag        (ACSR.4)
	// ACIE:  Analog Comparator Interrupt Enable      (ACSR.3)
	// ACIC:  Analog Comparator Input Capture Enable  (ACSR.2)
	// ACIS0: Analog Comparator Interrupt Mode Select (ACSR.1)
	// ACIS1: Analog Comparator Interrupt Mode Select (ACSR.0)*/
	ACSR= (1<<ACBG) | (1<<ACIE) | (1<<ACIS1); //analog komparator bekapcsolva
	
	// ACME: Analog Comparator Multiplexer Enable     (SFIOR.3)
	SFIOR&= ~(1 << ACME); //disable

	// a nyomogombra indul a meres
	PORTA = (1<<2);
	_delay_ms(100);
	
	while(1){
		while(PINA & (1<<2)); //várunk amíg meg nem nyomják a gombot
		lcd_clrscr();

		unsigned char vege = 0; // FALSE
		for(unsigned char i= R1M; (i<=R1K) && (!vege); i++){
			UARTWriteString("\n\r\n\r");
			USARTWriteChar('0' + i);
			UARTWriteString(". ellenallas\n\r");
		
			switch (meres(i)){
				case TULCSORDULAS: UARTWriteString("Tulcsordult"); break;
				case KESZ: lcd_putint(mert_ido); vege = 1; break;
			};
		}
		if (!vege)
			UARTWriteString("Tul nagy kapacitas\n\r");
	}
}
