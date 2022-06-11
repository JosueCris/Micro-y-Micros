;; 3. Pasar un valor del puerto A al puerto D, al terminar, el microcontrolador debe irse el modo de bajo consumo de potencia

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

	banksel	TRISC
	movlw	b'11111111'
	movwf	TRISA
	clrf	TRISD
	banksel	PORTA	

Bucle
	movf	PORTA, 0
	movwf	PORTD
	sleep
	end	