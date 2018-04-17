; DosCadenas.asm
; autor:Joshua Saucedo
; fecha:28/feb/2018
; Es un programa que imprime dos cadenas

; este tiene la forma que ami me gusta en 32 bits

section .data
    mensaje DB 'Hello World!',0xA,0x0
    longitud EQU $ - mensaje
    mensajeSegundo DB 'Es la segunda cadena',0xA,0x0
    longitudSegundo EQU $ - mensajeSegundo

section .text
    GLOBAL _start            ; declaramos punto de inicio
_start:
    mov ecx, mensaje         ; cargamos la direccion del mensaje a imprimir
    mov edx, longitud        ; longitud del mensaje
    mov ebx, 1               ; salida estandar (STDOUT)
    mov eax, 4               ; SYS_WRITE
    int 0x80                 ; llamamos al kernel
    mov ecx, mensajeSegundo  ; cargamos el segundo mensaje
    mov edx, longitudSegundo ; longitud del segundo mensaje
    mov ebx, 1               ; salida estandar (STDOUT)
    mov eax, 4               ; SYS_WRITE
    int 0x80                 ; llamamos al kernel
    mov eax, 1               ; SYS_EXIT
    int 0x80                 ; llamada al sistema