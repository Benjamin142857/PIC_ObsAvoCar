#include<pic.h>

void init();									// ��ʼ������
int get_Ultrasonic();							// ����������ģ�飬��������ʱ��
void motion_Forward();							// С��ǰ��
void motion_Stop();								// С��ֹͣ
void motion_Backward(unsigned int time);		// С������
void motion_LeftTurn(unsigned int angle);		// С����ת
void motion_RightTurn(unsigned int angle);		// С����ת
void delay_10us(unsigned int n);				// ��ʱ10us
void delay_1ms(unsigned int n);					// ��ʱ1ms

unsigned int i;				// ѭ����ʱ����
unsigned int t;				// ��¼����������ʱ�� (�ж��ٸ�20us)
unsigned int s;				// ��¼����cm
unsigned int status;		// ״̬��
unsigned int road_pass;		// ·ͨ����־�� (>=10Ϊͨ·״̬)


void main() {
	// ��ʼ������
	init();			

	while(1){
		// 1. ����������ģ�飬��������ʱ�䲢����ɾ���
		t = get_Ultrasonic				
		s = (int)(0.34*t);

		// 2.�жϵ�ǰ�Ƿ��ǰ��
		// 2.1 ��ǰ��ֱ��
		if (s>13) {
			// ָʾ����
			RD7 = 0;

			// 2.1.1 ͨ·״̬�µ�ֱ��
			if (road_pass >= 2) {
				motion_Forward();
				status = 0;
			}
			// 2.1.2 ��ͨ·״̬�µĶ���αֱ��
			else {
				motion_Forward();
				road_pass++;
			} 
		}

		// 2.2 ��ǰ����ֱ��
		else {
			// ָʾ�������road_passֵ����ֹͣС���˶������뷽�����
			RD7 = 1;
			road_pass = 0;
			motion_Stop();
			delay_1ms(400);

			// 2.2.1 ���� (��ǰ���ϰ�����, ֱ��ת�����ܻ���Ӱ��)
			if (s<5) {
				motion_Backward(300);
			}
			// 2.2.2 ��ת90��
			else if(status == 0) {
				motion_LeftTurn(90);
				status = 1;
			}
			// 2.2.3 ��ת180��
			else if(status == 1) {
				motion_RightTurn(134);
				status = 2;
			}
			// 2.2.4 ��ת90��
			else if(status == 2) {
				motion_RightTurn(90);
				status = 3;
			} 
			// 2.2.5 ״̬����
			else {
				status = 0;
			}
			delay_1ms(400);
		}

		// 3. ��ʱ10ms�ٴδ���������
		delay_1ms(10);;
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
	road_pass = 10;				// ��ʼ��10ͨ·״̬

	// DEBUG ָʾ��
	TRISD7 = 0;
	RD7 = 0;
}

void get_Ultrasonic() {
	// ����10us��������
	RC1 = 1;
	delay_10us(1);
	RC1 = 0;

	// �����ز���
	while (!CCP1IF);
	CCP1IF = 0;
	CCP1CON = 0b00000100;
	t = 0;
	
	// �½��ز���
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
	// ֱ�߾���
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










