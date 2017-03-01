/*
 * display.c
 *
 * Created: 2016. 05. 16. 20:11:59
 *  Author: semuser
 */ 
#include "display.h"
#include "LCD.h"

/************************************************************************/
/*                                                                      */
/************************************************************************/
void lcd_putint(uint16_t input){
	char c= 15; //eppen melyik karakterpozicional vagyunk		
	
	do{
		lcd_gotoxy(c--, 1);
		lcd_putc('0' + (input%10));
		input/= 10;
	}while (input != 0);
}