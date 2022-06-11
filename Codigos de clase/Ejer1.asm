;El puerto B es controlado por los bits A1, A2 y A1, si las entradas ;
;son falsas el nibble alto es verdadero, si A0=0, A1 Y A2=1, B5,B5,B7 ;
;son verdaderos los demás falsos, si A0=A1 Y A2=1 el nibble bajo ;
;es verdadero, si A2=0, A0 y A1 son verdaderos los bits B7 y B0 ;
;son verdaderos. 

__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC

LIST p=16F84
#include <p16f84.inc>

ORG 0x000

inicio
	bsf STATUS, RP0
	clrf TRISB
	movlw b'00111'
	movwf TRISA
	bcf STATUS, RP0

ciclo
	clrw
	movlw b'00000'
	btfss PORTA, W
	goto salida1
	movlw b'00110'
	btfss PORTA, W
	goto salida2
	movlw b'00111'
	btfss PORTA, W
	goto salida3
	movlw b'00011'
	btfss PORTA, W
	goto salida4
	goto ciclo

salida1
	clrw
	movlw b'11110000'
	movwf PORTB
	goto ciclo

salida2
	clrw
	movlw b'11100000'
	movwf PORTB
	goto ciclo

salida3
	clrw
	movlw b'00001111'
	movwf PORTB
	goto ciclo

salida4
	clrw
	movlw b'10000001'
	movwf PORTB
	goto ciclo
end