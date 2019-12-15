#include<pic.h>   //加载头文件；
#define uint8 unsigned char
void init();
void delay_10us(unsigned long n);
void motion_Forward();
void motion_Stop();
void motion_LeftTurn(unsigned int angle);
void motion_RightTurn(unsigned int angle);

unsigned long i;
unsigned int t;		// 记录声波时间ms
unsigned int s;		// 记录距离cm
unsigned int status;

void main()                   //主函数；
{
	init();
	while(1){
		
		RC1 = 1;
		delay_10us(1);
		RC1 = 0;

		delay_10us(19);

		// 捕获
		
		while (!CCP1IF);
		CCP1IF = 0;
		CCP1CON = 0b00000100;


		t = 0;
		
		while(!CCP1IF) {
			delay_10us(2);
			t += 1;	

		}
		

		
		CCP1CON = 0b00000101;
		CCP1IF = 0;
		s = (int)(0.34*t);
		if (s > 20) {
			motion_Forward();
			RD1 = 0;
			status = 0;
		}
		else {
			motion_Stop();
			RD1 = 1;
			delay_10us(200000);
			if(status == 0) {
				motion_LeftTurn(90);
				status = 1;
			}
			else if(status == 1) {
				motion_RightTurn(180);
				status = 2;
			}
			else if(status == 2) {
				motion_RightTurn(100);
				status = 3;
			} 
			else {
				motion_Stop();
			}
			delay_10us(200000);
		}

		delay_10us(1000);
		
	
	}
   
}


void init() {
	// 延时
	OPTION_REG = 0x00;
	T0IF = 0;

	// 输入捕获
	TRISC2=1; 
	CCP1CON = 0b00000101;
	CCPR1L = 0;
	CCPR1H = 0;
	CCP1IF = 0;

	// 触发信号
	TRISC1 = 0;
	RC1 = 0;

	// 接收信号
	TRISC2 = 1;

	// 电机
	TRISC4 = 0;
	TRISC5 = 0;
	TRISC6 = 0;
	TRISC7 = 0;
	RC4 = 0;
	RC5 = 0;
	RC6 = 0;
	RC7 = 0;

	// DEBUG
	TRISD1 = 0;
	RD1 = 0;
	status = 0;
}

void motion_Forward() {
	RC4 = 0;
	RC5 = 1;
	RC6 = 1;
	RC7 = 0;
}

void motion_Stop() {
	RC4 = 0;
	RC5 = 0;
	RC6 = 0;
	RC7 = 0;
}

void motion_LeftTurn(unsigned int angle) {
	RC4 = 1;
	RC5 = 1;
	RC6 = 1;
	RC7 = 0;
	delay_10us(10000*angle);
	RC4 = 0;
	RC5 = 0;
	RC6 = 0;
	RC7 = 0;
}

void motion_RightTurn(unsigned int angle) {
	RC4 = 0;
	RC5 = 1;
	RC6 = 1;
	RC7 = 1;
	delay_10us(10000*angle);
	RC4 = 0;
	RC5 = 0;
	RC6 = 0;
	RC7 = 0;
}


void delay_10us (unsigned long n) {
	for (i=0; i<n; i++) {
		TMR0 = 254;
		while(!T0IF);
		T0IF = 0;
	}
}