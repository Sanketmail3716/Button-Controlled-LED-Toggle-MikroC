bit oldstate;                                    // Old state flag
// Lcd pinout settings
sbit Led at RB1_bit;


// Pin direction
sbit Led_Direction at TRISB1_bit;


void main() {


  Led_Direction=0;                             // set RB1 pin as output
 TRISB5_bit=1;
  TRISC = 0x00;                                  // Configure PORTC as output
  PORTC = 0xAA;                                  // Initial PORTC value
  oldstate = 0;

  do {
    if (Button(&PORTB, 5, 1, 1)) {               // Detect logical one
      oldstate = 1; 
                                   // Update flag
    }
    if (oldstate && Button(&PORTB, 5, 1, 0)) {   // Detect one-to-zero transition
      Led = ~Led;
                        // Invert PORTC
      oldstate = 0;                              // Update flag
    }
  } while(1);                                    // Endless loop
}
