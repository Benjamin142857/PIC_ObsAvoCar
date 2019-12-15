#include <pic.h>

void delay(int t);
void init_USART();

void main(void) {
    init_USART();

    while {
        TXREG = 0x32;
        while(!TRMT);
        delay(100);
    }

}

void init_USART() {
    TRISC6 = 0;
    TRISC7 = 1;
    TXSTA = 0b00100100;
    RCSTA = 0b10010000;
    SPBRG = 17;
    INTCON = 0x00;
}

void delay(int t) {
    int i, j;
    for(i=t; i>0; i--) {
        for(j=0; j<100; j++);
    }
}
