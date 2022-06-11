;; 2. Pasar el valor del puerto A al puerto B

__CONFIG _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_ON & _BOR_ON & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & _XT_OSC
__CONFIG _CONFIG2, _WRT_OFF & _BOR40V

LIST p=16F887		
#include<p16F887.INC>

;Vectores de reset de inicio
ORG	0X00	;
ORG	0X04	;

Inicio
	banksel	ANSEL
	clrf	ANSEL
	clrf	ANSELH
	
	banksel	TRISA
	movlw	b'11111111'
	movwf	TRISA
	banksel TRISB
;	movlw	b'0000'
;	movwf	TRISB
	clrf	TRISB
	banksel	PORTA	

Bucle
	movf	PORTA, 0
	movwf	PORTB
	goto	Bucle
	end
	



