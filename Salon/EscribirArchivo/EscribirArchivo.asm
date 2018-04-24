%include '../../Utils/funciones_basicas.asm'

segment .bss
    buffer_alumno RESB 30                    ; buffer para alumno
    len_alumno EQU $-buffer_alumno           ; lent del buffer

    filename RESB 30                         ; buffer para filename
    len_filename EQU $-filename              ; lent del filename

    archivo RESB 30

section .data
    p_nombre DB "Nombre del alumno:",0x0     ; mensaje alumnos
    p_archivo DB "Nombre del archivo:",0x0   ; mensaje archivo

section .text
    global _start

_start:
    mov eax, p_nombre                        ; preguntamos por el nombre del alumno
    call sprint                              ; imprime el mensaje

    mov ecx, buffer_alumno                   ; captura en el buffer del alumno
    mov edx, len_alumno                      ; con longitud maxima de len_alumno
    call LeerTexto                           ; input desde el teclado

    mov eax, p_archivo                       ; pregunta por nombre de archivo a guardar
    call sprint                              ; imprime mensaje

    mov ecx, filename                        ; captura filename
    mov edx, len_filename                    ; con longitud maxima de len:filename

    call LeerTexto                           ; input desde el teclado

    mov esi, archivo                         ; copia hasta archivo
    mov eax, filename                        ; desde filename
    call copystring                          ; pero sin el caracter 0xA

    mov eax, sys_creat                       ; sys_creat EQU 8
    mov ebx, archivo                         ; nombre del archivo
    mov ecx, 664o                            ; los permisos

    int 0x80                                 ; llamada al kernel

    cmp eax, 0
    jle error                                ; si es 0 o menos error al abrir

    mov eax, sys_open                        ; abrir archivo
    mov ebx, archivo                         ; nombre del archivo que esta en la var archivo
    mov ecx, O_RDWR                          ; abrimos en modo de lectura y escritura
    int 0x80                                 ; ejecutar
    cmp eax, 0
    jle error                                ; si es 0 o menos error

    mov ebx, eax                             ; file hanldre to ebx

    mov eax, sys_write
    mov ecx, buffer_alumno
    mov edx, len_alumno
    int 0x80
    mov eax, sys_sync                        ; sincroniza discos (forzar escritura)
    int 0x80

    mov eax, sys_close                       ; close file
    int 0x80

    jmp quit
