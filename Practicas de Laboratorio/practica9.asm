; 9. Realizar un script  para generar un retraso de dos segundos. A partir de este retraso se incrementa un contador de 8 bits que muestra el resultado en el puerto B
__CONFIG _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_OFF & _WDT_OFF & _XT_OSC
__CONFIG _CONFIG2, _WRT_OFF & _BOR21V

LIST P = 16F887           ; Modelo del PIC
#include <P16F887.INC>    ; Librería del PIC

CBLOCK 0X20               ; Declarar Variables
C1                        
C2                        
C3                        
ENDC

ORG 0X00                  ; Vector de Reset

banksel TRISB             ; Acceder al Banco 1
clrf TRISB                ; Habilitar TRISB = Salida
                          
movlw B'000000'            
movwf TRISA
clrf TRISC                
clrf TRISD                          
movlw B'000'
movwf TRISE

banksel PORTB             ; Acceder al Banco 0
clrf PORTB                ; Limpiar PORTB

clrf PORTA                
clrf PORTC                
clrf PORTD                
clrf PORTE                

CONTADOR
	movlw D'0'
	movwf PORTB
	call RETARDO

	movlw D'1'
	movwf PORTB
	call RETARDO

	movlw D'2'
	movwf PORTB
	call RETARDO

	movlw D'3'
	movwf PORTB
	call RETARDO

	movlw D'4'
	movwf PORTB
	call RETARDO

	movlw D'5'
	movwf PORTB
	call RETARDO

	movlw D'6'
	movwf PORTB
	call RETARDO

	movlw D'7'
	movwf PORTB
	call RETARDO

	movlw D'8'
	movwf PORTB
	call RETARDO

	movlw D'9'
	movwf PORTB
	call RETARDO

	movlw D'10'
	movwf PORTB
	call RETARDO

	movlw D'11'
	movwf PORTB
	call RETARDO

	movlw D'12'
	movwf PORTB
	call RETARDO

	movlw D'13'
	movwf PORTB
	call RETARDO

	movlw D'14'
	movwf PORTB
	call RETARDO

	movlw D'15'
	movwf PORTB
	call RETARDO

	movlw D'16'
	movwf PORTB
	call RETARDO

	movlw D'17'
	movwf PORTB
	call RETARDO

	movlw D'18'
	movwf PORTB
	call RETARDO

	movlw D'19'
	movwf PORTB
	call RETARDO

	movlw D'20'
	movwf PORTB
	call RETARDO

	movlw D'21'
	movwf PORTB
	call RETARDO

	movlw D'22'
	movwf PORTB
	call RETARDO

	movlw D'23'
	movwf PORTB
	call RETARDO

	movlw D'24'
	movwf PORTB
	call RETARDO

	movlw D'25'
	movwf PORTB
	call RETARDO

	movlw D'26'
	movwf PORTB
	call RETARDO

	movlw D'27'
	movwf PORTB
	call RETARDO

	movlw D'28'
	movwf PORTB
	call RETARDO

	movlw D'29'
	movwf PORTB
	call RETARDO

	movlw D'30'
	movwf PORTB
	call RETARDO

	movlw D'31'
	movwf PORTB
	call RETARDO

	movlw D'32'
	movwf PORTB
	call RETARDO
	
	movlw D'33'
	movwf PORTB
	call RETARDO

	movlw D'34'
	movwf PORTB
	call RETARDO

	movlw D'35'
	movwf PORTB
	call RETARDO

	movlw D'36'
	movwf PORTB
	call RETARDO

	movlw D'37'
	movwf PORTB
	call RETARDO

	movlw D'38'
	movwf PORTB
	call RETARDO

	movlw D'39'
	movwf PORTB
	call RETARDO

	movlw D'40'
	movwf PORTB
	call RETARDO

	movlw D'41'
	movwf PORTB
	call RETARDO

	movlw D'42'
	movwf PORTB
	call RETARDO

	movlw D'43'
	movwf PORTB
	call RETARDO

	movlw D'44'
	movwf PORTB
	call RETARDO

	movlw D'45'
	movwf PORTB
	call RETARDO

	movlw D'46'
	movwf PORTB
	call RETARDO

	movlw D'47'
	movwf PORTB
	call RETARDO

	movlw D'48'
	movwf PORTB
	call RETARDO

	movlw D'49'
	movwf PORTB
	call RETARDO

	movlw D'50'
	movwf PORTB
	call RETARDO

	movlw D'51'
	movwf PORTB
	call RETARDO

	movlw D'52'
	movwf PORTB
	call RETARDO

	movlw D'53'
	movwf PORTB
	call RETARDO

	movlw D'54'
	movwf PORTB
	call RETARDO

	movlw D'55'
	movwf PORTB
	call RETARDO

	movlw D'56'
	movwf PORTB
	call RETARDO

	movlw D'57'
	movwf PORTB
	call RETARDO

	movlw D'58'
	movwf PORTB
	call RETARDO

	movlw D'59'
	movwf PORTB
	call RETARDO

	movlw D'60'
	movwf PORTB
	call RETARDO

	movlw D'61'
	movwf PORTB
	call RETARDO

	movlw D'62'
	movwf PORTB
	call RETARDO

	movlw D'63'
	movwf PORTB
	call RETARDO

	movlw D'64'
	movwf PORTB
	call RETARDO

	movlw D'65'
	movwf PORTB
	call RETARDO

	movlw D'66'
	movwf PORTB
	call RETARDO

	movlw D'67'
	movwf PORTB
	call RETARDO

	movlw D'68'
	movwf PORTB
	call RETARDO

	movlw D'69'
	movwf PORTB
	call RETARDO

	movlw D'70'
	movwf PORTB
	call RETARDO

	movlw D'71'
	movwf PORTB
	call RETARDO

	movlw D'72'
	movwf PORTB
	call RETARDO

	movlw D'73'
	movwf PORTB
	call RETARDO

	movlw D'74'
	movwf PORTB
	call RETARDO

	movlw D'75'
	movwf PORTB
	call RETARDO

	movlw D'76'
	movwf PORTB
	call RETARDO

	movlw D'77'
	movwf PORTB
	call RETARDO

	movlw D'78'
	movwf PORTB
	call RETARDO

	movlw D'79'
	movwf PORTB
	call RETARDO

	movlw D'80'
	movwf PORTB
	call RETARDO

	movlw D'81'
	movwf PORTB
	call RETARDO

	movlw D'82'
	movwf PORTB
	call RETARDO

	movlw D'83'
	movwf PORTB
	call RETARDO

	movlw D'84'
	movwf PORTB
	call RETARDO

	movlw D'85'
	movwf PORTB
	call RETARDO

	movlw D'86'
	movwf PORTB
	call RETARDO

	movlw D'87'
	movwf PORTB
	call RETARDO

	movlw D'88'
	movwf PORTB
	call RETARDO

	movlw D'89'
	movwf PORTB
	call RETARDO

	movlw D'90'
	movwf PORTB
	call RETARDO

	movlw D'91'
	movwf PORTB
	call RETARDO

	movlw D'92'
	movwf PORTB
	call RETARDO

	movlw D'93'
	movwf PORTB
	call RETARDO

	movlw D'94'
	movwf PORTB
	call RETARDO

	movlw D'95'
	movwf PORTB
	call RETARDO

	movlw D'96'
	movwf PORTB
	call RETARDO

	movlw D'97'
	movwf PORTB
	call RETARDO

	movlw D'98'
	movwf PORTB
	call RETARDO

	movlw D'99'
	movwf PORTB
	call RETARDO

	movlw D'100'
	movwf PORTB
	call RETARDO

	movlw D'101'
	movwf PORTB
	call RETARDO

	movlw D'102'
	movwf PORTB
	call RETARDO

	movlw D'103'
	movwf PORTB
	call RETARDO

	movlw D'104'
	movwf PORTB
	call RETARDO

	movlw D'105'
	movwf PORTB
	call RETARDO

	movlw D'106'
	movwf PORTB
	call RETARDO

	movlw D'107'
	movwf PORTB
	call RETARDO

	movlw D'108'
	movwf PORTB
	call RETARDO

	movlw D'109'
	movwf PORTB
	call RETARDO

	movlw D'110'
	movwf PORTB
	call RETARDO

	movlw D'111'
	movwf PORTB
	call RETARDO

	movlw D'112'
	movwf PORTB
	call RETARDO

	movlw D'113'
	movwf PORTB
	call RETARDO

	movlw D'114'
	movwf PORTB
	call RETARDO

	movlw D'115'
	movwf PORTB
	call RETARDO

	movlw D'116'
	movwf PORTB
	call RETARDO

	movlw D'117'
	movwf PORTB
	call RETARDO

	movlw D'118'
	movwf PORTB
	call RETARDO

	movlw D'119'
	movwf PORTB
	call RETARDO

	movlw D'120'
	movwf PORTB
	call RETARDO

	movlw D'121'
	movwf PORTB
	call RETARDO

	movlw D'122'
	movwf PORTB
	call RETARDO

	movlw D'123'
	movwf PORTB
	call RETARDO

	movlw D'124'
	movwf PORTB
	call RETARDO

	movlw D'125'
	movwf PORTB
	call RETARDO

	movlw D'126'
	movwf PORTB
	call RETARDO

	movlw D'127'
	movwf PORTB
	call RETARDO

	movlw D'128'
	movwf PORTB
	call RETARDO

	movlw D'129'
	movwf PORTB
	call RETARDO

	movlw D'130'
	movwf PORTB
	call RETARDO

	movlw D'131'
	movwf PORTB
	call RETARDO

	movlw D'132'
	movwf PORTB
	call RETARDO

	movlw D'133'
	movwf PORTB
	call RETARDO

	movlw D'134'
	movwf PORTB
	call RETARDO

	movlw D'135'
	movwf PORTB
	call RETARDO

	movlw D'136'
	movwf PORTB
	call RETARDO

	movlw D'137'
	movwf PORTB
	call RETARDO

	movlw D'138'
	movwf PORTB
	call RETARDO

	movlw D'139'
	movwf PORTB
	call RETARDO

	movlw D'140'
	movwf PORTB
	call RETARDO

	movlw D'141'
	movwf PORTB
	call RETARDO

	movlw D'142'
	movwf PORTB
	call RETARDO

	movlw D'143'
	movwf PORTB
	call RETARDO

	movlw D'144'
	movwf PORTB
	call RETARDO

	movlw D'145'
	movwf PORTB
	call RETARDO

	movlw D'146'
	movwf PORTB
	call RETARDO

	movlw D'147'
	movwf PORTB
	call RETARDO

	movlw D'148'
	movwf PORTB
	call RETARDO

	movlw D'149'
	movwf PORTB
	call RETARDO

	movlw D'150'
	movwf PORTB
	call RETARDO

	movlw D'151'
	movwf PORTB
	call RETARDO

	movlw D'152'
	movwf PORTB
	call RETARDO

	movlw D'153'
	movwf PORTB
	call RETARDO

	movlw D'154'
	movwf PORTB
	call RETARDO

	movlw D'155'
	movwf PORTB
	call RETARDO

	movlw D'156'
	movwf PORTB
	call RETARDO

	movlw D'157'
	movwf PORTB
	call RETARDO

	movlw D'158'
	movwf PORTB
	call RETARDO

	movlw D'159'
	movwf PORTB
	call RETARDO

	movlw D'160'
	movwf PORTB
	call RETARDO

	movlw D'161'
	movwf PORTB
	call RETARDO

	movlw D'162'
	movwf PORTB
	call RETARDO

	movlw D'163'
	movwf PORTB
	call RETARDO

	movlw D'164'
	movwf PORTB
	call RETARDO

	movlw D'165'
	movwf PORTB
	call RETARDO

	movlw D'166'
	movwf PORTB
	call RETARDO

	movlw D'167'
	movwf PORTB
	call RETARDO

	movlw D'168'
	movwf PORTB
	call RETARDO

	movlw D'169'
	movwf PORTB
	call RETARDO

	movlw D'170'
	movwf PORTB
	call RETARDO

	movlw D'171'
	movwf PORTB
	call RETARDO

	movlw D'172'
	movwf PORTB
	call RETARDO

	movlw D'173'
	movwf PORTB
	call RETARDO

	movlw D'174'
	movwf PORTB
	call RETARDO

	movlw D'175'
	movwf PORTB
	call RETARDO

	movlw D'176'
	movwf PORTB
	call RETARDO

	movlw D'177'
	movwf PORTB
	call RETARDO

	movlw D'178'
	movwf PORTB
	call RETARDO

	movlw D'179'
	movwf PORTB
	call RETARDO

	movlw D'180'
	movwf PORTB
	call RETARDO

	movlw D'181'
	movwf PORTB
	call RETARDO

	movlw D'182'
	movwf PORTB
	call RETARDO

	movlw D'183'
	movwf PORTB
	call RETARDO

	movlw D'184'
	movwf PORTB
	call RETARDO

	movlw D'185'
	movwf PORTB
	call RETARDO

	movlw D'186'
	movwf PORTB
	call RETARDO

	movlw D'187'
	movwf PORTB
	call RETARDO

	movlw D'188'
	movwf PORTB
	call RETARDO

	movlw D'189'
	movwf PORTB
	call RETARDO

	movlw D'190'
	movwf PORTB
	call RETARDO

	movlw D'191'
	movwf PORTB
	call RETARDO

	movlw D'192'
	movwf PORTB
	call RETARDO

	movlw D'193'
	movwf PORTB
	call RETARDO

	movlw D'194'
	movwf PORTB
	call RETARDO

	movlw D'195'
	movwf PORTB
	call RETARDO

	movlw D'196'
	movwf PORTB
	call RETARDO

	movlw D'197'
	movwf PORTB
	call RETARDO

	movlw D'198'
	movwf PORTB
	call RETARDO

	movlw D'199'
	movwf PORTB
	call RETARDO

	movlw D'200'
	movwf PORTB
	call RETARDO

	movlw D'201'
	movwf PORTB
	call RETARDO

	movlw D'202'
	movwf PORTB
	call RETARDO

	movlw D'203'
	movwf PORTB
	call RETARDO

	movlw D'204'
	movwf PORTB
	call RETARDO

	movlw D'205'
	movwf PORTB
	call RETARDO

	movlw D'206'
	movwf PORTB
	call RETARDO

	movlw D'207'
	movwf PORTB
	call RETARDO

	movlw D'208'
	movwf PORTB
	call RETARDO

	movlw D'209'
	movwf PORTB
	call RETARDO

	movlw D'210'
	movwf PORTB
	call RETARDO

	movlw D'211'
	movwf PORTB
	call RETARDO

	movlw D'212'
	movwf PORTB
	call RETARDO

	movlw D'213'
	movwf PORTB
	call RETARDO

	movlw D'214'
	movwf PORTB
	call RETARDO

	movlw D'215'
	movwf PORTB
	call RETARDO

	movlw D'216'
	movwf PORTB
	call RETARDO

	movlw D'217'
	movwf PORTB
	call RETARDO

	movlw D'218'
	movwf PORTB
	call RETARDO

	movlw D'219'
	movwf PORTB
	call RETARDO

	movlw D'220'
	movwf PORTB
	call RETARDO

	movlw D'221'
	movwf PORTB
	call RETARDO

	movlw D'222'
	movwf PORTB
	call RETARDO

	movlw D'223'
	movwf PORTB
	call RETARDO

	movlw D'224'
	movwf PORTB
	call RETARDO

	movlw D'225'
	movwf PORTB
	call RETARDO

	movlw D'226'
	movwf PORTB
	call RETARDO

	movlw D'227'
	movwf PORTB
	call RETARDO

	movlw D'228'
	movwf PORTB
	call RETARDO

	movlw D'229'
	movwf PORTB
	call RETARDO

	movlw D'230'
	movwf PORTB
	call RETARDO

	movlw D'231'
	movwf PORTB
	call RETARDO

	movlw D'232'
	movwf PORTB
	call RETARDO

	movlw D'233'
	movwf PORTB
	call RETARDO

	movlw D'234'
	movwf PORTB
	call RETARDO

	movlw D'235'
	movwf PORTB
	call RETARDO

	movlw D'236'
	movwf PORTB
	call RETARDO

	movlw D'237'
	movwf PORTB
	call RETARDO

	movlw D'238'
	movwf PORTB
	call RETARDO

	movlw D'239'
	movwf PORTB
	call RETARDO

	movlw D'240'
	movwf PORTB
	call RETARDO

	movlw D'241'
	movwf PORTB
	call RETARDO

	movlw D'242'
	movwf PORTB
	call RETARDO

	movlw D'243'
	movwf PORTB
	call RETARDO

	movlw D'244'
	movwf PORTB
	call RETARDO

	movlw D'245'
	movwf PORTB
	call RETARDO

	movlw D'246'
	movwf PORTB
	call RETARDO

	movlw D'247'
	movwf PORTB
	call RETARDO

	movlw D'248'
	movwf PORTB
	call RETARDO

	movlw D'249'
	movwf PORTB
	call RETARDO

	movlw D'250'
	movwf PORTB
	call RETARDO

	movlw D'251'
	movwf PORTB
	call RETARDO

	movlw D'252'
	movwf PORTB
	call RETARDO

	movlw D'253'
	movwf PORTB
	call RETARDO

	movlw D'254'
	movwf PORTB
	call RETARDO

	movlw D'255'
	movwf PORTB
	call RETARDO

	goto CONTADOR

RETARDO                   ; Duración de 2 Segundos
	movlw D'20' 
	movwf C3              ; C3 = 20
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