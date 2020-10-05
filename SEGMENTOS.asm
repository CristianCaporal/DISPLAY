PROCESSOR 16F887
#include <xc.inc>
;CONFIG word1
CONFIG FOSC = INTRC_NOCLKOUT
CONFIG WDTE = OFF
CONFIG PWRTE = ON
CONFIG MCLRE = OFF
CONFIG CP = OFF
CONFIG CPD = OFF
CONFIG BOREN = OFF
CONFIG IESO = OFF
CONFIG FCMEN = ON
CONFIG DEBUG = ON
;CONFIG 1
CONFIG BOR4V=BOR40V
CONFIG WRT = OFF
PSECT udata
retraso1:
    DS 1
retraso2:
    DS 1
retraso3:
    DS 1
PSECT resetVec,class=CODE,delta=2
resetVec:
PAGESEL main
goto main
    
PSECT code
num0:
BANKSEL PORTB
movlw 0b00111111
movwf PORTB
PAGESEL main
return

PSECT code
num1:
BANKSEL PORTB
movlw 0b00000110
movwf PORTB
PAGESEL main
return

PSECT code
num2:
BANKSEL PORTB
movlw 0b01011011
movwf PORTB
PAGESEL main
return
    
PSECT code
num3:
BANKSEL PORTB
movlw 0b01001111
movwf PORTB
PAGESEL main
return    

PSECT code
num4:
BANKSEL PORTB
movlw 0b01100110
movwf PORTB
PAGESEL main
return

PSECT code
num5:
BANKSEL PORTB
movlw 0b01101101
movwf PORTB
PAGESEL main
return
   
PSECT code
num6:
BANKSEL PORTB
movlw 0b01111101
movwf PORTB
PAGESEL main
return

PSECT code
num7:
BANKSEL PORTB
movlw 0b00000111
movwf PORTB
PAGESEL main
return

PSECT code
num8:
BANKSEL PORTB
movlw 0b01111111
movwf PORTB
PAGESEL main
return

PSECT code
num9:
BANKSEL PORTB
movlw 0b01101111
movwf PORTB
PAGESEL main
return

PSECT code
delay_255us:
movlw   255
movwf   retraso3
decfsz retraso3
goto $-1
return

PSECT code
delay_65ms:
movlw   255
movwf   retraso2
call delay_255us
decfsz retraso2
goto $-2
return
 
PSECT code
delay_500ms:
movlw   0x08
movwf retraso1
call delay_65ms
decfsz  retraso1
goto $-2
return
   
PSECT code
main:
bcf STATUS,0
bcf STATUS,5
bcf STATUS,6
BANKSEL ANSELH
CLRF ANSELH
BANKSEL TRISB
MOVLW 0b00000000
MOVWF TRISB
BANKSEL PORTB
CLRF PORTB
BANKSEL OSCCON
MOVLW  0b01110000
MOVWF  OSCCON
INICIO:
call num0
call delay_500ms
call num1
call delay_500ms
call num2
call delay_500ms   
call num3
call delay_500ms
call num4
call delay_500ms
call num5
call delay_500ms
call num6
call delay_500ms
call num7
call delay_500ms
call num8
call delay_500ms
call num9
call delay_500ms
GOTO INICIO
END