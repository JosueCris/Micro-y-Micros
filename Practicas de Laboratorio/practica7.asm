;; 7. Implementar un contador en hexadecimal controlado por un bit del puerto A y mostrar el resultado en el puerto  C
__CONFIG _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_ON & _BOR_ON & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & _XT_OSC
__CONFIG _CONFIG2, _WRT_OFF & _BOR40V

LIST p=16F887		
#include<p16F887.INC>

CBLOCK	0X0C
contador
ENDC

;Vectores de reset de inicio
ORG	0X00	;
ORG	0X04	;

INICIO
	banksel	ANSEL
	clrf	ANSEL
	clrf	ANSELH
	
	banksel TRISC
	movlw	b'00000000'		; Movemos la literal a W
	movwf	TRISC			; EL puerto a se configura como salida
	bsf		TRISA, RA0		;
	bcf		STATUS, RP0		; Regresamos al banco 0
	clrf	contador		;
	clrf	PORTC

PULSADOR
	btfsc	PORTA, RA0		; Pregunta si esta en 0 el contador, si no se ha presionado el boton se mantiene de lo contrario brinca la siguiente instruccion
	goto	$-.1			; Retrocedemos al paso anterior a este
	btfss	PORTA, RA0		; Si esta en 1 continua, de lo contario hace la sig. linea
	goto 	$-.1			; Retrocedemos al paso anterior a este
	movf	contador, W		;
	call 	TABLA			; Mandamos a llamar los valores de tabla
	movwf	PORTC			;
	incf	contador, F		;
	movlw	.18				;
	subwf	contador, W		;
	btfsc	STATUS, Z		;
	clrf	contador		;
	goto	PULSADOR		;

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
	retlw	b'1111111'			;8
	retlw	b'1101111'			;9
	retlw	b'1110111'			;A
	retlw	b'1111100'			;B
	retlw	b'0111001'			;C
	retlw	b'1011110'			;D
	retlw	b'1111001'			;E
	retlw	b'1110001'			;F
	end