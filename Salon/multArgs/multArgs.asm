; SumaARGS.asm
; autor:Joshua Saucedo
; fecha:13/mar/2018
; como tomar valores de y los multiplica

; incluyendo nuestras funciones y constantes

%include '../funciones_basicas.asm'

section .text
    GLOBAL _start

_start:
    pop ecx       ; el primer valor en el stack es el length de los argumentos

sigArgs:
    cmp ecx, 0h   ; comparamos con 0
    jz nomasArgs  ; si es 0 vamos a "nomasArgs"
    pop eax       ; tomamos el siguiente argumento
    call atoi     ; convertimos la cadena a enteros
    mov ebx, eax  ; movemos el resultado de eax a ebx
    dec ecx       ; decrementamos ecx que son los argumentos
    pop eax       ; tomamos el siguiente argumento
    call atoi     ; convertimos la cadena a enteros
    mov ecx, eax  ; movemos el resultado de eax a ecx
    mul ecx       ; multiplicacion
    call iprintLF ; impirmimmos

nomasArgs:
    jmp salida    ; salimos del programa