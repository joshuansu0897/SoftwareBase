; Suma.asm
; autor:Joshua Saucedo
; fecha:8/mar/2018
; Suma de dos numeros

; incluyendo nuestras funciones y constantes
%include "../../Utils/funciones_basicas.asm"

section .data
    a db "4"                      ; primer operador
    b db "3"                      ; segundo operador
    mensaje db "la suma es: ",0x0 ; mensaje de la suma
    len equ $ - mensaje           ; longitud del mensaje
    vac db " ",0xA,0x0            ; renglon vacio
    lv equ $ -vac                 ; longitud renglon vacio

segment .bss
    sum resb 1

section .text
    GLOBAL _start

_start:                           ; tell linker entry point
  mov eax, [a]                    ; carga el primer operador
  sub eax, '0'                    ; resta el caracter '0'

  mov ebx, [b]                    ; carga el segundo operador al registro B
  sub ebx, '0'                    ; resta el caracter '0'

  add eax, ebx                    ; suma los numeros
  add eax, '0'                    ; agrega el caracter '0'
  mov [sum], eax                  ; transfiere el acumulador a memoria

  mov ecx, mensaje                ; despliega el mensaje "la suma es:"
  mov edx, len
  mov ebx, sys_exit               ; file descriptor (stdout)
  mov eax, sys_write              ; system call number (SYS_WRITE)
  int 0x80                        ; call 0x80

  mov ecx, sum                    ; despliega el resultado del computo
  mov edx, sys_exit
  mov ebx, sys_exit               ; file descriptor (stdout)
  mov eax, sys_write              ; system call number (SYS_WRITE)
  int 0x80                        ; call 0x80

  mov ecx, vac                    ; renglon vacio
  mov edx, lv                     ; longitud renglon vacio
  mov ebx, sys_exit               ; stdout
  mov eax, sys_write              ; SYS_WRITE
  int 0x80                        ; llamar a 0x80

  jmp salida                      ; salida del sistema