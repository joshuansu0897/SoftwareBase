; DosCadenas.asm
; autor:Joshua Saucedo
; fecha:28/feb/2018
; Es un programa que imprime dos cadenas

section .data
    mensaje DB 'Hello World!',0xA,0x0
    longitud EQU $ - mensaje
    mensajeSegundo DB 'Es la segunda cadena',0xA,0x0
    longitudSegundo EQU $ - mensajeSegundo

section .text
    GLOBAL _start            ; declaramos punto de inicio
_start:
    mov ECX, mensaje         ; cargamos la direccion del mensaje a imprimir
    mov EDX, longitud        ; longitud del mensaje
    mov EBX, 1               ; salida estandar (STDOUT)
    mov EAX, 4               ; SYS_WRITE
    int 0x80                 ; llamamos al kernel
    mov ECX, mensajeSegundo  ; cargamos el segundo mensaje
    mov EDX, longitudSegundo ; longitud del segundo mensaje
    mov EBX, 1               ; salida estandar (STDOUT)
    mov EAX, 4               ; SYS_WRITE
    int 0x80                 ; llamamos al kernel
    mov EAX, 1               ; SYS_EXIT
    int 0x80                 ; llamada al sistema