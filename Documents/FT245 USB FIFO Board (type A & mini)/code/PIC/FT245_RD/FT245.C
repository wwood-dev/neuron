#include <pic18.h>
  
typedef unsigned char	uint8;
typedef unsigned int	uint16;
typedef signed  char	sint8;
typedef signed	int		sint16;

#define DATA_DDR   TRISB
#define DATA_PORT  

#define OUT_RD      TRISE2=0       //PD4
#define RD_ON       RE2=1
#define RD_OFF      RE2=0

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

void read_from_ft245()
{
    RD_OFF;
    delay50us(10);
    RD_ON;
    delay50us(10);
}

void main()
{  ADCON1=0Xff;
	DATA_DDR=0XFF;
    OUT_RD;		
    while(1)
    {            
    read_from_ft245();
    }  
}
