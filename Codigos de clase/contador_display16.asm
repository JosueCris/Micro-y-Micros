LIST p=16F84A
#include <P16F84A.inc>
CBLOCK	0X0C
contador
ENDC
__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC

ORG 0X04	; 

INICIO
	bsf		STATUS, RP0		; Movemos del bancon 0 al banco 1
	movlw	b'00000000'		; Movemos la literal a W
	movwf	TRISB			; EL puerto a se configura como salida
	bsf		TRISA, RA0		;
	bcf		STATUS, RP0		; Regresamos al banco 0
	clrf	contador		;
	clrf	PORTB
PULSADOR
	btfsc	PORTA, RA0		; Pregunta si esta en 0 el contador, si no se ha presionado el boton se mantiene de lo contrario brinca la siguiente instruccion
	goto	$-.1			; Retrocedemos al paso anterior a este
	btfss	PORTA, RA0		; Si esta en 1 continua, de lo contario hace la sig. linea
	goto 	$-.1			; Retrocedemos al paso anterior a este
	movf	contador, W		;
	call 	TABLA			; Mandamos a llamar los valores de tabla
	movwf	PORTB			;
	incf	contador, F		;
	movlw	.16				;
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
		