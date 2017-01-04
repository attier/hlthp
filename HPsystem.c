#include "HPsystem.h"
#include <stdlib.h>
//#include "HPProtect.h"
//#include "HPNeed.h"
//#include "HPInUnit.h"
//#include "HPOuUnit.h"
extern void UART_SendByte(unsigned char );
extern void delay2ms(uint x);
extern uchar Clock;
int t1;
int t2;
int ff;
int ee;
void HPstart(void)
{
  if(RB0==0)
          //&&(T[3]<=50))
  {
  //RC4=1;
      //RelayS.Pump=1;
     // TM.PumpRun=1;
      ff=0;
    if(SysErr.P6)
		{
		if(ee==0)
        { 
            {t2=Clock;ee++;}
                }
        ee++;
		if((abs(Clock-t2)>10)&&(ee>30))
            {Judge.Working=NoWork;
        UART_SendByte(0xee); UART_SendByte(0xe6);
             }
		}
    else if(T[3]<=55)
        {//RC4=0;
        Judge.Working=WorkH;ee=0;}
  }
    else if(RB0==1)  {
                     delay2ms(1);
                     
					if(ff==0)
                        {t1=Clock;ff++;
                        //UART_SendByte(0xee);UART_SendByte(0xFF);UART_SendByte(t1);
                    }
                        		ff++;			
                    if((abs(Clock-t1)>10)&&(ff>30))
                        {Judge.Working=NoWork;
                         UART_SendByte(0xee); UART_SendByte(0x1);UART_SendByte(Clock);
                        }
					}
    if(T[3]>60||T[4]>115)
        { Judge.Working=NoWork;
  UART_SendByte(0xee); UART_SendByte(0x2);
        }
  }
  
  




void HPOuUnit(void)
{
if (Judge.Working==NoWork)
     {HPShut();}
     else if (Judge.Working)
     {
          //????????
          if (Judge.Defog)
          {UART_SendByte(0xee); UART_SendByte(0xDF);
             //?????ив??
             if (Judge.DefogStop)
             {
                 if (TM.DefogStop>=30)
                 {
                     Judge.DefogStop=0;Judge.Defog=0;TM.DefogScan=10;
                     TM.DefogStop=0;RelayS.Com=1;
                 }
                 else if (TM.DefogStop>=25)
                 {RelayS.Fway=0;} 
                 else {RelayS.Com=0;RelayS.Fan=1;}
             }
             //?????????ив??
             else if (TM.Defoging>1200)
             {Judge.DefogStop=1;TM.DefogStop=1;}
             else if ((TM.Defoging>120)&&(T[UP]>20))
             {Judge.DefogStop=1;TM.DefogStop=1;}
             //????????
             else if (TM.Defoging>60)
             {//RelayS.Fway=1;
              RelayS.Com=1;}
             else if (TM.Defoging>30)
             {RelayS.Fway=1;}
             else {RelayS.Com=0;RelayS.Fan=0;}
         }
         //??????????????
          else if((TM.ComStop>=120)||(!TM.ComStop))
         {
             RelayS.Fway=0;
             if (TM.DefogScan>=40)
             {
                 if ((T[UP]<-1)&&(T[E]<5))
                 {Judge.Defog=1;TM.Defoging=1;}
             }
             else if (TM.PumpRun>=30)
             {
                RelayS.Com=1;
                if(!TM.ComRun)
                TM.ComRun=1;
                TM.ComStop=0;
					if(!TM.DefogScan)
                TM.DefogScan=1;
             }
             else if (TM.PumpRun>=25)
             {RelayS.Fan=1;}
             else 
             {
                  RelayS.Pump=1;
                  TM.PumpStop=0;
                  if (!TM.PumpRun)
                  {TM.PumpRun=1;}
             }
         }
    }
}
void HPShut(void)
{
     if (TM.PumpStop>=360)
     {
       //????б└???
       if (T[E]>1)
        {TM.PumpStop=1;}
        else
        {
           RelayS.Pump=1;
           if (!TM.PumpRun)
           {TM.PumpRun=1;}
           else if (TM.PumpRun>=60)
           {TM.PumpRun=0;TM.PumpStop=1;}
        }
     }
     if(TM.ComRun>=120)
     {
       // RelayEx.HTS=0;RelayEx.HTH=0;
       // RelayEx.HTW=0;
       RelayS.Com=0;TM.ComRun=0;
       if(TM.DefogScan)
                TM.DefogScan=0;
        if (!TM.ComStop)
        {TM.ComStop=1;}
        //else if (TM.ComStop>=20)
     }
        
     
        else if (TM.ComStop>=35||(TM.ComRun==0&&TM.ComStop==0)) // delay 35S;
       {  RelayS.Pump=0;TM.PumpRun=0;
             if (!TM.PumpStop)
             {TM.PumpStop=1;}
             if (TM.ComStop>=40||(TM.ComRun==0&&TM.ComStop==0))
     
          {
          RelayS.Fan=0;
          }
       }
     }


void HPSystem(void)
{
    // HPProtect();
    // HPNeed()??
    // HPInUnit();
     HPstart();
     HPOuUnit();
     
}