; 14. Implementar un script para un motor paso a paso, el cual debe realizar un total de 20 pasos, en cada paso se detendrá 4 segundos en el paso 10 y 20 prenderá una alarma sonora
__CONFIG _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_OFF & _WDT_OFF & _XT_OSC
__CONFIG _CONFIG2, _WRT_OFF & _BOR21V

LIST p=16f887
#include<P16f887.INC>

CBLOCK 0X20
	Contador1
	Contador2
	Contador3
	con
	x
ENDC

ORG 0X00
ORG 0X04

Inicio
	banksel ANSEL
	clrf ANSEL
	clrf ANSELH
	
	banksel TRISB
	clrf TRISB
	clrf TRISC
	banksel PORTB

clrf PORTB
movlw d'5'
movwf con
clrf PORTC

Bucle
	movlw b'1000'
	movwf PORTB
	call Retardo
	call Retardo
	call Retardo
	call Retardo

	movlw b'0100'
	movwf PORTB
	call Retardo
	call Retardo
	call Retardo
	call Retardo

	movlw d'3'
	xorwf con, 0
	movwf x
	movf x, F
	btfsc STATUS, Z
	call Buzzer

	movlw b'0010'
	movwf PORTB
	call Retardo
	call Retardo
	call Retardo
	call Retardo

	movlw b'0001'
	movwf PORTB
	call Retardo
	call Retardo
	call Retardo
	call Retardo

	decfsz con
	goto Bucle
	call Buzzer
	sleep


Buzzer
	bsf PORTC, 0
	call Retardo
	call Retardo
	bcf PORTC, 0
	return
	

Retardo
	movlw D'25'
	movwf Contador1
Rep1
	movlw D'40'
	movwf Contador2
Rep2
	nop
	movlw D'199'
	movwf Contador3
Rep3
	nop
	nop
	decfsz Contador3
	goto Rep3
	decfsz Contador2
	goto Rep2
	decfsz Contador1
	goto Rep1
	return
end