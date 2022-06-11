__CONFIG _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_OFF & _WDT_OFF & _XT_OSC
__CONFIG _CONFIG2, _WRT_OFF & _BOR21V

LIST P = 16F887           ; Modelo del PIC
#include <P16F887.INC>    ; Librería del PIC

CBLOCK 0X20               ; Declarar Variables
C1                        
C2                        
C3 
RESULTADO   
UNI    
DEC                      
ENDC

ORG 0X00                  ; Vector de Reset

banksel	TRISA             ; Habilitar RA1 = Entrada (Sensor Temperatura)
bsf  TRISA, RA1
clrf TRISB                ; Habilitar TRISB = Salida
clrf TRISD                ; Habilitar TRISD = Salida 
clrf TRISC  
clrf TRISE

banksel ANSEL
bsf ANSEL, 1              ; Habilitar RA1 = Entrada Analógica    

banksel ADCON1
clrf	ADCON1            ; Justificar a la Izquierda   

banksel PORTA
clrf PORTA
clrf PORTB
clrf PORTC
clrf PORTD
clrf PORTE

PRINCIPAL
	call LCD
	goto ADC

LCD
	bcf	PORTD, 5          ; Bit 5 de PORTD Conectado a RS
	movlw B'00000001'
	movwf PORTB
	call ENABLE
	movlw B'00001100'
	movwf PORTB
	call ENABLE
	movlw B'00111100'
	movwf PORTB
	call ENABLE
	bsf	PORTD, 5          
	return

ENABLE
	bsf	PORTD, 7          ; Bit 7 de PORTD Conectado a E
	call RETARDO
	call RETARDO
	bcf	PORTD, 7          
	call RETARDO
	return

IMPRIMIR
	bsf	PORTD, 5
	call ENABLE
	return

LIMPIAR
      bcf PORTD, 5     
      movlw B'00000001'	   
	  movwf PORTB
	  call ENABLE     
      bsf PORTD, 5  
      return

ADC
	banksel ADCON0
	movlw B'01000101'         
	movwf ADCON0          ; Habilitar ADC en el Canal 1
	call RETARDO
	
LECTURA
	bsf ADCON0, GO        ; Iniciar Conversión 

ESPERA
	btfsc ADCON0, GO      ; Verificar Conversión. GO = 0 = Fin ADC
	goto ESPERA

PANTALLA                  
	call LIMPIAR
	
	movlw 'T'
	movwf PORTB
	call IMPRIMIR

	movlw 'E'
	movwf PORTB
	call IMPRIMIR

	movlw 'M'
	movwf PORTB
	call IMPRIMIR

	movlw 'P'
	movwf PORTB
	call IMPRIMIR

	movlw '.'
	movwf PORTB
	call IMPRIMIR

	movlw ':'
	movwf PORTB
	call IMPRIMIR

	movlw ' '
	movwf PORTB
	call IMPRIMIR

	call TEMPERATURA

	movf DEC, W    
    movwf PORTB
    call IMPRIMIR
      
	movf UNI, W  
    movwf PORTB
    call IMPRIMIR

	movlw H'DF'
	movwf PORTB
	call IMPRIMIR

	movlw 'C'
	movwf PORTB
	call IMPRIMIR

	call PAUSAR           ; Pausar 10 Segundos
	goto LECTURA          ; Volver a leer Temperatura del Sensor 
	
TEMPERATURA
	clrf DEC
	clrf UNI
	clrf RESULTADO

	banksel ADRESH
	movf ADRESH, W        ; Mover Resultado de Conversión a W
	movwf RESULTADO       ; Mover W a RESULTADO
	rlf RESULTADO, F      ; Rotar a la Izquierda (Para Dividir)

DECENAS
	movlw D'10'       
	subwf RESULTADO, W     
	btfss STATUS,C    
	goto UNIDADES    
	movwf RESULTADO      
	incf DEC, 1          ; Incrementar 1 en DEC   
	goto DECENAS     

UNIDADES
	movf RESULTADO, W      
	movwf UNI

ASCII
	movlw	D'48'        ; Empieza los números (0 al 9) en ASCII
	iorwf	UNI, F      
	iorwf	DEC, F  
	return

RETARDO
	movlw D'150'           
	movwf C2              ; C2 = 150
	movlw D'255' 
	movwf C1              ; C1 = 255
	decfsz C1, 1          ; Decrementar 1 en C1. Salta Cuando C1 = 0
	goto $ - 1
	decfsz C2, 1          ; Decrementar 1 en C2. Salta Cuando C2 = 0
	goto $ - 5
	return

PAUSAR
	movlw D'100'
	movwf C3              ; C3 = 100
	goto BUCLE

BUCLE
	movlw D'80'
	movwf C2              ; C2 = 80
	movlw D'250'
	movwf C1              ; C1 = 250
	nop
	nop
	decfsz C1, 1          ; Decrementar 1 en C1. Salta Cuando C1 = 0
	goto $ - 3
	decfsz C2, 1          ; Decrementar 1 en C2. Salta Cuando C2 = 0
	goto $ - 7
	decfsz C3, 1          ; Decrementar 1 en C3. Salta Cuando C3 = 0
	goto BUCLE
	return

END    