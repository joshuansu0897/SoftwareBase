; TresCadenas.asm
; autor:Joshua Saucedo
; fecha:1/mar/2018
; Es un programa que imprime tres cadenas

section .data
    mensaje DB 'Hello World!',0xA,0x0
    longitud EQU $ - mensaje
    mensajeSegundo DB 'Es la segunda cadena',0xA,0x0
    longitudSegundo EQU $ - mensajeSegundo
    mensajeTres DB 'Es la tercera cadena',0xA,0x0
    longitudTres EQU $ - mensajeTres

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
    mov ECX, mensajeTres     ; cargamos el tercer mensaje
    mov EDX, longitudTres    ; longitud del tercer mensaje
    mov EBX, 1               ; salida estandar (STDOUT)
    mov EAX, 4               ; SYS_WRITE
    int 0x80                 ; llamamos al kernel
    mov EAX, 1               ; SYS_EXIT
    int 0x80                 ; llamada al sistema