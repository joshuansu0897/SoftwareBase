; ArreglosCuadrados.asm

%include '../../Utils/funciones_basicas.asm'

section .data
  msgArr   DB  '---Arreglo---',0

segment .bss
    arreglo_enteros  resb 200 ; 50 casillas de 4 bytes c/u
    arreglo_sqt  resb 200     ; 50 casillas de 4 bytes c/u

section .text
    global _start:

_start:                       ; BLOQUE INICIAL: Revisamos si hay suficientes argumentos
    pop ecx                   ; obtenemos el numero de argumentos
    cmp ecx,2                 ; comparamos si es menor a 2
    jl salir                  ; salimos si es menor a 2

    pop eax                   ; BLOQUE de INICIALIZACION obtenemos nombre de programa
    dec ecx                   ; restamos 1 al numero de argumentos
    mov ebx, 0                ; ponemos en 0 ebx
    mov esi,arreglo_enteros   ; la direccion de 'array' a ESI

ciclo:                        ; CICLO DE EXTRACCION DE ARGUMENTOS
    pop eax                   ; sacamos direccion de argumento del stack
    call atoi                 ; lo convertimos a entero de 4 bytes
    mov [esi+ebx*4],eax       ; lo guardamos en array
    inc ebx                   ; incrementamos el indice del array
    dec ecx                   ; decrementamos numero de argumentos por procesar
    cmp ecx,0                 ; preguntamos si ya no tenemos argumentos
    jne ciclo                 ; ciclar en caso de que si existan argumentos

    mov esp, arreglo_sqt      ; movemos arregl_sqt a esp
    mov eax, msgArr           ; movemos el mensaje a eax
    call sprintLF             ; mandamos a llamar al "metodo" que imprime

ciclo_impresion:              ; CICLO DE IMPRESION
    mov eax, [esi+ecx*4]      ; traemos de array numero a imprimir
    call iprintLF             ; imprimimos numero
    imul eax                  ; segun yo multiplica eax por eax y queda el resultado en eax
    mov [esp+ecx*4],eax       ; movemos el valor al arreglo_sqt
    inc ecx                   ; incrementamos indice de array
    dec ebx                   ; decrementamos contador
    cmp ebx,0                 ; llegamos a 0?
    jne ciclo_impresion       ; ciclar en caso de no llegar a cero

    mov eax, msgArr           ; movemos el mensaje a eax
    call sprintLF             ; mandamos a llamar al "metodo" que imprime

ciclo_impresion2:             ; CICLO DE IMPRESION
    mov eax, [esp+ebx*4]      ; traemos de array numero a imprimir
    call iprintLF             ; imprimimos numero
    inc ebx                   ; incrementamos indice de array
    dec ecx                   ; decrementamos contador
    cmp ecx,0                 ; llegamos a 0?
    jne ciclo_impresion2      ; ciclar en caso de no llegar a cero

salir:
    jmp quit
