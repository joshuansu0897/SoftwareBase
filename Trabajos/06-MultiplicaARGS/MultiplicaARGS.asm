; mulArgs.asm
; autor:Joshua Saucedo
; fecha:13/mar/2018
; como tomar dos valores de los args y los multplica

; incluyendo nuestras funciones y constantes

%include '../../Utils/funciones_basicas.asm'

section .data
    mensaje db "la multiplicacion es:",0x0 ; mensaje de la multiplicacion

section .text
    GLOBAL _start

_start:
    pop ecx                                ; el primer valor en el stack es el length de los argumentos
    pop eax                                ; basura
    dec ecx                                ; decrementamos por la basura
    mov ebx, 1                             ; movemos 1 a ebx

multiplicar:
    cmp ecx, 0                             ; comparamos con 3
    jz nomasArgs                           ; si es menor a 3 vamos a "nomasArgs"
    pop eax                                ; tomamos el primer numero en los argumentos
    dec ecx                                ; drecrementamos
    call atoi                              ; convertimos la cadena a enteros
    imul ebx                               ; multiplicacion eax = eax * ebx
    mov ebx, eax                           ; movemos el resultado a ebx
    jmp multiplicar                        ; recursivo

nomasArgs:
    mov eax, mensaje                       ; movemos el mensaje a eax
    call sprint                            ; imprimimos el mensaje

    mov eax, ebx                           ; movemos ebx a eax
    call iprintLF                          ; imprimimos el numero

    jmp salida                             ; salimos del programa