#include "include.h" 
#include <xc.h>

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.

// CONFIG
#pragma config FOSC = XT        // Oscillator Selection bits (XT oscillator)
#pragma config WDTE = OFF       // Watchdog Timer Enable bit (WDT disabled)
#pragma config PWRTE = OFF      // Power-up Timer Enable bit (PWRT disabled)
#pragma config CP = OFF         // FLASH Program Memory Code Protection bit (Code protection off)
#pragma config BOREN = OFF      // Brown-out Reset Enable bit (BOR disabled)
//#define o_COMP RB7;       
//#define o_PUMP RB4;        
//#define o_4WAY RB6;     
//#define o_HFAN RB5; 
//#define o_LED1 RC4;
//IO_TypeDef o_LED2={GPIOA,GPIO_PIN_4};
//IO_TypeDef o_LED3={GPIOA,GPIO_PIN_3};
//#define i_HiP RB2; 
//#define i_LoP RB1; 
//#define i_S RB0; 
#define uchar unsigned char
#define uint unsigned int

union JudgeFlag Judge; 
union RelayFlag1 RelayS; 
union TimeCount TM; 
union ErrFlag SysErr;
int adcc=0;
int T[8];             //???è
unsigned char temp1;
extern int t2;
void delay2ms(uint);
void TEMPADC(void);
static void InitAdc1HW(int);
extern void HPSystem(void);
extern void eevinit();
extern uchar Clock; 
//int x;
static const short fkTempTab[]={ //0-255
-40,-40,-40,-40,-40,-40,-40,-40,-40,-40,-39,-38,-37,-35,-34,-32,-31,-30,-29,-28,-27,
-26,-25,-24,-23,-22,-21,-20,-20,-19,-18,-17,-17,-16,-15,-15,-14,-13,-13,-12,-12,
-11,-11,-10,-9,-9,-8,-8,-7,-7,-6,-6,-5,-5,-4,-4,-3,-3,-2,-1,-1,0,0,1,1,2,2,2,3,3,
4,4,4,5,5,6,6,7,7,8,8,8,9,9,10,10,10,11,11,12,12,12,13,13,14,14,14,15,15,16,16,16,
17,17,18,18,18,19,19,20,20,20,21,21,21,22,22,22,23,23,24,24,25,25,25,26,26,26,27,
27,28,28,29,29,30,30,30,31,31,32,32,32,33,33,34,34,34,35,35,36,36,37,37,38,38,39,
39,40,40,41,41,41,42,42,42,43,44,44,44,45,46,46,46,47,48,49,49,50,50,51,51,52,52,
53,53,54,55,55,56,56,57,58,59,59,60,61,61,62,63,63,64,65,66,66,67,68,69,70,71,72,
73,74,74,75,76,77,79,80,81,82,83,84,86,87,88,90,91,92,94,96,97,99,101,103,105,106,
109,110,113,115,118,120,123,126,131,134,140,144,147,148,149,150,150,150,150,150,};
static const short  tkTempTab[]={ //0-248
-41,-41,-40,-32,-26,-22,-18,-15,-13,-10,-8,-6,-5,-3,-1,0,2,3,4,5,6,8,9,10,11,12,13,
13,14,15,16,17,17,18,19,20,20,21,22,23,23,24,25,25,26,26,27,28,28,29,29,30,31,31,32,
32,33,33,34,34,35,35,36,36,37,37,38,38,39,39,40,40,41,41,42,42,43,43,44,44,45,45,46,
46,46,47,47,48,48,49,49,50,50,50,51,51,52,52,53,53,54,54,54,55,55,56,56,57,57,57,58,
58,59,59,60,60,61,61,61,62,62,63,63,64,64,64,65,65,66,66,67,67,68,68,68,69,69,70,70,
71,71,72,72,73,73,74,74,75,75,75,76,76,77,77,78,78,79,79,80,80,81,81,82,82,83,84,84,
85,85,86,86,87,87,88,88,89,90,90,91,91,92,93,93,94,94,95,96,96,97,98,98,99,100,101,
101,102,103,103,104,105,106,107,107,108,109,110,111,112,113,114,114,115,116,117,118,
120,121,122,123,124,125,126,128,129,130,132,133,135,136,138,139,141,143,145,147,149,
149,149,149,149,149,149,149,149,149,149,149,149,149,};
void UART_SendByte(unsigned char dat)
{
TXREG=dat;
while(TRMT==0);
}
unsigned char ADC(uint x)
{
ADCON1=0x02;
ADCON0=0b01000000;
ADCON0bits.CHS=x;
//UART_SendByte(ADCON0);
ADON=0b1;
delay2ms(3);

GO=1;

while(GO);
return ADRES;

}
//计时器要重新设计
void timer0_init(void)     //fosc/4=4M/4?ùò???êy?ü?ú?a1us
{
	T0CS=0;                //timer01¤×÷óú?¨ê±?÷·?ê?
	PSA=1;                 //timer02?·??μ
	T0IF=0;                //??timer0?D??±ê??
	T0IE=1;                //timer0?D???êDí	
	TMR0=0x0e;             /*??3??μ￡??¨ê±100us?￡òò?aD′è?TMR0oó?ó×?μ?á????ü?ú2??ü??á?￡?
                             ?D??Dèòa3???ü?úμ??ìó|ê±??￡?ò??°Có???×??ˉ??DD??3?±￡?¤òa??
                             o??ü?ú￡?è?DT?y?μ15￡??ùò???Dèòa?¨ê±100-15=85us
                             3??μ=255-85=0xaa*/
	GIE=1;                 //?a×ü?D??
}
void interrupt  ISR(void)
{
// Timer0 interrupt service routine
	if(TMR0IF==1)           
  	{
		TMR0=0x0e;         //??100us?D??ò?′???TMR0D′è?ò???μ÷???μ?￡ 
		//T0IF=0;
        if(temp1>68)     //?D??10000′?oó￡??a1??  69*241=16393.44us=16.393ms=1/61s
		{
			Judge.Interrupt=1;
		    temp1=0;       //?D??′?êy??0
            //RD0=!RD0;RD1=!RD1; RD2=!RD2; RD3=!RD3;//è?·′????RDμí4??LED·￠1a?ò?¨?e			
		}            //??timer0?D??±ê??
        temp1++;           //?D??′?êy?ó1
        TMR0IF=0;
		
	}

}


//urat************************************************************

//__CONFIG(0x3B32);
void delay2ms(uint x)
{
uint a,b;
for(a=x; a>0; a--)
for(b=152; b>0; b--);
}

void serial_init()
{
//éè??RX?aê?è?￡?TX?aê?3?
TXSTA=0x24;
RCSTA=0x80;
SPBRG=0x19;//±?è?ê1ó?μ?ê?8MHz?§??￡?9600=8000000/(16*(X+1))->X=51->X=0x33
GIE=1;
PEIE=1;
RCIE=0;
}


//urat************************************************************
int main( void )
{
PORTB=0x00;
                //IO3?ê??ˉ 
timer0_init();                //?¨ê±?÷03?ê??ˉ
serial_init();
//INTE=0;
nRBPU =1;
TRISA = 0x2f;
TRISB = 0x07;
TRISC = 0x80;
RC4=1;
INTE=0;
RBIE=0;

eevinit();



  while(1)
  {
      
//urat************************************************************
   
//UART_SendByte(0x11);

//delay2ms(500);

//urat************************************************************
    
     if((RB2)||(RB1))
        {
         if(TM.ComRun>=120)  		
             SysErr.P6=1;
        }
    else 
        {
         SysErr.P6=0;
     		
        }
    //UART_SendByte(0x22);
	DriveTime();
  	HPSystem();
  	DriveRelay();
    // UART_SendByte(0x33);
    TEMPADC();
            //load volt temp
    ++adcc;
     if(adcc==5)
       adcc=0;
    ADON=0;  
    } 
  
return 0;
}


void TEMPADC(void)	{            
    unsigned char uwAdcSample = 0;
    uwAdcSample=ADC(adcc);
    // UART_SendByte(adcc);
    // UART_SendByte(uwAdcSample);
    //unsigned char temmmp;
    //temmmp=uwAdcSample;
    // UART_SendByte(0xcc);
    // UART_SendByte(Clock);
    // uwAdcSample=((1-((255-temmmp)/temmmp/10))*255);
    // int intttt=(int)uwAdcSample;
    // UART_SendByte(0x44);
    // UART_SendByte(intttt);
    // T[adcc]=fkTempTab[intttt];
   // if(adcc==1){
    //  unsigned char tem1;
    // tem1=uwAdcSample;
    //  double temmp1;
    // temmp1=(43*256)-(13*tem1);
    // temmp1=(30*tem1)/temmp1;
    //temmp1=temmp1/0xa;
    // temmp1=temmp1*256;
  //  T[adcc]=fkTempTab[(int)(uwAdcSample)];
   // }
   // else
        if(adcc==4)
    {
       // unsigned char temmmp;
       // temmmp=uwAdcSample;
       // double temmp2;
        //temmp2=(0xb*temmmp)-255;
        //temmp2=temmp2/temmmp;
        //temmp2=temmp2/0xa;
       // temmp2=temmp2*0xff;
       // UART_SendByte(0x99);
       // UART_SendByte(temmp2);
        T[adcc]=tkTempTab[(int)(uwAdcSample)];
    }
    else
    {
        T[adcc]=fkTempTab[(int)(uwAdcSample)];
    }     
           
}