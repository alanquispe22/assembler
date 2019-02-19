data segment
Mensaje db "HOLA MUNDO$";
ends

stack segment
    dw 128 dup(0)
ends

code segment
start:
    mov ax, data
    mov ds, ax
    mov es, ax
    
lea dx, Mensaje
mov ah, 9
int 21h

mov ax, 4c00h
int 21h
end start