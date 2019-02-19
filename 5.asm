org 100h ; inicio de programa
mov si, 0
mov al, 0

 cadAnum:
cmp cad[si], "$"
 jz seguir

 mov bl, 10 
 mul bl
sub cad[si], '0' 
 add al, cad[si]

 inc si
loop cadAnum

seguir:
mov cx, si 
mov si, 0
mov bl, 8
pasar: 
 div bl ;dividir al con bl
 mov oct[si], ah ;copiar a la cadena oct el resultado sobrante de la division
 inc si ;incrementar si
 loop pasar
fina:
cmp ah, 0
jnz final
mov oct[si], al
final:
;mov dx, offset res
;mov ah, 9 ;preparar ah con 9 para la interrupcion 21h
;int 21h ;mostrar contenido en dx
ret
cad db "64$"
oct db 0