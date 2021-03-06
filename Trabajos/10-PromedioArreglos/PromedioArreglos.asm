; PromedioArreglos.asm

%include '../../Utils/funciones_basicas.asm'

section .data
  msgPromedio   DB  'Promedio:',0

segment .bss
    arreglo_enteros  resb 200 ; 50 casillas de 4 bytes c/u

section .text
    global _start:

_start:                       ; BLOQUE INICIAL: Revisamos si hay suficientes argumentos
    pop ecx                   ; obtenemos el numero de argumentos
    cmp ecx,2                 ; comparamos si es menor a 2
    jl salir                  ; salimos si es menor a 2

    pop eax                   ; BLOQUE de INICIALIZACION obtenemos nombre de programa
    dec ecx                   ; restamos 1 al numero de argumentos
    mov edx, 0                ; ponemos en 0 EDX
    mov esi,arreglo_enteros   ; la direccion de 'array' a ESI


ciclo:                        ; CICLO DE EXTRACCION DE ARGUMENTOS
    pop eax                   ; sacamos direccion de argumento del stack
    call atoi                 ; lo convertimos a entero de 4 bytes
    mov [esi+edx*4],eax       ; lo guardamos en array
    inc edx                   ; incrementamos el indice del array
    dec ecx                   ; decrementamos numero de argumentos por procesar
    cmp ecx,0                 ; preguntamos si ya no tenemos argumentos
    jne ciclo                 ; ciclar en caso de que si existan argumentos

ciclo_impresion:              ; CICLO DE IMPRESION
    mov eax, [esi+ecx*4]      ; traemos de array numero a imprimir
    add ebx, eax              ; sumamos los valores a esp
    inc ecx                   ; incrementamos indice de array
    dec edx                   ; decrementamos contador
    cmp edx,0                 ; llegamos a 0?
    jne ciclo_impresion       ; ciclar en caso de no llegar a cero

    mov eax, ebx              ; movemos el valor de eso a eax
    mov ebx, ecx              ; movemos la cantidad de numeros a ebx

promedio:
    push eax                  ; guardamos el valor en el stack
    mov eax, msgPromedio      ; movemos el mensaje a eax
    call sprint               ; mandamos a llamar al "metodo" que imprime
    pop eax                   ; sacamos del stack el valor que tenia eax
    div ebx                   ; dividimos ebx entre eax y resultado va a eax
    call iprintLF             ; imprimimos el resultado

salir:
    jmp quit
