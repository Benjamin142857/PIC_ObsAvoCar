#include<pic.h>   //加载头文件；
#define uint8 unsigned char
void init();
void delay_10us(unsigned int n);
void delay_1ms(unsigned int n);
void motion_Forward();
void motion_Backward(unsigned int tt);
void motion_Stop();
void motion_LeftTurn(unsigned int angle);
void motion_RightTurn(unsigned int angle);

unsigned int i;
unsigned int t;		// 记录声波时间ms
unsigned int s;		// 记录距离cm
unsigned int status;
unsigned int road_pass;		// 路通过标志数
unsigned int err;
unsigned int last_t;

void main()                   //主函数；
{
	init();
	while(1){
		CCP1IF = 0;
		RC1 = 1;
		delay_10us(1);
		RC1 = 0;


		// 捕获
		while (!CCP1IF);
		CCP1IF = 0;
		CCP1CON = 0b00000100;


		t = 0;
		
		while(!CCP1IF && t<1400) {
			delay_10us(2);
			t += 1;	

		}
		

		
		CCP1CON = 0b00000101;
		CCP1IF = 0;
		s = (int)(0.34*t);
		if (s>15) {

			motion_Forward();
			RD1 = 0;
		}
		else {
			road_pass = 0;
			motion_Stop();
			RD1 = 1;
			delay_1ms(400);
			if (s<5) {
				motion_Backward(400);
			}
			else if(status == 0) {
				motion_LeftTurn(70);
				status = 1;
			}
			else if(status == 1) {
				motion_RightTurn(140);
				status = 2;
			}
			else if(status == 2) {
				motion_RightTurn(70);
				status = 3;
			} 
			else {
				motion_RightTurn(20);
			}

			
			delay_1ms(400);
		}

		delay_1ms(10);;
		
	
	}
   
}


void init() {
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
	// RC4 = 0;
	RC5 = 1;
	RC6 = 1;
	// RC7 = 0;
	delay_1ms(200);
	RC6 = 0;
	delay_1ms(64);
	RC6 = 1;
}

void motion_Backward(unsigned int tt) {
	RC4 = 1;
	// RC5 = 0;
	// RC6 = 0;
	RC7 = 1;
	delay_1ms(tt);
	RC4 = 0;
	// RC5 = 0;
	// RC6 = 0;
	RC7 = 0;
}

void motion_Stop() {
	// RC4 = 0;
	RC5 = 0;
	RC6 = 0;
	// RC7 = 0;
}

void motion_LeftTurn(unsigned int angle) {
	RC4 = 1;
	RC5 = 0;
	RC6 = 1;
	// RC7 = 0;
	delay_1ms(4*angle);
	RC4 = 0;
	RC5 = 0;
	RC6 = 0;
	// RC7 = 0;
}

void motion_RightTurn(unsigned int angle) {
	// RC4 = 0;
	RC5 = 1;
	RC6 = 0;
	RC7 = 1;
	delay_1ms(4*angle);
	// RC4 = 0;
	RC5 = 0;
	RC6 = 0;
	RC7 = 0;
}


void delay_10us (unsigned int n) {
	OPTION_REG = 0x00;
	T0IF = 0;

	for (i=0; i<n; i++) {
		TMR0 = 242;
		while(!T0IF);
		T0IF = 0;
	}
}

void delay_1ms (unsigned int n) {
	OPTION_REG = 0x03;
	T0IF = 0;

	for (i=0; i<n; i++) {
		TMR0 = 82;
		while(!T0IF);
		T0IF = 0;
	}
}