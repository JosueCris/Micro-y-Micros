;
;Primavera 2022
;
list p=16F84A			
#include P16f84A.inc
__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC	

Led		EQU		7		;
Boton	EQU		3		;
;;**** Configuracion de puertos ***

Reset	ORG		0X04	;
	;;
;;;PSEUDOCODIGO	
Inicio
		bsf STATUS, RP0		;
	movlw	b'11111'	;
	movwf	TRISA		;
	movlw	b'01111111'	;
	movwf	TRISB		;B7
	bcf		STATUS, RP0	;
	bcf		PORTB, Led	;
;
Bucle
	btfsc	PORTA, Boton; Revisa el estado del bit 3 del puerto A, salta si es 0
	goto	Apagar		;
	bsf		PORTB, Led	;
	goto	Bucle		;
	
Apagar	bcf	PORTB, Led;
		goto	Bucle;
	End
	