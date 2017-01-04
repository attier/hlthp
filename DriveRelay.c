#include "include.h"

#define o_COMP RB7;       
#define o_PUMP RB4;        
#define o_4WAY RB6;     
#define o_HFAN RB5; 
#define o_LED1 RC4;
//IO_TypeDef o_LED2={GPIOA,GPIO_PIN_4};
//IO_TypeDef o_LED3={GPIOA,GPIO_PIN_3};
#define i_HiP RB2; 

#define i_LoP RB1; 


#define i_S RB0; 



void DriveRelay(void)
{
     if(RelayS.Com){if(RB7==0)RB7=1;}
     else            {RB7=0;}
     if(RelayS.Pump){RB4=1;}
     else            {RB4=0;}
     if(RelayS.Fan){if(RB5==0)RB5=1;}
     else            {RB5=0;}
     if(RelayS.Fway){if(RB6==0)RB6=1;}
     else            {RB6=0;}
    
}

  
  
  
