#include "DriveTime.h"
#include "DriveRelay.h"
#include "Common.h"
uchar InterTimes = 61;
uchar Clock   = 60;
uchar Minutes = 20;
extern union JudgeFlag Judge;
extern void UART_SendByte(unsigned char dat);
extern void delay2ms(uint x);
extern void DriveEEV(void);
/*******************
union TimeCount{
      struct {
      // CountClk 
      uchar EVWRun:8;//150
      uchar EVHRun:8;//150
      uchar EVCRun:8;//150
      uchar PumpRun:5;//30
      uint  PumpStop:9;//360
      uchar ComRun:7;//120
      uchar ComStop:8;//180
      uchar WtOff:4;//10
      uchar HpOff:4;//10
      uchar DefogStop:4;//30
      uint  Defoging:16;//4800
      // CountMin          
      uchar HWRun:6;//40
      uchar HRun:6;//40
      uchar CRun:6;//40
      uchar E7:5;//30
      uchar E6:5;//30
      uchar E5:5;//30
      uchar DefogScan:6;//40
      uchar HTScan:4;//15
             };uchar All;
            };
extern union TimeCount TM;
*******************/
void CountClk(void)
{
   //  if (0<TM.EVHRun<150)   {TM.EVHRun++;}
    // if (0<TM.EVCRun<150)   {TM.EVCRun++;}
    // if (0<TM.EVWRun<150)   {TM.EVWRun++;}
     if ((0<TM.PumpRun)&&(TM.PumpRun<30))   {TM.PumpRun++;}
     if ((0<TM.PumpStop)&&(TM.PumpStop<360)) {TM.PumpStop++;}
     if ((0<TM.ComRun)&&(TM.ComRun<120))  {TM.ComRun++;}
     if ((0<TM.ComStop)&&(TM.ComStop<180))  {TM.ComStop++;}
   //  if (0<TM.WtOff<10)     {TM.WtOff++;}
   //  if (0<TM.HpOff<10)     {TM.HpOff++;}
     if ((0<TM.DefogStop)&&(TM.DefogStop<30)) {TM.DefogStop++;}
     if ((0<TM.Defoging)&&(TM.Defoging<4800)){TM.DefogStop++;}
}
void CountMin(void)
{
   //  if (0<TM.HWRun<40) {TM.HWRun++;}
   //  if (0<TM.HRun<40)  {TM.HWRun++;}
   //  if (0<TM.CRun<40)  {TM.HWRun++;}
   //  if (0<TM.E7<30)    {TM.E7++;}
   //  if (0<TM.E6<30)    {TM.E6++;}
   //  if (0<TM.E5<30)    {TM.E5++;}
   //  if (0<TM.HTScan<15){TM.HTScan++;}
     if ((0<TM.DefogScan)&&(TM.DefogScan<40)) {TM.DefogScan++;}
}
void DriveTime(void)
{
     if (Judge.Interrupt)
     {
        Judge.Interrupt=0;
        InterTimes--;
 
        if(InterTimes==31)
		{
	    //GPIO_WriteReverse(GPIOA, GPIO_PIN_3);
 RC4=~RC4;
UART_SendByte(RB7);
UART_SendByte(RB4);
UART_SendByte(RB5);
UART_SendByte(RB0);
UART_SendByte(RB1);
UART_SendByte(RB2);
UART_SendByte(PORTB);
UART_SendByte(EEVSTEP);
UART_SendByte(EEVSTEP>>8);
UART_SendByte(0xff);

//delay2ms(100);
        }
        else if(SysErr.P6&&(InterTimes==59))RC4=~RC4;//GPIO_WriteHigh(GPIOA, GPIO_PIN_3);
        //if(SysErr.P6)
//			{
          //if(InterTimes==15)
				//{
	     //GPIO_WriteReverse(o_LED1);
      			//  }   //i=0;
//       			 }
				        	if (!InterTimes)
				       		{				//UART_SendByte(0x22);
                        UART_SendByte(0x6d);
                        UART_SendByte(0x6d);
				 for(int i=0;i<=4;i++)
				{
				//UART_SendByte(i);
				UART_SendByte(T[i]);
				//UART_SendByte(0x22);
				//UART_SendByte(0x00);
				}
				//UART_SendByte(0x123);
				UART_SendByte(Judge.Working);
				UART_SendByte(SysErr.P6);
				
				
				           InterTimes=61;
				           Clock--;
				           //GPIO_WriteReverse(GPIOA, GPIO_PIN_5);
				           CountClk();//所有秒计时的变量非0时开始计时
				         //   if(SysErr.P6)
				  //  GPIO_WriteReverse(GPIOA, GPIO_PIN_4);
				           
				           if (!Clock)
				           {if(RelayS.Com)DriveEEV();
				              Clock = 60;Minutes--;
				              CountMin();//所有分计时的变量非0时开始计时
				             //  CountClk();//所有秒计时的变量非0时开始计时
				              if (!Minutes)
				              {
				                  Minutes = 60;   
				                //   CountMin();//所有分计时的变量非0时开始计时
					     		 
											}
					    	}
						}
     }
}
