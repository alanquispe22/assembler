org 100h
mov si, 0 ;ponemos si en 0

comienzo: 
mov al, msg2[0] ;copiar la primera letra de la palabra a al
cmp msg[si],"$" ;si es el fin de la cadena mandar a final
jz final
cmp msg[si], al ;comparar si encuentra la primera letra de la cadena
jne seguir

 mov di, 1 ;poner en 1 di
 comprobar:
 mov al, msg2[di]
 mov bx, di
 cmp msg[si+bx], al ;posicion de la letra coincidente + di, comparar con la cadena
 jne seguir ;si no coincide mandar a seguir

 inc di ;incrementar di para seguir recorriendo cadena 

 cmp msg2[di],"$" ;si es el fin de la cadena y el programa llego aca quiere decir que la cadena es parte de la palabra
 jz resultado 

 loop comprobar ;bucle para recorrer cadena 

seguir: 
inc si ;para seguir recorriendo la palabra
loop comienzo ;bucle principal para recorrer palabra 

resultado:
mov dx, offset msg3 ;copiar msg3 a dx
mov ah, 9 ;preparar ah con 9 para la interrupcion 21h
int 21h ;mostrar contenido en dx  

final:
ret
msg db "Hermosa programacion de todos los tiempos$" 
msg2 db "tiem$" 
msg3 db "Si es subcadena$"