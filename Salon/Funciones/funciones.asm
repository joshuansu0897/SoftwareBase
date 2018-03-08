; funcones.asm
; autor:Joshua Saucedo
; fecha:7/mar/2018
; son las funciones y constantes utlizadas en el semestre

; constantes para saber a que equivalen
sys_out   equ 1
sys_write equ 4
kernel    equ 0x80     ; tambien se puede poner 80h

sprintLF:              ; imprime cadanas de texto con una nueva linea (LF o LineFeed)
    call sprint        ; llama e imprime el mensaje
    push eax           ; guardamos eax, vamos a utlizarlo en esta funcion
    mov eax, 0xA       ; hexadecimal para caracter de lineaFeed
    push eax           ; guardamos 0xA en el stack
    mov eax, esp       ; movemos lo que apunta a esp a eax
    call sprint        ; imprimimos el LP
    pop eax            ; recuperamos el caracter 0xA
    pop eax            ; recuperamos el valor original de eax
    ret                ; regresamos

sprint:
    push edx           ; guardamos edx
    push ecx           ; guardamos ecx
    push ebx           ; guardamos ebx
    push eax           ; guardamos eax
    call strlen        ; mandamos a llamar al "metodo" que nos da el tamanio de la cadena
    mov edx, eax       ; longitud del mensaje a edx
    pop eax            ; sacamos el valor de eax
    mov ecx, eax       ; movemos el mensaje a ecx
    mov eax, sys_write ; sys_write
    mov ebx, sys_out   ; sys_out
    int kernel         ; llamada al kernel
    pop ebx            ; sacamos el valor de ebx
    pop ecx            ; sacamos el valor de ecx
    pop edx            ; sacamos el valor de edx
    ret                ; el return, para regresar en la continuacion del codigo de donde fue invocado

strlen:
    push ebx           ; guardamos el valor de ebx
    mov ebx, eax       ; movemos lo de eax a ebx

sigcar:
    cmp byte[eax], 0   ; comparacion para saber si ya contamos todo
    jz finalizar       ; si es 0 vamos a finalizar
    inc eax            ; si no es 0 incrementa eax
    jmp sigcar         ; y saltamos otra vez a sigcar, para que se ejecute todo otra vez

finalizar:
    sub eax, ebx       ; restamos la direcciones de memoria y se guarda en eax
    pop ebx            ; sacamos el valor de ebx
    ret                ; el return, para regresar en la continuacion del codigo de donde fue invocado

salida:                ; funcion para terminar de ejecutar el codigo
    mov eax, sys_out   ; SYS_EXIT
    int kernel         ; llamada al sistema