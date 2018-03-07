; funcones.asm
; autor:Joshua Saucedo
; fecha:7/mar/2018
; son las funciones utlizadas en el semestre


sprintLF:                   ; imprime cadanas de texto con una nueva linea (LF o LineFeed)
    call sprint             ; llama e imprime el mensaje
    push rax                ; guardamos rax, vamos a utlizarlo en esta funcion
    mov rax, 0xA            ; hexadecimal para caracter de lineaFeed
    push rax                ; guardamos 0xA en el stack
    mov rax, rsp            ; movemos lo que apunta a rsp a rax
    call sprint             ; imprimimos el LP
    pop rax                 ; recuperamos el caracter 0xA
    pop rax                 ; recuperamos el valor original de rax
    ret                     ; regresamos

sprint:
    push rdx                ; guardamos rdx
    push rcx                ; guardamos rcx
    push rbx                ; guardamos rbx
    push rax                ; guardamos rax
    call strlen             ; mandamos a llamar al "metodo" que nos da el tamanio de la cadena
    mov rdx, rax            ; longitud del mensaje a rdx
    pop rax                 ; sacamos el valor de rax
    mov rcx, rax            ; movemos el mensaje a rcx
    mov rax, 4              ; sys_write
    mov rbx, 1              ; sys_out
    int 0x80                ; llamada al kernel
    pop rbx                 ; sacamos el valor de rbx
    pop rcx                 ; sacamos el valor de rcx
    pop rdx                 ; sacamos el valor de rdx
    ret                     ; el return, para regresar en la continuacion del codigo de donde fue invocado

strlen:
    push rbx                ; guardamos el valor de rbx
    mov rbx, rax            ; movemos lo de rax a rbx

sigcar:
    cmp byte[rax], 0        ; comparacion para saber si ya contamos todo
    jz finalizar            ; si es 0 vamos a finalizar
    inc rax                 ; si no es 0 incrementa rax
    jmp sigcar              ; y saltamos otra vez a sigcar, para que se ejecute todo otra vez

finalizar:
    sub rax, rbx            ; restamos la direcciones de memoria y se guarda en rax
    pop rbx                 ; sacamos el valor de rbx
    ret                     ; el return, para regresar en la continuacion del codigo de donde fue invocado

salida:                     ; funcion para terminar de ejecutar el codigo
    mov rax, 1              ; SYS_EXIT
    int 0x80                ; llamada al sistema