; Mayor.asm
; autor:Joshua Saucedo
; fecha:8/mar/2018
; Regresa el numero mayor

; incluyendo nuestras funciones y constantes
%include '../../Utils/funciones_basicas.asm'

section .data
    mensaje db "el Numero mayor es:",0x0 ; mensaje de la multiplicacion

section .text
    GLOBAL _start

_start:
    pop ecx                              ; el primer valor en el stack es el de argumentos
    cmp ecx, 3                           ; comparamos con 3
    jl nomasArgs                         ; si es menor a 3 vamos a "nomasArgs"
    pop eax                              ; quitamos la basura inicial
    dec ecx                              ; restamos por el quitado de basura
    pop eax                              ; sacamos el primer numero de los argumentos
    call atoi                            ; convertimos el primero numero a numero
    mov ebx, eax                         ; movemos el valor de eax a ebx
    dec ecx                              ; decrementamos ecx por el pop de arriba

sigArg:
    cmp ecx, 0h                          ; comparamos con 0
    jz nomasArgs                         ; si es 0 vamos a "nomasArgs"
    pop eax                              ; tomamos el primer numero del argumento
    dec ecx                              ; decrementamos ecx
    call atoi                            ; convertimos la cadena a enteros
    call numeroMayor                     ; llamamo la funcion "numeroMayor" si eax es mayor que ebx el valor se mueve a ebx
    jmp sigArg                           ; recursivo

nomasArgs:
    mov eax, mensaje                       ; movemos el mensaje a eax
    call sprint                            ; imprimimos el mensaje

    mov eax, ebx                         ; movemos el valor de ebx a eax
    call iprintLF                        ; imprimimos el valor de eax

    jmp salida                           ; salimos del programa