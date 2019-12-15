#include<pic.h>   //����ͷ�ļ���
#define uint8 unsigned char

void Delay10us(unsigned int delay);   //������ʱ����
void Delay20us(unsigned int delay);   //������ʱ������
unsigned int i;
unsigned int t;		// ��¼����ʱ��ms
unsigned int s;		// ��¼����cm

void main()                   //��������
{

	// DEBUG
	ADCON1=(ADCON1&0xf0)|0x07; 
	TRISA1 = 0;
	RA1 = 1;
	TRISD = 0x00;
	PORTD = 0x00;
	s = 0;


	// �����ź�
	TRISC1 = 0;
	RC1 = 0;

	// �����ź�
	TRISC2 = 1;
	
	

	while(1){
		RC1 = 1;
		Delay10us(1);
		RC1 = 0;

     	Delay20us(10);

		t = 0;
		RD0 = 0;
		while(RC2) {
			RD0 = 1;
			Delay20us(1);
			t += 1;	
			RD0 = 0;
		}
		RD0 = 0;

/*
		s = 0.034*t;
		PORTD = s/1;
*/
	}
   
}


void Delay10us (unsigned int delay)     //������ʱ����Delay
{
	for (;delay>0; delay--)       // forѭ����䣬delay>0ʱ�Լ�1����������ѭ��
    	for (i=0; i<5; i++);         // forѭ����䣬i<10ʱ�Լ�1����������ѭ��
}

void Delay20us (unsigned int delay)     //������ʱ����Delay
{
	for (;delay>0; delay--)       // forѭ����䣬delay>0ʱ�Լ�1����������ѭ��
    	for (i=0; i<9; i++);         // forѭ����䣬i<10ʱ�Լ�1����������ѭ��

}
