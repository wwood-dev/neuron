#include<pic18.h>

unsigned char table0[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,
       0x88,0x83,0xc6,0xa1,0x86,0x8e,0};  
unsigned char table1[]={0x21,0x22,0x24,0x28 } ;
void delay1( unsigned int x)
{
    unsigned int  i,j;
    for(i=0;i<x;i++)
       for(j=0;j<100;j++);
}
void sigma_portint()
{
    TRISA=0X00;                //Î»
    TRISB=0X00;               //¶ÎÂë
}
void show(show_bit,show_code)
{
    PORTA=table1[show_bit];
    PORTB=table0[show_code];
  	delay1(5);
}

void main()
 {
   
    unsigned int n=0Xd6,k=0,i=0; PORTB=0XFF;
    sigma_portint();
    while(1)
      {k++;
      show(0,i);
      show(1,i);
      show(2,i);
      show(3,i);
     	
    //  PORTB=0XFF;
      if(k==20 | k==40){i++;if(i==17){i=0;}}
  // if(k==50){k=0;}
      if(k==50){k=0,n=~n; PORTA=n;}
      else   	PORTA=n;/**/
      delay1(10);
    
      }
 }
