; Mayor.asm
; autor:Joshua Saucedo
; fecha:8/mar/2018
; Regresa el numero mayor

; incluyendo nuestras funciones y constantes
%include '../funciones_basicas.asm'

section .text
    GLOBAL _start

_start:
    pop ecx         ; el primer valor en el stack es el de argumentos
    cmp ecx, 3      ; comparamos con 3
    jl nomasArgs    ; si es menor a 3 vamos a "nomasArgs"
    pop eax         ; quitamos la basura inicial
    dec ecx         ; restamos por el quitado de basura
    pop eax         ; sacamos el primer numero de los argumentos
    call atoi       ; convertimos el primero numero a numero

setearDatos:
    mov ebx, eax    ; movemos el valor de eax a ebx
    dec ecx         ; decrementamos ecx por el pop de arriba

numeroMayor:
    cmp ecx, 0h     ; comparamos con 0
    jz nomasArgs    ; si es 0 vamos a "nomasArgs"
    pop eax         ; tomamos el primer numero del argumento
    call atoi       ; convertimos la cadena a enteros
    cmp eax, ebx    ; comparamos eax con ebx
    jg setearDatos  ; vamos a "setearDatos"
    dec ecx         ; decrementamos ecx
    jmp numeroMayor ; recursivo

nomasArgs:
    mov eax, ebx    ; movemos el valor de ebx a eax
    call iprintLF   ; imprimimos el valor de eax
    jmp salida      ; salimos del programa