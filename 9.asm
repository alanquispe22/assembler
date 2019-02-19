; Programa que calcula el MCD y MCM de dos numeros decimales (soporta numeros de 8 bits o 1 byte)
mov cont,1 ;inicializar variable cont en 1
bucle: 
 mov ah,0
 mov al,cont
 mov bl,nro1
 div bl
 cmp ah,0 ;si el resto de la division del contador con el nro1 es igual 0
 je parte1 
 bc:
 inc cont ;incrementar el contador
 jmp bucle ;bucle hasta que encuentre el MCM

parte1: ;si nro1 es multiplo del contador
 mov ah,0
 mov al,cont
 mov bl,nro2
 div bl
 cmp ah,0 ;compara si el resto de la division del contador con el nro2 es 0
 je parte2 
 jmp bc ;si el nro2 no es multiplo del contador regresa a bucle1
parte2: ;si el nro1 y el nro2 son multiplos del contador
 mov al,cont
 mov MCM,al ;guarda el MCM
 jmp parte3 ;ir a final

 parte3: ;una vez que tengamos el MCM primero multiplicar nro1 * nro 2
 mov al, nro1 ;con ese resultado, dividir por el MCM de nro1 y nro2 y tenemos el MCD
 mov bl, nro2
 mul bl
 mov bl, MCM
 div bl 
 mov MCD, al 
ret ;fin del programa

cont db 0 ;cont = contador 
MCM db 0 ;en esta variable se guarda el MCM
MCD db 0 ;en esta variable se guarda el MCD
nro1 db 48 ;numero1 decimal
nro2 db 60 ;numero2 decimal