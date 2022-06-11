__CONFIG _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_OFF & _WDT_OFF & _XT_OSC
__CONFIG _CONFIG2, _WRT_OFF & _BOR21V

LIST p=16f887
#include<P16f887.INC>

CBLOCK 0X20
	Contador1
	Contador2
	Contador3
	con
ENDC

ORG 0X00
ORG 0X04

inicio
	banksel ANSEL
	clrf ANSEL
	clrf ANSELH
	
	banksel TRISD
	clrf TRISD
	banksel PORTD

clrf PORTD
movlw d'16'
movwf con

main
	movlw b'1010'
	movwf PORTD
	call retardo

	movlw b'0110'
	movwf PORTD
	call retardo

	movlw b'0101'
	movwf PORTD
	call retardo

	movlw b'1001'
	movwf PORTD
	call retardo

	decfsz con
	goto main
	sleep


retardo
	movlw D'25'
	movwf Contador1
rep1
	movlw D'40'
	movwf Contador2
rep2
	nop
	movlw D'199'
	movwf Contador3
rep3
	nop
	nop
	decfsz Contador3
	goto rep3
	decfsz Contador2
	goto rep2
	decfsz Contador1
	goto rep1
	return
end