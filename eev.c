#include "eev.h"
#include "include.h"
#include "stdio.h"
#include "math.h"
#include <stdlib.h>
extern void UART_SendByte(unsigned char dat);
extern void delay2ms(uint);

volatile union{
    struct{
        unsigned LBIT :4;
        unsigned HBIT :4;
};
}PORTCBIT @ 0x007;

void eevdriver(int x)
{unsigned int stepx=0;
if(x){
stepx|=STEP[stepcount++];

PORTCBIT.LBIT=stepx;
if(stepcount==8)
	stepcount=0;
}
else 
{stepx|=STEP[stepcount--];
PORTCBIT.LBIT=stepx; 
if(stepcount==-1)
	stepcount=7;
}
}


void eevinit()
{int i=1;
//UART_SendByte(0x01);

PORTCBIT.LBIT=STEP[0];
//UART_SendByte(PORTC);

  delay2ms(200);
  while(i<(500-EEVSTEP))
{eevdriver(1);
  i++;
    delay2ms(8);
    //UART_SendByte(PORTC);
}
  
  
  PORTCBIT.LBIT=STEP[stepcount];
  delay2ms(200);
  i=0;
while(i<560)
{eevdriver(0);
  i++;
    delay2ms(8);
   // UART_SendByte(PORTC);
}
  
  
  
PORTCBIT.LBIT=STEP[stepcount];
  delay2ms(200);
  i=0;
  RC4=0;
while(i<EEVSTEP)
{eevdriver(1);
  i++;
    delay2ms(8);
   // UART_SendByte(PORTC);
}
PORTCBIT.LBIT=STEP[stepcount];
  delay2ms(240);
PORTCBIT.LBIT=0x0;

//UART_SendByte(0x02);

}
/*
void delay16ms(int time)
{
  int x=InterTimes;
  if(x<time){
    while(InterTimes==1);
    while((61-InterTimes)<=(time-x));
  }
  else while(((x-InterTimes)<=time)||((InterTimes-x)<=time)); 
    
  
}
*/
void DriveEEV()
{
if((EEVSTEP>160)&&(EEVSTEP<420))
{ int x=T[2]-T[0]-5;
  if(x>0)
  for(;!x;x--)
  { eevdriver(1);
  delay2ms(8);}
  else if(T[4]<95)
     for(;!x;x++)
    { eevdriver(0);
  delay2ms(8);}
PORTCBIT.LBIT= STEP[stepcount];

delay2ms(240);
PORTCBIT.LBIT=0x0;
EEVSTEP+=x;
}
}