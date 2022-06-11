;;;Script para pasar el valor del puerto A al puerto B
;;Micros

;;; Configuracion de fusibles

__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC

;;Bibliotecas del PIC

LIST p=16F84			;
#include<p16f84.inc>	;

;;;

org 0x000				;vector de reset

;;;;
;;;;Pseudocodigo

Inicio
	bsf h'03',5			;Pasamos del banco 0 al banco 1
	movlw b'11111111'	;movemos una literal al registro W
	movwf TRISA			;configuramos el puerto A como entrada
	clrf TRISB			;el puerto habilitado como salida
;;	movlw b'00000000'	;movemos una literal al registro W
;;	movwf TRISB			;configuramos el puerto B como salida
	bcf STATUS,RP0		;pasamos del banco 1 al banco 0
Bucle
	;;movf h'05',0		;cargamos el registro W con un valor
	;;movwf h'06'			;el valor de A se muestra en B
	movf PORTA,W		;
	movwf PORTB			;
	sleep 
	;goto Bucle			;
	end