;; 6. Realizar un contador de 3 bits conectado al puerto A y mostrar el resultado en un display de 7 segmentos en el puerto C.
__CONFIG _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_ON & _BOR_ON & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & _XT_OSC
__CONFIG _CONFIG2, _WRT_OFF & _BOR40V

LIST p=16F887		
#include<p16F887.INC>

;Vectores de reset de inicio
ORG	0X00	;
ORG	0X04	;
INICIO
	banksel	ANSEL
	clrf	ANSEL
	clrf	ANSELH
	
	banksel TRISC
	;movlw	b'00000000'		; Movemos la literal a W
	;movwf	TRISC			; EL puerto a se configura como salida
	clr	TRISC
	movlw	b'11111111'		;
	movwf	TRISA
	banksel	PORTB		; Regresamos al banco 0
	clrf	PORTC
BUCLE	
	movf	PORTA, 0
	call	TABLA
	movwf	PORTC
	goto	BUCLE
TABLA
	addwf	PCL, F				;
	retlw	b'0111111'			;0
	retlw	b'0000110'			;1
	retlw	b'1011011'			;2
	retlw	b'1001111'			;3
	retlw	b'1100110'			;4
	retlw	b'1101101'			;5
	retlw	b'1111101'			;6
	retlw	b'0000111'			;7
	end