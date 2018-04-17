%include '../../Utils/funciones_basicas.asm'

segment .bss
    buffer  resb 1024
    len     equ  1024
    file    resb    4
    filelen resb    4

section .text
    global _start:

_start:
    pop ecx                               ; vemos los argumentos del sistema operativo extraemos el numero de argumentos
    pop eax                               ; extraemos el nombre del programa
    dec ecx                               ; restamos 1 al contador de argumentos
    pop ebx                               ; abre archivo ; extraemos el nombre del archivo a leer
    mov eax, sys_open                     ; operacion: abrir el archivo
    mov ecx, 0                            ; 0_RDONLY (solo lectura)
    int 80h

    cmp eax, 0                            ; si File handler es mayor a 0 (si no mal)
    jle error

    mov ebx, eax                          ; lee archivo ;pasamos el file handler de eax a EBX
    mov eax, sys_read                     ; operacion lectura
    mov ecx, buffer                       ; direccion de buffer de lectura
    mov edx, len                          ; cantidad de bytes a Leer
    int 80h

    mov eax, sys_close                    ; cerrar archivo
    int 80h

    mov eax, buffer                       ; imprime buffer
    call sprintLF

    call quit                             ; salir

error:
    mov ebx, eax
    mov eax, sys_exit
    int 80h