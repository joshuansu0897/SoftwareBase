; Mayor.asm
; autor:Joshua Saucedo
; fecha:2/abr/2018
; los parametros los mete en un array

; incluyendo nuestras funciones y constantes
%include '../funciones_basicas.asm'

segment .bss
    array resb 2000

section .text
    GLOBAL _start

_start:
    pop ecx               ; el primer valor en el stack es el de argumentos
    cmp ecx, 3            ; comparamos con 3
    jl nomasArgs          ; si es menor a 3 vamos a "nomasArgs"
    pop eax               ; quitamos la basura inicial
    dec ecx               ; restamos por el quitado de basura
    mov esi, array        ; movemos el array a esi
    mov eax, 0            ; seteamos el valor de eax en 0

sigArg:
    cmp ecx, 0h           ; comparamos con 0
    jz ciclo_impresion    ; si es 0 vamos a "ciclo_impresion"
    pop ebx               ; tomamos el primer numero del argumento
    dec ecx               ; decrementamos ecx

ciclo:
    cmp byte[ebx+edx],0   ; comparamos el valor con 0
    jz sigArg             ; en caso que sea cero vamos al sigArg
    mov al, byte[ebx+edx] ; movemos la letra a al
    mov [esi+edx],al      ; tomamos el tama;o base del array y le sumamos el contador y en esa posicion moveremos al
    inc edx               ; incrementamos el contador
    jmp ciclo             ; siguiente letra de la palabra

ciclo_impresion:          ; CICLO DE IMPRESION
  mov eax, [esi+edx]      ; traemos de array a imprimir
  call sprint             ; imprimimos
  dec edx                 ; decrementamos contador
  cmp edx,0               ; llegamos a 0?
  jne ciclo_impresion     ; ciclar en caso de no llegar a cero

nomasArgs:
    jmp salida            ; salimos del programa