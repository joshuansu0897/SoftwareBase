; Suma3.asm
; autor:Joshua Saucedo
; fecha:12/mar/2018
; Suma de dos numeros y una cadena de numeros

; incluyendo nuestras funciones y constantes

%include '../funciones_basicas.asm'

section .data
    numero1 DD 543       ; numero entero
    cadena1 DB "789",0x0 ; cadena de numeros
    numero2 DD 898       ; numero entero

section .bss
    sum resb 4           ; reservamos 4 bytes

section .text
    GLOBAL _start        ; punte de inicio

_start:
    mov eax, cadena1     ; cadena a conversion
    call atoi            ; convertimos la cadena a enteros
    mov [sum], eax       ; guardamos en la suma el numero convertido
    mov ebx, [numero1]   ; cargamos el numero en ebx
    add eax, ebx         ; sumamos eax y ebx y se guarda en eax
    mov ebx, [numero2]   ; guardamos el numero 2 en abx
    add eax, ebx         ; sumamos eax y ebx y se guarda en eax
    call iprintLF        ; imprimimos el resultado
    jmp finalizar        ; salimos de la aplicacion