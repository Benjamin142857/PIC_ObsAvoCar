#include<pic.h> 

// #define STOP_DISTANCE 13;		// ��·�Ͼ��� <= ��ֵʱ������ͬ·״̬

void init();
void delay_10us(unsigned int n);
void delay_1ms(unsigned int n);
void motion_Forward();
void motion_Stop();
void motion_LeftTurn(unsigned int angle);
void motion_RightTurn(unsigned int angle);
int get_Ultrasonic();

unsigned int i;				// ����ѭ������ʱ����
unsigned int j;				// ����ѭ������ʱ����
unsigned int t;				// ��¼����ʱ��ms
unsigned int s;				// ��¼����cm
unsigned int flag;			// ��ͨ·״̬ת����־
unsigned int road_pass;		// ·ͨ����־�� (=10Ϊͨ·״̬)



void main() {
	init();
	while(1){

		// 1. ��������������ȡ·�Ͼ��� s (cm)�� 0 <= s <= 500 (ʵ�ʾ�����ڵ���5mʱ�� s = 500) 
		t = get_Ultrasonic();
		s = (int)(0.34*t);
		
		// 2. �������, ֱ�л����
		// 2.1 ֱ��
		if (s > 5) {
			RD1 = 0;

			// 2.1.1 ͨ·״̬�µ�ֱ��
			if (road_pass >= 1) {
				motion_Forward();
				flag = 1;
			}
			// 2.1.2 ��ͨ·״̬�µĶ���αֱ��
			else {
				motion_Forward();
				road_pass++;
			} 

		}
		// 2.2 ����
		else {
			RD1 = 1;
			road_pass = 0;

			// 2.2.1 �޽⣬��·
			if(flag > 250) {
				motion_Stop();
			}

			// 2.2.2 ��ת flag �� 10��
			else if(flag%2==1) {
				for(j=0; j<flag; j++) {
					delay_1ms(20);
					motion_LeftTurn(2*flag);
				}
			}

			// 2.2.3 ��ת flag �� 10��
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
	// ������ CCP
	TRISC1 = 0;					// RC1 ��� - �����ź�
	TRISC2 = 1; 				// RC2 ���� - ���벶��
	CCP1CON = 0b00000101;		// ����Ϊ����һ��������
	RC1 = 0;					// ��ʼ��RC1���
	CCP1IF = 0;					// ��ʼ�������־λ (ֻɨ�費�ж�)
	CCPR1L = 0;					// ��ʼ���Ĵ��� (��ʵû��)
	CCPR1H = 0;					// ��ʼ���Ĵ��� (��ʵû��)
	

	// ����˶�����
	TRISC4 = 0;	
	TRISC5 = 0;
	TRISC6 = 0;
	TRISC7 = 0;
	RC4 = 0;
	RC5 = 0;
	RC6 = 0;
	RC7 = 0;
	flag = 1;					// ��ͨ·��ת����־��ʼ1
	road_pass = 10;				// ��ʼ��10ͨ·״̬

	// DEBUG
	TRISD1 = 0;
	RD1 = 0;
}


int get_Ultrasonic() {
	/*
		��ȡ��������������������������ʱ��
		return t : ���ص�t����ֵ�����ʱ�����ж��ٸ�20us  
	*/
	CCP1IF = 0;
	RC1 = 1;
	delay_10us(1);
	RC1 = 0;

	// ����
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