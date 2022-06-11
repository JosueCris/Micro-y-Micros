;8.	MOSTRAR EN UN LCD EL MESANJE “HOLA MUNDO” una palabra en cada renglón.
__CONFIG _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_ON & _BOR_ON & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & _XT_OSC
__CONFIG _CONFIG2, _WRT_OFF & _BOR40V

LIST p=16F887		
#include<p16F887.INC>
;
Reset org 0x00
goto Inicio
CBLOCK 0x25
T_Enc_Led
T_Conta1
T_Conta2
ENDC

Inicio 
	banksel	ANSEL
	clrf	ANSEL
	clrf	ANSELH

	banksel	TRISB
	movlw b'00000'
	movwf TRISA
	movlw b'00000000'
	movwf TRISB
	banksel	PORTB
	clrf PORTA
	clrf PORTB

InicializacionLCD
	call LCD_Input
	call Renglon1
	call Siguiente
	call Renglon2
	goto InicializacionLCD

LCD_Input
	bcf PORTA,0 ;o en donde esté conectado Rs
	movlw b'00000001' ;Limpia LCD
	movwf PORTB
	call Enable ; HABILITACION + RETARDO
	movlw b'00001100' ; POSICION 0 EN EL RENGLON 0
	movwf PORTB
	call Enable ;Configuracion del Cursor
	movlw b'00111100'
	movwf PORTB
	call Enable
	bsf PORTA,0 ;o en donde esté conectado Rs
	return

Enable
	bsf PORTA,2 ;o en donde esté conectado Enable
	call Retardo
	call Retardo
	bcf PORTA,2
	call Retardo
	return

Imprime
	bsf PORTA,0
	call Enable
	return

Siguiente
	bcf PORTA,0 ;o en donde esté conectado Rs
	movlw b'11000000'; nos envía al renglon 2
	movwf PORTB
	call Enable
	return

; Texto en Rengon 1
Renglon1
	movlw b'00100000'
	movwf PORTB
	call Imprime
	movlw b'00100000'
	movwf PORTB
	call Imprime
	movlw b'00100000'
	movwf PORTB
	call Imprime
	movlw b'00100000'
	movwf PORTB
	call Imprime
	movlw b'00100000'
	movwf PORTB
	call Imprime
	movlw b'01001000';'H
	movwf PORTB
	call Imprime
	movlw b'01100101'; e
	movwf PORTB
	call Imprime
	movlw b'01111100'; l
	movwf PORTB
	call Imprime
	movlw b'01111100'; l
	movwf PORTB
	call Imprime
	movlw b'01101111'; 0
	movwf PORTB
	call Imprime
	return

Renglon2
	movlw b'00100000'; 
	movwf PORTB
	call Imprime
	movlw b'00100000'
	movwf PORTB
	call Imprime
	movlw b'00100000'
	movwf PORTB
	call Imprime
	movlw b'00100000'
	movwf PORTB
	call Imprime
	movlw b'00100000'
	movwf PORTB
	call Imprime
	movlw b'01010111'; W
	movwf PORTB
	call Imprime
	movlw b'01101111'; 0
	movwf PORTB
	call Imprime
	movlw b'01110010'; r
	movwf PORTB
	call Imprime
	movlw b'01111100'; l
	movwf PORTB
	call Imprime
	movlw b'01100100'; d
	movwf PORTB
	call Imprime
	call Pausa
	return

Retardo
	movlw D'48'
	movwf T_Conta2; M
	movlw D'255'
	movwf T_Conta1 ;N
	decfsz T_Conta1
	goto $-1
	decfsz T_Conta2
	goto $-5
	return

Pausa
	movlw D'5' ;4
	movwf T_Enc_Led
	movlw D'8' ;8
	movwf T_Conta2
	movlw D'250' ;250
	movwf T_Conta1	
	nop
	nop
	decfsz T_Conta1
	goto $-3
	decfsz T_Conta2
	goto $-7
	decfsz T_Enc_Led
	goto Pausa
	return
	end