org 100h
mov si, 0 ;ponemos si en 0
comienzo:
cmp msg[si],"$" ;si es el fin de la cadena mandar a final
jz resultado

 mov di, 0 ;poner en 0 di
 comprobar:
 mov al, msg2[di] ;copiar msg2 con su posicion a al
 cmp msg[si], al ;comparar msg con su posicion con al
 jz seguir ;si se encuentra entonces continua

 inc di ;incrementar di para seguir recorriendo cadena
cmp msg2[di], "$" ;si es que llega al final y no encontro coincidencia, entonces ya termina el programa
 jz final 

 loop comprobar ;bucle para recorrer

seguir: 
inc si ;para seguir recorriendo la palabra
loop comienzo ;bucle principal para recorrer palabra
resultado:
mov dx, offset msg3 ;copiar msg3 a dx
mov ah, 9 ;preparar ah con 9 para la interrupcion 21h
int 21h ;mostrar contenido en dx
final:
ret
msg db "casa$" 
msg2 db "escaso$" ;msg debe estar en msg2
msg3 db "Si se encuentran todos los caracteres$"