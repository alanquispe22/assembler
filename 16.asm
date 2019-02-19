org 100h

mov cx, 09
lea si, name1
lea di, name2
b20:
mov al,[si]
mov [di],al
inc si
inc di
dec cx
jnz b20 ; Contador diferente de sero? Si, iterar
ret

name1 db 'hola mundo'
name2 db 'hello world'