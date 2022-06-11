;;;Relizar un script para sumar el valor del PORT A con una constante
__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC


;;Bibliotecas del PIC

LIST p=16F84				;
#include<p16f84.INC>		;

;;;

org 0x04					;vector de interrupcion

CONSTANTE	EQU		b'00001';
;;;Pseudocodigo
	
	bsf		STATUS,RP0			;
	clrf	TRISB				;
	movlw	b'00011111'			;
	movwf	TRISA				;
	bcf		h'03',5			;
Bucle
	movf	PORTA,W				;
	;addlw	CONSTANTE			;
	andlw	CONSTANTE			;
	movwf	PORTB				;
	goto	$-3					;
	end
