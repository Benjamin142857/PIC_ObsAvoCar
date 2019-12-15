#include<pic.h>   //����ͷ�ļ���
#define uint8 unsigned char
��
void delay_10us(unsigned int n);
unsigned int i;
unsigned int n;
unsigned int t;		// ��¼����ʱ��ms
unsigned int s;		// ��¼����cm

void main()                   //��������
{
	OPTION_REG = 0x00;
	T0IF = 0;

	// DEBUG
	ADCON1=(ADCON1&0xf0)|0x07; 
	TRISA1 = 0;
	RA1 = 1;
	TRISD = 0x00;
	PORTD = 0x00;
	s = 0;

	// ���벶��
	TRISC2=1; 
	CCP1CON = 0b00000101;
	CCPR1L = 0;
	CCPR1H = 0;
	CCP1IF = 0;

	// �����ź�
	TRISC1 = 0;
	RC1 = 0;

	// �����ź�
	TRISC2 = 1;
	
	

	while(1){
		RC1 = 1;
		delay_10us(1);
		RC1 = 0;

		delay_10us(20);

		// ����
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
		s = 0.34*t;
		PORTD = (int)s;

		
		
		delay_10us(1000);
		
	}
   
}



void delay_10us (unsigned int n) {
	for (i=0; i<n; i++) {
		TMR0 = 251;
		while(!T0IF);
		T0IF = 0;
	}
}