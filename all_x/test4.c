#include<pic.h>
#define uint8 unsigned char
void init();
void delay_10us(unsigned int n);
void delay_1ms(unsigned int n);
void motion_Forward();
void motion_Stop();
void motion_LeftTurn(unsigned int angle);
void motion_RightTurn(unsigned int angle);
int get_Ultrasonic();
unsigned int i;
unsigned int t;		// ??????ms
unsigned int last_t; // ??????
unsigned int s;		// ????cm
unsigned int l;		// ??????
unsigned int r;		// ??????


void main()                   //????
{
	init();
	while(1){
		t = get_Ultrasonic();
		s = (int)(0.34*t);
		
		if (s>13) {
			motion_Forward();
			RD1 = 0;
		}
		else if (l <= 6) {
			motion_Stop();
			RD1 = 1;
			delay_1ms(20);
			motion_LeftTurn(15);
			delay_1ms(20);
			l++;
		}
		else if (r <= 12) {
			motion_Stop();
			RD1 = 1;
			delay_1ms(20);
			motion_RightTurn(15);
			delay_1ms(20);
			r++;
		}
		else {
			RD1 = 1;
			l = 0;
			r = 0;
		}

		delay_1ms(10);
		
	
	}
   
}


void init() {
	// ????
	TRISC2=1; 
	CCP1CON = 0b00000101;
	CCPR1L = 0;
	CCPR1H = 0;
	CCP1IF = 0;

	// ????
	TRISC1 = 0;
	RC1 = 0;

	// ????
	TRISC2 = 1;

	// ??
	TRISC4 = 0;
	TRISC5 = 0;
	TRISC6 = 0;
	TRISC7 = 0;
	RC4 = 0;
	RC5 = 0;
	RC6 = 0;
	RC7 = 0;
	l = 0;
	r = 0;

	// DEBUG
	TRISD1 = 0;
	RD1 = 0;
}

int get_Ultrasonic() {
	CCP1IF = 0;
	RC1 = 1;
	delay_10us(1);
	RC1 = 0;

	delay_10us(19);

	// ??
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
	/*
	delay_1ms(200);
	RC6 = 0;
	delay_1ms(64);
	RC6 = 1;
	*/
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
