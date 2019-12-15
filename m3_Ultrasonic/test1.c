#include<pic.h>   //����ͷ�ļ���
//__CONFIG(FOSC_XT&WDTE_ON&WDTE_OFF&LVP_ON&LVP_OFF); //���������֣�
#define uint8 unsigned char
void Delay10us(unsigned int delay);   //������ʱ������

int n=0;		// ���������¼
unsigned char i=0;
void main()                   //��������
{
	ADCON1=(ADCON1&0xf0)|0x07;  //����ADCON1����λΪ0111��
	                             //��A�ڻ�E����Ϊ��ͨI/O��ʹ�ã�
	TRISA1 = 0
	RA = 1;

	// �����ź�
	TRISC1=0;
	RC1 = 0;

	// ���벶��
	TRISC2=1; 
	CCP1CON = 0b00000101;
	CCPR1L = 0;
	CCPR1H = 0;

	
	
	// �ж�
	GIE=1;
	PEIE=1;
	CCP1E=0;
	CCP1F=0;
	
	// DEBUG
	TRISD = 0x00;
	PORTD = 0x00;


	while(1){
		RC1 = 1;
		Delay10us(1);
		RC1 = 0;
     
		for (i=0; i<20; i++) {
			if (CCP1F) {
				if (n==8) {
					n = 0;
					get_dist();
					break;
				}
				else {
					n += 1;
				}
				CCP1F = 0;
			}
			Delay10us(1);
		}
		
	      //�����޷��ű���i��i=0��
	    for(i=0; i<8; i++) {
	        PORTD=(0x01<<i);   //��PORTD�ĵ�iλ����Ϊ�ߵ�ƽ
	        Delay(3000);       //������ʱ����Ϊ3000
	     }
	} 
}

void interrupt PIC_Int(void) {
uint8 i;                     //�������i
	if (INTF){
		

	}
}

void Delay10us (unsigned int delay)     //������ʱ����Delay
{
 unsigned int i;                //�����޷������ͱ���i
  for (;delay>0; delay--)       // forѭ����䣬delay>0ʱ�Լ�1����������ѭ��
    for (i=0; i<5; i++);         // forѭ����䣬i<10ʱ�Լ�1����������ѭ��

}

