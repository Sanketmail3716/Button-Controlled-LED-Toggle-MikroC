#line 1 "G:/My Drive/Envision/PIC Microcontroller/MikroC/LED/LED.c"
bit oldstate;

sbit Led at RB1_bit;



sbit Led_Direction at TRISB1_bit;


void main() {


 Led_Direction=0;
 TRISB5_bit=1;
 TRISC = 0x00;
 PORTC = 0xAA;
 oldstate = 0;

 do {
 if (Button(&PORTB, 5, 1, 1)) {
 oldstate = 1;

 }
 if (oldstate && Button(&PORTB, 5, 1, 0)) {
 Led = ~Led;

 oldstate = 0;
 }
 } while(1);
}
