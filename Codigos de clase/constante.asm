;;script para cargar una constante y mostrarla en el puerto B
;;
;;libreria pic 16f887

; PALABRA DE CONFIGURACION

__CONFIG _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_ON & _BOR_ON & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & _XT_OSC
__CONFIG _CONFIG2, _WRT_OFF & _BOR40V

LIST p =16F887			;informacion de la libreria
#include<p16F887.INC>

;Vectores de reset e inicio

ORG	0X00	;
ORG	0X04	;

Inicio
	banksel	TRISB		;pasamos del banco 0 al banco 1
	clrf	TRISB		;el puerto se configura como salida
	banksel	PORTB		;pasamos del banco 1 al banco 0
	movlw	b'10101111'	;se carga una literal al registro W
	movwf	PORTB		;el valor de W se muestra en el puerto B
	end	

