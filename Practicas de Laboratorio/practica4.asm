;; 4. PRENDER Y APAGAR UN LED CONECTADO AL PUERTO B, CADA 5 SEGUNDOS
__CONFIG _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_ON & _BOR_ON & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & _XT_OSC
__CONFIG _CONFIG2, _WRT_OFF & _BOR40V

LIST P = 16F887           ; Modelo del PIC
#include <P16F887.INC>    ; Librería del PIC

CBLOCK 0X20
C1                        ; Dirección 0X20 para C1
C2                        ; Dirección 0X21 para C2
C3                        ; Dirección 0X22 para C3
ENDC

ORG 0X00                  ; Vector de Reset

banksel TRISB             ; Acceder al Banco 1
clrf TRISB                ; Habilitar TRISB = Salida
banksel PORTB             ; Acceder al Banco 0
	
PRENDER 
	bsf PORTB, 0
	call RETARDO

APAGAR
	bcf PORTB, 0
	call RETARDO

goto PRENDER

RETARDO
	movlw D'44'
	movwf C1              ; C1 = 44
	movlw D'231'
	movwf C2              ; C2 = 231
	movlw D'11'
	movwf C3              ; C3 = 11

BUCLE
	decfsz C1, 1          ; Decrementar 1 en C1. Saltar Cuando C1 = 0
	goto $ + 2            
	decfsz C2, 1          ; Decrementar 1 en C2. Saltar Cuando C2 = 0
	goto $ + 2
	decfsz C3, 1          ; Decrementar 1 en C3. Saltar Cuando C3 = 0
	goto BUCLE

	return

END                       ; Fin de Programa