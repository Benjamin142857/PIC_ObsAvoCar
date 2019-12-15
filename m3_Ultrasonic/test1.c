#include<pic.h>   //加载头文件；
//__CONFIG(FOSC_XT&WDTE_ON&WDTE_OFF&LVP_ON&LVP_OFF); //设置配置字；
#define uint8 unsigned char
void Delay10us(unsigned int delay);   //声明延时函数；

int n=0;		// 返回脉冲记录
unsigned char i=0;
void main()                   //主函数；
{
	ADCON1=(ADCON1&0xf0)|0x07;  //设置ADCON1低四位为0111，
	                             //将A口或E口作为普通I/O口使用；
	TRISA1 = 0
	RA = 1;

	// 触发信号
	TRISC1=0;
	RC1 = 0;

	// 输入捕获
	TRISC2=1; 
	CCP1CON = 0b00000101;
	CCPR1L = 0;
	CCPR1H = 0;

	
	
	// 中断
	GIE=1;
	PEIE=1;
	CCP1E=0;
	CCP1F=0;
	
	// DEBUG
	TRISD = 0x00;
	PORTD = 0x00;


	while(1){
		RC1 = 1;
		Delay10us(1);
		RC1 = 0;
     
		for (i=0; i<20; i++) {
			if (CCP1F) {
				if (n==8) {
					n = 0;
					get_dist();
					break;
				}
				else {
					n += 1;
				}
				CCP1F = 0;
			}
			Delay10us(1);
		}
		
	      //定义无符号变量i，i=0；
	    for(i=0; i<8; i++) {
	        PORTD=(0x01<<i);   //将PORTD的第i位设置为高电平
	        Delay(3000);       //设置延时参数为3000
	     }
	} 
}

void interrupt PIC_Int(void) {
uint8 i;                     //定义变量i
	if (INTF){
		

	}
}

void Delay10us (unsigned int delay)     //定义延时函数Delay
{
 unsigned int i;                //定义无符号整型变量i
  for (;delay>0; delay--)       // for循环语句，delay>0时自减1，否则跳出循环
    for (i=0; i<5; i++);         // for循环语句，i<10时自加1，否则跳出循环

}

