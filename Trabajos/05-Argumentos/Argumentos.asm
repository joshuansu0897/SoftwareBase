; SumaARGS.asm
; autor:Joshua Saucedo
; fecha:13/mar/2018
; como tomar valores de parametros

; incluyendo nuestras funciones y constantes

%include '../../Utils/funciones_basicas.asm'

section .text
    GLOBAL _start

_start:
    pop ecx       ; el primer valor en el stack es el de argumentos

sigArgs:
    cmp ecx, 0h   ; comparamos con 0
    jz nomasArgs  ; si es 0 vamos a "nomasArgs"
    pop eax       ; tomamos el siguiente argumento
    call sprintLF ; imprimimos el argumento
    dec ecx       ; decrementamos ecx que son los argumentos
    jmp sigArgs   ; recursivo

nomasArgs:
    jmp salida    ; salimos del programa