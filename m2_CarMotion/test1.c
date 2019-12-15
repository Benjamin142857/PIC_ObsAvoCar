#include <pic.h>
// C��D��
unsigned int i;

void motion_Forward();
void motion_Stop();
void motion_LeftTurn(unsigned int angle);
void motion_RightTurn(unsigned int angle);
void delay_10ms (unsigned int n);
void init();

void main() {
	init();
	RD1 = 1;

	
	while(1) {
		RD1 = 1;
		delay_10ms(100);
		RD1 = 0;
		motion_Forward();
		delay_10ms(100);
		RD1 = 1;
		motion_Stop();
		delay_10ms(100);
		RD1 = 0;
		motion_LeftTurn(90);
		delay_10ms(100);
		motion_RightTurn(90);
	}
	
}

void init() {
	TRISC4 = 0;
	TRISC5 = 0;
	TRISC6 = 0;
	TRISC7 = 0;
	TRISD1 = 0;
	RC4 = 0;
	RC5 = 0;
	RC6 = 0;
	RC7 = 0;
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
	delay_10ms(angle/2);
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
	delay_10ms(angle/2);
	RC4 = 0;
	RC5 = 0;
	RC6 = 0;
	RC7 = 0;
}

void delay_10ms (unsigned int n) {
	OPTION_REG = 0x07;
	T0IF = 0;

	for (i=0; i<n; i++) {
		TMR0 = 148;
		while(!T0IF);
		T0IF = 0;
	}
}
