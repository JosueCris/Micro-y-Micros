;este script realiza la function de un contador de 3 bits
;FLH;
;;Datos de los fusiles del microcontrolador
__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC;
LIST P=16F84		;Modelo de PIC
#include<p16f84.inc>	;
;Asignacion directivas
	CBLOCK	0x0C			;RAM de usuario a partir de esta direccion.
	Contador			;Contara las veces que tiene que rodar el diodo.
	RegDesplaza				;Registro que se desplazara.
	ENDC
ORG		0x000	;Vector reset
;Descripcion del script
Inicio
	bsf STATUS, RP0		;
	movlw	b'00111'	;
	movwf	TRISA		;
	movlw	b'0000000000'	;
	movwf	TRISB		;B7
	bcf		STATUS, RP0	;
	
Principal
	movf PORTA,W				;Lee el dato de entrada.
	andlw	b'00000111'			;Se queda con los 3 bits menos significativos.
	movwf	Contador		;El dato de entrada pasa al Contador.
	movf	Contador,F		;Solo sirve para posicionar la bandera Z del registro STATUS.
	btfsc	STATUS,Z		;¿Z=0?,(Contador)es distinto de 0?
	goto	ActivaSalida	;No, es cero. Los LEDs se apagan.
	clrf	RegDesplaza		;Si, efectivamente es distinto de cero. Rota.
DesplazaOtraVez				;La primera vez con todos los LEDs apagados.
	bsf		STATUS,C	;Pone a 1 el Carry. Este bit sera el que rote a
	rlf		RegDesplaza,F	;izquierda por el registro RegDesplaza.
	decfsz	Contador,F		;Rota tantas veces como indique el (Contador).
	goto	DesplazaOtraVez
	movf	RegDesplaza,W	;Se carga en W para visualizarlo a la salida.
ActivaSalida
	movwf	PORTB		;Resultado se visualiza por el puerto de salida.
	goto	Principal
END						;Fin del programa.	