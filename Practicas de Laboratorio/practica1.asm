;; 1. Mostrar una literal en el puerto C

__CONFIG _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_ON & _BOR_ON & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & _XT_OSC
__CONFIG _CONFIG2, _WRT_OFF & _BOR40V

LIST p =16F887		
#include<p16F887.INC>

;Vectores de reset e inicio
org	0x00
goto Inicio
org	0x04

Inicio
	banksel TRISC 
	movlw b'00000000'
	movwf TRISC
	banksel PORTC

Bucle
	movlw b'11111111'
	movwf PORTC
	goto Bucle
	end