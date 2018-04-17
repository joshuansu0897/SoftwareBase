; captura_nombre.asm
; autor: Federico Cirett
; Fecha: 16/abr/2017

%include '../../Utils/funciones_basicas.asm'

section .data
    pregunta_nombre db "¿Cómo te llamas? ",0x0
    pregunta_edad db "¿Cuál es tu edad? ",0x0

segment .bss
    Buffer_nombre resb 20
    Buffer_nombre_len equ $-Buffer_nombre

    Buffer_edad resb 4
    Buffer_edad_len equ $-Buffer_edad

    nombre resb 20
    edad resb 4

section .text
    global _start:

_start:
    mov eax, pregunta_nombre   ; preparamos para imprimir la pregunta
    call sprint                ; mandamos a imprimir
    mov ecx, Buffer_nombre     ; direccion de Buffer a ecx
    mov edx, Buffer_nombre_len ; longitud del Buffer_len a edx
    call LeerTexto             ; llamamos la funcion LeerTexto

    mov eax, pregunta_edad     ; preparamos para preguntar
    call sprint
    mov ecx, Buffer_edad       ; direccion de Buffer a ecx
    mov edx, Buffer_edad_len   ; longitud del Buffer_len a edx
    call LeerTexto             ; llamamos la funcion LeerTexto
    mov eax, Buffer_edad       ; preparamos para convertir edad
    call atoi                  ; convertimos
    mov [edad],eax             ; guardamos numero entero en edad|

    mov eax, Buffer_nombre     ; preparamos para imprimir nombre
    call sprintLF              ; imprimimos
    mov eax, [edad]            ; preparamos para imprimir edad
    call iprintLF              ; imprimimos enteros

    call quit                  ; salida!

LeerTexto:
    mov ebx, stdin
    mov eax, sys_read
    int 80H
    ret