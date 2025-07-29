
_main:

;LED.c,10 :: 		void main() {
;LED.c,13 :: 		Led_Direction=0;                             // set RB1 pin as output
	BCF        TRISB1_bit+0, BitPos(TRISB1_bit+0)
;LED.c,14 :: 		TRISB5_bit=1;
	BSF        TRISB5_bit+0, BitPos(TRISB5_bit+0)
;LED.c,15 :: 		TRISC = 0x00;                                  // Configure PORTC as output
	CLRF       TRISC+0
;LED.c,16 :: 		PORTC = 0xAA;                                  // Initial PORTC value
	MOVLW      170
	MOVWF      PORTC+0
;LED.c,17 :: 		oldstate = 0;
	BCF        _oldstate+0, BitPos(_oldstate+0)
;LED.c,19 :: 		do {
L_main0:
;LED.c,20 :: 		if (Button(&PORTB, 5, 1, 1)) {               // Detect logical one
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      5
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;LED.c,21 :: 		oldstate = 1;
	BSF        _oldstate+0, BitPos(_oldstate+0)
;LED.c,23 :: 		}
L_main3:
;LED.c,24 :: 		if (oldstate && Button(&PORTB, 5, 1, 0)) {   // Detect one-to-zero transition
	BTFSS      _oldstate+0, BitPos(_oldstate+0)
	GOTO       L_main6
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      5
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main6
L__main7:
;LED.c,25 :: 		Led = ~Led;
	MOVLW
	XORWF      RB1_bit+0, 1
;LED.c,27 :: 		oldstate = 0;                              // Update flag
	BCF        _oldstate+0, BitPos(_oldstate+0)
;LED.c,28 :: 		}
L_main6:
;LED.c,29 :: 		} while(1);                                    // Endless loop
	GOTO       L_main0
;LED.c,30 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
