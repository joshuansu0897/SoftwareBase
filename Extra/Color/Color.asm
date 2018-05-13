%include "../../Utils/funciones_basicas.asm"

section .data
    mensaje DB 'Hello World!',0xA,0x0

    setcolor db 1Bh, '[31;1m', 0  ; color verde
        .len equ $ - setcolor

    normal db 1Bh, '[0;0m', 0  ; regresa a la normalidad
        .len equ $ - normal

section .text
    global _start
_start:
    mov eax, mensaje
    call sprintLF

    mov eax, mensaje
    call sprintLF

    mov eax, 4
    mov ebx, 1
    mov ecx, setcolor
    mov edx, setcolor.len
    int 80h

    mov eax, mensaje
    call sprintLF

    mov eax, mensaje
    call sprintLF

    mov eax, 4
    mov ebx, 1
    mov ecx, normal
    mov edx, normal.len
    int 80h

    mov eax, mensaje
    call sprintLF

    mov eax, mensaje
    call sprintLF

    mov eax, 1
    xor ebx, ebx
    int 80h