#include<pic.h>   //����ͷ�ļ���
unsigned int i;
static volatile unsigned char p &RD1;
void delay_1ms (unsigned int n);

void main() {
	TRISD1 = 0;
	while(1) {
		*p = ~*p;
		delay_1ms(1000);
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