/*
*========================================================================================================
*
* File                : LED.c
* Hardware Environment:	
* Build Environment   : AVR Studio 4.16 + Winavr 
* Version             : V1.0
* By                  : Wu Ze
*
*                                       http://www.waveShare.net
*                                          All Rights Reserved
*
*========================================================================================================
*/




#include <avr/io.h>
#include <util/delay.h>
unsigned char dat[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71,0x76,0xff};
//uchar date[10]={}
int main(void)
{
   unsigned char i;
	DDRA=0xFF;	
	DDRC=0xFF;
//	PORTA=0x55;
	//PORTC=0x00;
	while(1)
	{

		PORTA= 0x0f;
		PORTC=~dat[17];
	    _delay_ms(1000);
		PORTA= 0x1f;
		PORTC=~dat[17];
		_delay_ms(1000);
		for(i=0;i<18;i++)
		{
			PORTA= 0x1f;
			PORTC=~dat[i];
			_delay_ms(500);
			PORTC=0xff;
		}

	}
}


