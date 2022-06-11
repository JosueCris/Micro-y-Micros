
LIST p=16F84A
#include P16F84A.inc
__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC

ORG 0X04	;

PSEUDOCODIGO
	bsf		STATUS, 6		;
	clrf	TRISB			;
	movlw	0x07			;
	movwf	OPTION_REG		;
	bcf		STATUS, 6		;
	
;;;;

PRINCIPAL
	btfss	PORTB, 7		;
	goto	LED				;
	bcf		PORTB, 7		;
	bcf		INTCON, 2		;
	retfie					;
	
LED
	bsf		PORTB, 7		;
	bcf		INTCON, 2		;
	retfie					;
	
	movlw	0XA0			;
	movwf	INTCON			;
	clrf	PORTB			;
	
	movlw	0XD0			;
	movwf	TMR0			;
	btfsc	TMR0, 7			;
	goto	$-1				;
	goto	$-4				;	
end							;