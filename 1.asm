org 100h 

comienzo: 
mov si, x
mov al, msg2[si]
cmp msg[si], al ;comparar letra por letra las cadenas, si uno no coincide manda directamente a fin y termina el programa
jne fin:
cmp msg[si], "$" ;si es el final y el programa llega aca, quiere decir que son iguales
jz final:
inc x
loop comienzo 

final:
mov dx, offset msg3 
mov ah, 9
int 21h 
mov ah,1
int 21h
ret

fin:
mov dx, offset msg4
mov ah, 9
int 21h
mov ah, 1
int 21h
ret    

msg db "world $" 
msg2 db "world $" 
msg3 db "Son iguales $" 
msg4 db "No son iguales $"
x dw 0