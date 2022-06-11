;; este script muestra una variable en el puerto B
;; 23/04/2022
;; fusibles
__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC

;;

LIST p=16F84					;
#include <p16f84.INC>			;

var1	EQU		b'10101010'		;

ORG		0X000					; Vector de reset
inicio
	bsf		STATUS,RP0			; pasar del banco 0 al banco 1
	clrf	TRISB				; el puerto B se usa como salida
	bcf		h'03', 5			; ahora pasamos del banco 1 al banco 0
	movlw	var1				;
bucle
	movwf	PORTB				; mostrar var1 en el puerto B
	goto bucle					;
	end							;
	