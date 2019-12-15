#include<pic.h>

void init();									// 初始化配置
int get_Ultrasonic();							// 触发超声波模块，捕获脉宽时间
void motion_Forward();							// 小车前进
void motion_Stop();								// 小车停止
void motion_Backward(unsigned int time);		// 小车后退
void motion_LeftTurn(unsigned int angle);		// 小车左转
void motion_RightTurn(unsigned int angle);		// 小车右转
void delay_10us(unsigned int n);				// 延时10us
void delay_1ms(unsigned int n);					// 延时1ms

unsigned int i;				// 循环临时索引
unsigned int t;				// 记录超声波脉宽时间 (有多少个20us)
unsigned int s;				// 记录距离cm
unsigned int status;		// 状态码
unsigned int road_pass;		// 路通过标志数 (>=10为通路状态)


void main() {
	// 初始化配置
	init();			

	while(1){
		// 1. 触发超声波模块，捕获脉宽时间并换算成距离
		t = get_Ultrasonic				
		s = (int)(0.34*t);

		// 2.判断当前是否可前行
		// 2.1 当前可直行
		if (s>13) {
			// 指示灯灭
			RD7 = 0;

			// 2.1.1 通路状态下的直行
			if (road_pass >= 2) {
				motion_Forward();
				status = 0;
			}
			// 2.1.2 非通路状态下的短暂伪直行
			else {
				motion_Forward();
				road_pass++;
			} 
		}

		// 2.2 当前不可直行
		else {
			// 指示灯灭，清空road_pass值，并停止小车运动，进入方向调整
			RD7 = 1;
			road_pass = 0;
			motion_Stop();
			delay_1ms(400);

			// 2.2.1 后退 (当前离障碍过近, 直接转动可能会受影响)
			if (s<5) {
				motion_Backward(300);
			}
			// 2.2.2 左转90度
			else if(status == 0) {
				motion_LeftTurn(90);
				status = 1;
			}
			// 2.2.3 右转180度
			else if(status == 1) {
				motion_RightTurn(134);
				status = 2;
			}
			// 2.2.4 右转90度
			else if(status == 2) {
				motion_RightTurn(90);
				status = 3;
			} 
			// 2.2.5 状态置零
			else {
				status = 0;
			}
			delay_1ms(400);
		}

		// 3. 延时10ms再次触发超声波
		delay_1ms(10);;
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
	road_pass = 10;				// 初始化10通路状态

	// DEBUG 指示灯
	TRISD7 = 0;
	RD7 = 0;
}

void get_Ultrasonic() {
	// 发出10us触发脉冲
	RC1 = 1;
	delay_10us(1);
	RC1 = 0;

	// 上升沿捕获
	while (!CCP1IF);
	CCP1IF = 0;
	CCP1CON = 0b00000100;
	t = 0;
	
	// 下降沿捕获
	while(!CCP1IF && t<1400) {
		delay_10us(2);
		t += 1;	
	}
	CCP1IF = 0;
	CCP1CON = 0b00000101;
}

void motion_Forward() {
	RC4 = 0;
	RC5 = 1;
	RC6 = 1;
	RC7 = 0;
	// 直线纠正
	delay_1ms(100);
	RC6 = 0;
	delay_1ms(20);
	RC6 = 1;
}

void motion_Backward(unsigned int time) {
	RC4 = 1;
	RC5 = 0;
	RC6 = 0;
	RC7 = 1;
	delay_1ms(tt);
	RC4 = 0;
	RC5 = 0;
	RC6 = 0;
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
	RC5 = 0;
	RC6 = 1;
	RC7 = 0;
	delay_1ms(4*angle);
	RC4 = 0;
	RC5 = 0;
	RC6 = 0;
	RC7 = 0;
}

void motion_RightTurn(unsigned int angle) {
	RC4 = 0;
	RC5 = 1;
	RC6 = 0;
	RC7 = 1;
	delay_1ms(4*angle);
	RC4 = 0;
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










