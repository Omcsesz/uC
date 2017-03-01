/*
 * UART.h
 *
 * Created: 2016.05.21. 18:59:37
 *  Author: Omcsesz
 */ 


#ifndef UART_H_
#define UART_H_

#include <avr/io.h>

void initUART();
char USARTReadChar();
void USARTWriteChar(char data);
void UARTWriteString(const char *str);
void UARTputInt(uint16_t input);

#endif /* UART_H_ */