name "arreglo-mayor"
org 100h
mov cx, 8 
 bucle1:
 mov c, cx

 mov bx, cx
 mov cx, 9

 bucle2: 
 mov si, cx
 mov ah, v[si-1] 
 cmp ah,v[bx-1]
 jnge seguir ;Si v[8] < v[7] no hacer nada, sino:
 mov dh, v[bx-1] ;Copiar v[7] en dh
 mov dl, v[si-1] ;Copiar v[8] en dl
 mov v[bx-1], dl ;Copiar dl en v[7]
 mov v[si-1], dh ;Copiar dh en v[8] 
 seguir:
 loop bucle2

 mov cx, c
 loop bucle1
ret
v db 2,32,64,32,98,12,5,21,91
c dw 0