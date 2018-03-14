; mulArgs.asm
; autor:Joshua Saucedo
; fecha:13/mar/2018
; como tomar dos valores de los args y los multplica

; incluyendo nuestras funciones y constantes

%include '../funciones_basicas.asm'

section .text
    GLOBAL _start

_start:
    pop ecx       ; el primer valor en el stack es el length de los argumentos

multiplicar:
    cmp ecx, 3    ; comparamos con 3
    jl nomasArgs  ; si es menor a 3 vamos a "nomasArgs"
    pop eax       ; tomamos el siguiente argumento que es el path
    pop eax       ; tomamos el primer numero en los argumentos
    call atoi     ; convertimos la cadena a enteros
    mov ecx, eax  ; movemos el valor de eax a ecx
    pop eax       ; tomamos el segundo numero en los argumentos
    call atoi     ; convertimos la cadena a enteros
    mul ecx       ; multiplicacion eax = eax * ecx
    call iprintLF ; impirmimmos

nomasArgs:
    jmp salida    ; salimos del programa