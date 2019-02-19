org 100h

;Procedimiento principal
main proc near
    call b10clr ;Limpiar la pantalla
    call c10set ;Fijar Cursor
    call d10disp;Exhibir caracteres
    mov ah,01
    int 21h
    ret
main endp

;---------Despejar la pantalla----------
b10clr proc near
    mov ax, 0600h   ;Recorrer toda la pantalla
    mov bh,71h       ;Atributo: blanco sobre negro
    mov cx,0000     ;posicion izquierda superior
    mov dx,184fh    ;posicion derecha inferior
    int 10h
    ret
b10clr endp                             

;-------Fijar el cursor en 00,00:------
c10set proc near
    mov ah,02h  ;Peticion de fijar el cursor
    mov bh,00   ;Pagina No 0
    mov dx,0000 ;Hilera 0, columna 0
    int 10h
    ret
c10set endp

;-----Exhibir caracteres ASCII----
d10disp proc
    mov cx,256
    lea dx, char
d20:  
    cmp char,08h
    jb d30
    cmp char,0dh
    jbe d40
d30:
    mov ah,09
    int 21h
d40:
    inc char
    loop d20
    ret
d10disp endp
        
char db 00,'$'
