/*
 * UART.c
 *
 * Created: 2016.05.21. 18:59:25
 *  Author: Omcsesz
 */ 

#include "UART.h"
#include <avr/io.h>

/************************************************************************/
/* UART inicializalasa                                                  */
/************************************************************************/
void initUART(){
	 // UBBR beállítása 51-re, 8mhz-en 9600 BAUD
	 UBRRH = 0;                      
	 UBRRL = 51;                     
	 UCSRB|= (1<<TXEN)|(1<<RXEN);                // enable receiver and transmitter
	 UCSRC|= (1<<URSEL)|(1<<UCSZ0)|(1<<UCSZ1);   // 8bit data format
}

/************************************************************************/
/* Send a char to PC                                                    */
/************************************************************************/
void USARTWriteChar(char data){
	
	//Wait until the transmitter is ready
	//UCSRA: USART control, and status register
	//
	while ((UCSRA & (1<<UDRE)) == 0)
	{
		//Do nothing
	}
	
	//Write the data to USART buffer
	UDR= data;		
}

/************************************************************************/
/* Receives a character from PC                                         */
/************************************************************************/
char USARTReadChar(){
	//UCSRA:
	//RXC: receive complete
	while (!(UCSRA & (1<<RXC)));
	
	//UDR: USART Data Register
	//Az USART megkapta az adatot, es benne van a bufferben
	return UDR;
}

/************************************************************************/
/* Stringet írunk ki az UART-on                                         */
/************************************************************************/
void UARTWriteString(const char * str){
	while(*str){
		USARTWriteChar(*str);
		str++;
	}
}

/************************************************************************/
/*                                                                      */
/************************************************************************/
void UARTputInt(uint16_t input){	
	do{
		USARTWriteChar('0' + (input%10));
		input/= 10;
	}while (input != 0);
	USARTWriteChar("\n\r");
}