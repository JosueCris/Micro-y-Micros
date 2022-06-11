;;; Un script para realizar la operacion
;;; logica AND entre dos registros
;;; 23/03/2022
;; Micros
; Lista de fusibles

__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC
LIST p=16f84			;
#include<p16f84.INC>		;libreria para el PIC16F84

reg1	EQU		0X0D;
reg2	EQU		0X0E;
result	EQU		0X0F; posicion del resultado en la memoria
;;
ORG		0X000		; Vector de reset
;;
Inicio
	movlw	b'10110011'	;
	movwf	reg1		;
	movlw	b'10101001'	;
	movwf	reg2		;
	andwf	reg1,0		;
	movwf	result		;
	end	

