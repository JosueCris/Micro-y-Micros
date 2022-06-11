__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC
LIST p=16F84
#include <P16F84.inc>
CBLOCK 0x10
	estado
    	count1
	count2
	count3
ENDC

ORG	0	; Vector de reset

goto	PUERTOS	    	; ir al código de inicio.
org 	4		    	; interrupción del vector.

halt	goto    halt	; permanecer en el bucle infinito.
 
PUERTOS
	clrw			    ; limpiamos W.
	movwf  PORTA		; limpiamos PORT A.
    movwf  PORTB	
	bsf    STATUS, RP0	; pasamos del banco 0 al banco 1
	clrw			    ; limpiamos a W
	movwf  TRISB		; configuramos el Puerto B como salida.
	bcf    STATUS, RP0	; regresamos al banco 0
 
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
    retlw  b'01000001'	; si estado es 0, entonces Rojo1 y Verde2
    retlw  b'00100001'	; si estado es 1, entonces Rojo1 y Amarillo2  
    retlw  b'00010100' 	; si estado es 2, entonces Verde1 y Rojo2
    retlw  b'00010010'	; si estado es 3, entonces Amarillo1 y Rojo2 
	  
RETARDOS 
	clrf	count1
	clrf	count2
	movlw	2			; esperamos dos segundos por cada cambio
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


