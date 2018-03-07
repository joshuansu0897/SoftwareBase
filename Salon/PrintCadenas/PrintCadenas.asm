; PrintCadenas.asm
; autor:Joshua Saucedo
; fecha:5/mar/2018
; Es un programa que imprime Cadenas de texto

%include "../Funciones/funciones.asm"

section .data
    mensaje DB 'Hello World!',0xA,0x0
    mensajeSegundo DB 'Es la segunda cadena',0
    mensajeTres DB 'Es la tercera cadena',0xA,0

section .text
    GLOBAL _start           ; declaramos el punto de inicio
_start:
    mov rax, mensaje        ; cargamos el primer mensaje
    call sprint             ; mandamos a llamar al "metodo" que imprime
    mov rax, mensajeSegundo ; cargamos el segundo mensaje
    call sprint             ; mandamos a llamar al "metodo" que imprime
    mov rax, mensajeTres    ; cargamos el tercer mensaje
    call sprint             ; mandamos a llamar al "metodo" que imprime
    jmp salida              ; salida del sistema
