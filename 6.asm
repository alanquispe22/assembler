org 100h ; inicio de programa
include 'emu8086.inc' ;Incluye funciones de libreria emu8086 
; DEFINE_SCAN_NUM
; DEFINE_PRINT_STRING
 DEFINE_PRINT_NUM
 DEFINE_PRINT_NUM_UNS
mov si, 0
mov al, 0
;Convertir primera cadena a numero
 cadAnum:
cmp cad1[si], "$"
 jz seguir

 mov bl, 10 
 mul bl
sub cad1[si], '0' 
 add al, cad1[si]

 inc si
loop cadAnum

seguir:
mov aux1, al
;Convertir segunda cadena a numero
mov si, 0
mov al, 0
cadAnum2:
cmp cad3[si], "$"
 jz seguir2

 mov bl, 10 
 mul bl
sub cad3[si], '0' 
 add al, cad3[si]

 inc si
loop cadAnum2

seguir2:
mov bl, al 
mov al, aux1
;realizar operaciones normalmente teniendo ya los dos numeros decimales
cmp cad2, "-"
jz resta 
cmp cad2, "+"
jz suma 
cmp cad2, "*"
jz multi 
cmp cad2, "/"
jz divi
resta: 
sub al, bl
jmp fin
suma: 
add al, bl
jmp fin
multi: 
mul bl
jmp fin
divi: 
div bl
jmp fin

fin:
mov bx, ax
mov ah,09 
lea dx,msg
int 21h 
mov ax, bx
call PRINT_NUM
ret
cad1 db "329$"
cad2 db "-"
cad3 db "21$"
aux1 db ?
aux2 dw ?
msg dw "El resultado es: $"