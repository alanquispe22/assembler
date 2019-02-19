org 100h

; Imprimimos mensaje en pantalla
lea dx, msgi
mov ah, 9
int 21h 

;Ingresa numero por teclado en al
mov ah,01
int 21h                    

;lee su asci pero lo convertimos en nro
sub al,30h  
mov cl, al

; imprimimos caracteres de nueva linea y
; retorno de carro
mov ah,02
mov dx, 000ah
int 21h
mov dx, 000dh
int 21h
mov bx,0000

two: push cx
inc bx
mov cx, bx
mov dx, 0030h
one:
inc dx
mov ah,02
int 21h
loop one
mov ah,02
mov dx, 000ah
int 21h
mov dx, 000dh
int 21h
pop cx
loop two

;Termina el programa
lea dx, presiona
mov ah,09
int 21h

;espera a que se presione tecla
mov ah, 1
int 21h
ret

; Definicion de datos
presiona db "Presiona una tecla para terminar...$" 
msgi db "Ingrese un numero del 1 al 9: ",10,13,"$"
