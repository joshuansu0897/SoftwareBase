; TresCadenas.asm
; autor:Joshua Saucedo
; fecha:1/mar/2018
; Es un programa que imprime tres cadenas

; esta es la forma para 64 bits y como me gusta, este usare de aqui en adelante

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
    mov rcx, mensaje         ; cargamos la direccion del mensaje a imprimir
    mov rdx, longitud        ; longitud del mensaje
    mov rbx, 1               ; salida estandar (STDOUT)
    mov rax, 4               ; SYS_WRITE
    int 0x80                 ; llamamos al kernel
    mov rcx, mensajeSegundo  ; cargamos el segundo mensaje
    mov rdx, longitudSegundo ; longitud del segundo mensaje
    mov rbx, 1               ; salida estandar (STDOUT)
    mov rax, 4               ; SYS_WRITE
    int 0x80                 ; llamamos al kernel
    mov rcx, mensajeTres     ; cargamos el tercer mensaje
    mov rdx, longitudTres    ; longitud del tercer mensaje
    mov rbx, 1               ; salida estandar (STDOUT)
    mov rax, 4               ; SYS_WRITE
    int 0x80                 ; llamamos al kernel
    mov rax, 1               ; SYS_EXIT
    int 0x80                 ; llamada al sistema