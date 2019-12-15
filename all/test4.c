#include<pic.h> 

// #define STOP_DISTANCE 13;		// 当路障距离 <= 该值时触发非同路状态

void init();
void delay_10us(unsigned int n);
void delay_1ms(unsigned int n);
void motion_Forward();
void motion_Stop();
void motion_LeftTurn(unsigned int angle);
void motion_RightTurn(unsigned int angle);
int get_Ultrasonic();

unsigned int i;				// 用作循环的临时索引
unsigned int j;				// 用作循环的临时索引
unsigned int t;				// 记录声波时间ms
unsigned int s;				// 记录距离cm
unsigned int flag;			// 非通路状态转数标志
unsigned int road_pass;		// 路通过标志数 (=10为通路状态)



void main() {
	init();
	while(1){

		// 1. 超声波工作，获取路障距离 s (cm)， 0 <= s <= 500 (实际距离大于等于5m时， s = 500) 
		t = get_Ultrasonic();
		s = (int)(0.34*t);
		
		// 2. 电机工作, 直行或调整
		// 2.1 直行
		if (s > 5) {
			RD1 = 0;

			// 2.1.1 通路状态下的直行
			if (road_pass >= 1) {
				motion_Forward();
				flag = 1;
			}
			// 2.1.2 非通路状态下的短暂伪直行
			else {
				motion_Forward();
				road_pass++;
			} 

		}
		// 2.2 调整
		else {
			RD1 = 1;
			road_pass = 0;

			// 2.2.1 无解，死路
			if(flag > 250) {
				motion_Stop();
			}

			// 2.2.2 左转 flag 个 10度
			else if(flag%2==1) {
				for(j=0; j<flag; j++) {
					delay_1ms(20);
					motion_LeftTurn(2*flag);
				}
			}

			// 2.2.3 右转 flag 个 10度
			else {
				for(j=0; j<flag; j++) {
					delay_1ms(20);
					motion_RightTurn(2*flag);
				}
			}

			flag++;

		}
		delay_1ms(10);
		
	
	}
   
}


void init() {
	// 超声波 CCP
	TRISC1 = 0;					// RC1 输出 - 触发信号
	TRISC2 = 1; 				// RC2 输入 - 输入捕获
	CCP1CON = 0b00000101;		// 先设为捕获一个上升沿
	RC1 = 0;					// 初始化RC1输出
	CCP1IF = 0;					// 初始化捕获标志位 (只扫描不中断)
	CCPR1L = 0;					// 初始化寄存器 (其实没用)
	CCPR1H = 0;					// 初始化寄存器 (其实没用)
	

	// 电机运动部分
	TRISC4 = 0;	
	TRISC5 = 0;
	TRISC6 = 0;
	TRISC7 = 0;
	RC4 = 0;
	RC5 = 0;
	RC6 = 0;
	RC7 = 0;
	flag = 1;					// 非通路下转数标志初始1
	road_pass = 10;				// 初始化10通路状态

	// DEBUG
	TRISD1 = 0;
	RD1 = 0;
}


int get_Ultrasonic() {
	/*
		获取超声波发送声波到接收声波的时间
		return t : 返回的t的数值是这段时间内有多少个20us  
	*/
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
	return t;
}


void motion_Forward() {
	RC4 = 0;
	RC5 = 1;
	RC6 = 1;
	RC7 = 0;
	delay_1ms(200);
	RC6 = 0;
	delay_1ms(64);
	RC6 = 1;
	
}


void motion_Stop() {
	RC4 = 0;
	RC5 = 0;
	RC6 = 0;
	RC7 = 0;
}


void motion_LeftTurn(unsigned int angle) {
	RC4 = 1;
	RC5 = 0;
	RC6 = 1;
	RC7 = 0;
	delay_1ms(4*angle);
}


void motion_RightTurn(unsigned int angle) {
	RC4 = 0;
	RC5 = 1;
	RC6 = 0;
	RC7 = 1;
	delay_1ms(4*angle);
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