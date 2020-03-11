#include <pic18.h>
  
typedef unsigned char	uint8;
typedef unsigned int	uint16;
typedef signed  char	sint8;
typedef signed	int		sint16;

#define DATA_DDR   TRISB
#define DATA_PORT  PORTB

#define OUT_WR      TRISE1=0   
#define WR_ON       RE1=1
#define WR_OFF      RE1=0
uint8 a;
void delay50us(sint16 t)
{
    uint8 j;		
    for(;t>0;t--)			
        for(j=0;j<70;j++)	
            ;
}

void delay50ms(sint16 t)
{
	uint16 i; 
	for(;t>0;t--)
		for(i=0;i<52642;i++)
			; 
}

void write_to_ft245()
{DATA_DDR=0;
	a++;
    DATA_PORT=a;
  /*  DATA_PORT=DATA_PORT++;*/ 
    delay50us(10);
    WR_OFF;
    delay50us(10);
    WR_ON;
    delay50us(10);
}

void main()
{ 
	 DATA_DDR=0; 
    OUT_WR;		
    while(1)
    { 
       
            write_to_ft245();delay50us(50);	        
    }  
}
