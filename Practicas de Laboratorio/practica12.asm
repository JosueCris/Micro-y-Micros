; 12. Utilizar el ADC del PIC para convertir un voltaje en el canal 1, a un valor de 8 bits en el puerto D.
__CONFIG _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_OFF & _WDT_OFF & _XT_OSC
__CONFIG _CONFIG2, _WRT_OFF & _BOR21V

LIST P = 16F887           ; Modelo del PIC
#include <P16F887.INC>    ; Librería del PIC

Principal
	ORG 0X0000                   ; Vector de Reset

;acceso a los bancos

	banksel	TRISD
	clrf	TRISD
	movlw	b'00001100'
	movlw	TRISA
	banksel	ANSEL
	movlw	b'00001100'
	movwf	ANSEL
	clrf	ANSELH
	banksel	ADCON1
	bsf		ADCON1, ADFM
	bcf		ADCON1, VCFG1
	bsf		ADCON1, VCFG0
	banksel	ADCON0
	movlw	b'00001001'
	movwf	ADCON0
 
loop
	banksel	ADCON0
	btfsc	ADCON0, 1
	goto loop

	banksel	ADRESL
	movf	ADRESL, W
	banksel	PORTD
	movwf	PORTD
	bsf		ADCON0, 1
	goto loop
	end

