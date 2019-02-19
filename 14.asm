org 100h

; Imprimimos mensaje en pantalla
lea dx, msgi
mov ah,09h
int 21h
                                
;Ingresa numero por teclado en al                               
mov ah,01h
int 21h

;de ASCII a numero
sub al,30h
mov cl, al

;Imprime retorno carro y new line
mov ah,02h
mov dx,10
int 21h
mov dx,13
int 21h    
mov bx, 0
ini: 
push cx
inc bx
mov cx, bx 
mov di,61h 
two:    
mov ah,02
mov dx,di
int 21h 
inc di
loop two
;new line and retorn
mov dx,0dh
int 21h
mov dx,0ah
int 21h
pop cx
loop ini 

;fin del programa
lea dx, pres
mov ah, 9h
int 21h

;espera un caracter
mov ah,01h
int 21h    
ret


pres db 10,13,"Presiona cualquier...$"
msgi db "Ingresa un numero del 1 al 9: ",10,13,"$"
