; SPrint.asm
; autor:Joshua Saucedo
; fecha:5/mar/2018
; Es un programa que imprime Cadenas de texto

section .data
    mensaje DB 'Hello World!',0xA,0x0
    mensajeSegundo DB 'Es la segunda cadena',0xA,0x0
    mensajeTres DB 'Es la tercera cadena',0xA,0x0

section .text
    GLOBAL _start           ; declaramos el punto de inicio
_start:
    mov rax, mensaje        ; cargamos el primer mensaje
    call sprint
    mov rax, mensajeSegundo ; cargamos el segundo mensaje
    call sprint
    mov rax, mensajeTres    ; cargamos el tercer mensaje
    call sprint
    mov rax, 1              ; SYS_EXIT
    int 0x80                ; llamada al sistema

sprint:
    push rdx                ; guardamos rdx
    push rcx                ; guardamos rcx
    push rbx                ; guardamos rbx
    push rax                ; guardamos rax
    call strlen
    mov rdx, rax            ; longitud del mensaje a rdx
    pop rax
    mov rcx, rax            ; movemos el mensaje a rcx
    mov rax, 4              ; sys_write
    mov rbx, 1              ; sys_out
    int 0x80
    pop rbx
    pop rcx
    pop rdx
    ret

strlen:
    push rbx                ; guardamos el valor de rbx
    mov rbx, rax            ; movemos lo de rax a rbx

sigcar:
    cmp byte[rax], 0        ; comparacion para saber si ya contamos todo
    jz finalizar            ; si es 0 vamos a finalizar
    inc rax                 ; si no es 0 incrementa rax
    jmp sigcar              ; y saltamos otra vez a sigcar, para que se ejecute todo otra vez

finalizar:
    sub rax, rbx            ; restamos la direcciones de memoria
    pop rbx
    ret