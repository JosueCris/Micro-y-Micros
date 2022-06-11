;Script para escribir en el LCD un mensaje.

list p=16F84A
#include P16F84A.inc
__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC
;
Reset org 0x00
goto Inicio
CBLOCK 0x25
T_Enc_Led
T_Conta1
T_Conta2
ENDC

Inicio 
	bsf STATUS,RP0
	movlw b'00000'
	movwf TRISA
	movlw b'00000000'
	movwf TRISB
	bcf STATUS,RP0
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
	movlw b'01001000';b'00001010 'H
	movwf PORTB
	call Imprime
	movlw b'01101111'; o
	movwf PORTB
	call Imprime
	movlw b'01111100'; l
	movwf PORTB
	call Imprime
	movlw b'01100001'; a
	movwf PORTB
	call Imprime
	movlw b'00001010'; salto de linea
	movwf PORTB
	call Imprime
	movlw b'01001010'; J
	movwf PORTB
	call Imprime
	movlw b'11110101'; §
	movwf PORTB
	call Imprime
	movlw b'10100110'; ª
	movwf PORTB
	call Imprime
	movlw b'00101100'; ,
	movwf PORTB
	call Imprime
	return

Renglon2
	movlw 'E'
	movwf PORTB
	call Imprime
	movlw 's'
	movwf PORTB
	call Imprime
	movlw 't'
	movwf PORTB
	call Imprime
	movlw 'u'
	movwf PORTB
	call Imprime
	movlw 'd'
	movwf PORTB
	call Imprime
	movlw 'i'
	movwf PORTB
	call Imprime
	movlw 'a'
	movwf PORTB
	call Imprime
	movlw 'n'
	movwf PORTB
	call Imprime
	movlw 't'
	movwf PORTB
	call Imprime
	movlw 'e'
	movwf PORTB
	call Imprime
	movlw 's'
	movwf PORTB
	call Imprime
	call Pausa
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
#include <retardo.INC>
	end