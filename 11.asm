name "archivo3"
org 100h
 mov al, 0 ;modo de acceso para abrir arhivo, modo lectura/escritura
 mov dx, offset archivo ;offset lugar de memoria donde esta la variable
 mov ah, 3dh ;se intenta abrir el archivo
 int 21h ;llamada a la interrupcion DOS
 jc error ; si se prendio la bandera c ir a error

 mov handle, ax ;si no paso mover a lo que le dio el SO
 jmp leer

 error:
 ; ....

 ;leer archivo 
 leer:
 mov bx, handle
 mov cx, 1
 mov dx, offset leido
 mov ah, 3fh
 int 21h

 cmp ax, 0 ;ax queda en 0 cuando llega a EOF
 jz FIN ;si es 0 entonces va a fin para cerrar archivo 

 ;Detectar palabras que terminan con a
 mov dl, leido[0]

 cmp dl, " " ;comparar si es espacio
 jz mostrar ;si es espacio entonces ir a mostrar

 jmp abajo ;si no es espacio entonces ir a abajo

 mostrar:
 cmp aux, "a" ;compara si el anterior es a
 jnz abajo

 inc cont ;si es a entonces incrementar contador

 abajo:
 mov aux, dl ;guardar en aux lo que hay en dl para comparar en la proxima vuelta
 jmp leer

FIN: 

 ;cerramos archivo
 mov bx, handle
 mov ah, 3eh
 int 21h

 ret 

archivo db "C:\prueba.txt", 0 ;ascii del nombre del archivo 
leido db "$"
handle dw ? ;identificador del arhivo 
aux db "$"
cont db 0