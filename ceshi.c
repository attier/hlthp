#include "htc.h" 

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
/*
union JudgeFlag Judge; 
union RelayFlag1 RelayS; 
union TimeCount TM; 
union ErrFlag SysErr;

int T[8];             //�¶�
unsigned char temp1;
extern int t2;

static void InitAdc1HW(int);
extern void HPSystem(void);
extern void eevinit();

//int x;
const int  fkTempTab[]={ //22-252
-38,-37,-36,-34,-33,-32,-31,-30,-29,-28,-27,-26,-25,-24,-23,-22,-21,-21,-20,-19,-18,-17,-17,
-16,-15,-15,-14,-13,-13,-12,-11,-11,-10,-9,-9,-8,-8,-7,-6,-6,-5,-5,-4,-4,-3,-3,-2,-2,-1,-1,0,
0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,8,9,9,10,10,11,11,11,12,12,13,13,14,14,14,15,15,16,16,17,17,17,18,18,19,19,19,20,20,
21,21,21,22,22,23,23,23,24,24,25,25,25,26,26,27,27,27,28,28,29,29,29,30,30,31,31,31,32,32,33,33,33,34,34,
35,35,36,36,36,37,37,38,38,39,39,39,40,40,41,41,42,42,42,43,43,44,44,45,45,46,46,47,47,48,48,49,49,50,50,51,51,52,52,53,
53,54,54,55,55,56,56,57,58,58,59,59,60,61,61,62,63,63,64,65,65,66,
67,67,68,69,70,71,71,72,73,74,75,76,77,78,79,80,81,82,83,84,86,87,88,90,91,93,94,96,98,100,102,105,107,110,113,116,121,125,131,};


unsigned char ADC(int x)
{
ADCON1=0x02;
ADCON0=0b01000001;
x<<3;
ADCON0|=x;
ADON=0b1;
while(GO);
return ADRES;

}

void timer0_init(void)     //fosc/4=4M/4���Լ�������Ϊ1us
{
	T0CS=0;                //timer0�����ڶ�ʱ����ʽ
	PSA=1;                 //timer0����Ƶ
	T0IF=0;                //��timer0�жϱ�־
	T0IE=1;                //timer0�ж�����	
	TMR0=0xAA;             /*�ó�ֵ����ʱ100us����Ϊд��TMR0����ŵ��������ڲ���������
                             �ж���Ҫ3�����ڵ���Ӧʱ�䣬�Լ�C�����Զ������ֳ�����Ҫ��
                             �����ڣ�ȡ����ֵ15������ֻ��Ҫ��ʱ100-15=85us
                             ��ֵ=255-85=0xaa*/
	//GIE=1;    }             //�����ж�
//
/*
void interrupt  ISR(void)
{
// Timer0 interrupt service routine
	if(TMR0IF==1)           
  	{
		TMR0=0xAA;         //ÿ100us�ж�һ�ζ�TMR0д��һ������ֵ�� 
		T0IF=0;            //��timer0�жϱ�־
        temp1++;           //�жϴ�����1
	//	TMR0IF=0;
		if(temp1>164)     //�ж�10000�κ�Ϊ1��
		{
			Judge.Interrupt=1;
		    temp1=0;       //�жϴ�����0
            //RD0=!RD0;RD1=!RD1; RD2=!RD2; RD3=!RD3;//ȡ������RD��4λLED�����Ϩ��			
		}
		
	}

}
*/

//urat************************************************************

__CONFIG(0x3B32);
void delay2ms(uint x)
{
uint a,b;
for(a=x; a>0; a--)
for(b=152; b>0; b--);
}
void UART_SendByte(unsigned char dat)
{
TXREG=dat;
while(TRMT==0);
}
void serial_init()
{
//����RXΪ���룬TXΪ���
TXSTA=0x24;
RCSTA=0x80;

SPBRG=0x19;//����ʹ�õ���8MHz����9600=8000000/(16*(X+1))->X=51->X=0x33
GIE=1;
PEIE=1;
RCIE=0;
}


//urat************************************************************
int main( void )
{
TRISA = 0x2f;
TRISB = 0x07;
TRISC = 0x80;
PORTB=0x00;               //IO��ʼ�� 
//timer0_init();                //��ʱ��0��ʼ��

INTE=0;

serial_init();




  while(1)
  {
//urat************************************************************
   
UART_SendByte(RB0);

UART_SendByte(RB1);

UART_SendByte(RB2);
//RC4=~RC4;
delay2ms(250);
//RC4=~RC4;
delay2ms(250);
//urat************************************************************
    
     
}
}



