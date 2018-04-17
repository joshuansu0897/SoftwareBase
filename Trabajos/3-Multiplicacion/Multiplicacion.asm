; Suma.asm
; autor:Joshua Saucedo
; fecha:8/mar/2018
; Suma de dos numeros

; incluyendo nuestras funciones y constantes
%include "../../Utils/funciones_basicas.asm"

section .data
    num1 db "10",0x0                       ; numero entero
    num2 db "3",0x0                        ; segundo operador
    mensaje db "la multiplicacion es:",0x0 ; mensaje de la multiplicacion

section .text
    GLOBAL _start

_start:
    mov eax, num1                          ; movemos 'a' a eax
    call atoi                              ; convertimos a entero

    push eax                               ; guardamos el numero

    mov eax, num2                          ; movemos 'b' a eax
    call atoi                              ; convertimos a entero

    pop ebx                                ; sacamos el numero guardado
    imul ebx                               ; multiplicamos eax = eax * ebx

    push eax                               ; guardamos el RESULTADO

    mov eax, mensaje                       ; movemos el mensaje a eax
    call sprint                            ; imprimimos el mensaje
    
    pop eax                                ; sacamos el valor del stack
    call iprintLF                          ; imprimimos el numero

    jmp salida                             ; salida del sistema