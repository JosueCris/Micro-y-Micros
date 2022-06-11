; 11. Programación del siguiente semáforo Establecer los tiempos para los 8 indicadores los dos semáforos y el cruce peatonal
__CONFIG _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_OFF & _WDT_OFF & _XT_OSC
__CONFIG _CONFIG2, _WRT_OFF & _BOR21V

LIST P = 16F887           ; Modelo del PIC
#include <P16F887.INC>    ; Librería del PIC

ORG 0X00                  ; Vector de Reset

CBLOCK 0x10
	estado
    count1
	count2
	count3
ENDC

goto	PUERTOS	    	; ir al código de inicio.
org 	4		    	; interrupción del vector.

halt	goto    halt	; permanecer en el bucle infinito.
 
PUERTOS
	clrw			    ; limpiamos W.
	movwf  PORTA		; limpiamos PORT A.
    movwf  PORTB	
	banksel	TRISB	; pasamos del banco 0 al banco 1
	clrw			    ; limpiamos a W
	movwf  TRISB		; configuramos el Puerto B como salida.
	banksel	PORTB	; regresamos al banco 0
 
INICIO	  
	clrw			    ; limpiamos W.
    movwf  estado		; limpiamos estado.
 
CICLO    
	call   CAMBIOS	    ; llamamos la funcion CAMBIOS
    movwf  PORTB		; movemos de W al PORTB.
    incf   estado, W	; incrementamos la variable estado y el incremento va al registro W.
    andlw  b'00000011'	; nos aseguramos que el conteo solo sea hasta 3
    movwf  estado		; movemos W a estado.
    call   RETARDOS	    ; esperamos un segundo
    goto   CICLO		; vamos a ciclos nuevamente
          
CAMBIOS   
	movf   estado, W    ; cargamos el estado en W.
    addwf  PCL, F		 
    retlw  b'11000001'	; si estado es 0, entonces Rojo1 y Verde2
    retlw  b'00100001'	; si estado es 1, entonces Rojo1 y Amarillo2  
    retlw  b'00011100' 	; si estado es 2, entonces Verde1 y Rojo2
    retlw  b'0001010'	; si estado es 3, entonces Amarillo1 y Rojo2 
	  
RETARDOS 
	clrf	count1
	clrf	count2
	movlw	12			; esperamos dos segundos por cada cambio
	movwf	count3
	  
DELAY	  
	decfsz	count1, F
	goto   	DELAY
	decfsz 	count2, F
	goto   	DELAY
	decfsz 	count3, F
	goto   	DELAY
    return
    end


