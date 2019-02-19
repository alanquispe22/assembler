 ;leida N desde teclado
; serien 2,5,2,8,2,11,2,14
SALTO_LINEA MACRO
        PUSH AX
        PUSH DX
        mov dl, 0dh
        mov ah, 02h
        int 21h
        ; salto de linea
        mov dl, 0ah
        mov ah, 02h
        int 21h
        POP DX
        POP AX

ENDM
espacioElineas MACRO cad2
        push ax
        push dx
        lea dx,cad2
        mov ah,09h
        int 21h
        pop dx
        pop ax   
ENDM

MOSTRAR_NUMERO MACRO num
    PUSH AX
    PUSH DX
    mov dl,num
    add dl,30h
    mov ah,02h
    int 21h
    POP DX
    POP AX 
    
ENDM     

imprimirNnum MACRO numm,uni,dece
        push ax
        push dx
        mov al,numm
        aam
        mov uni,al
        mov dece,ah
        ;Imprimos los tres valores empezando por decenas y unidades.
        mov ah,02h
        mov dl,dece
        add dl,30h
        int 21h
        mov dl,uni
        add dl,30h
        int 21h
        ;Termina programa
        pop dx
        pop ax
ENDM  

MOSTRAR_CADENA MACRO cad
    PUSH AX
    PUSH DX
    LEA DX,cad
    MOV AH,09H
    INT 21H
    POP DX
    POP AX 
ENDM



data segment
    sw db 00h
    NN db 0 ;tamno n
    dig db 0
    aa db 0 ;unidad
    bb db 0 ;decena 
    impares db 02h
    espacio db " $"
    men1 db "INGRESE N = $"
   

ends

stack segment
    dw   128  dup(0)
ends

code segment 
    
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
   
    MOSTRAR_CADENA men1 ;men1 = ingrese n:
    
    ;LEEMOS N-------------------------------------------------------
    bucle:
      call LEER ; en dig esta el numero ascii
      cmp dig,0Dh
      je salir2 ;salta si es igual a 0Dh
      sub dig, 30h
      mov al,1010b
      mul NN
      add al,dig
      mov NN,al  ; en NN esta el numero fromado
    jmp bucle 
    
    salir2:
    ;-------------------------------------------------------
    SALTO_LINEA
   
    add NN,01h ;le sumamos una unidad al numero
    mov cl,00h   ; si es i=0 -- i<n=3
      
   
    fori:
        cmp cl,NN ; n=3 -- i<n
        jge endfori
     
        mov ch,00h; di es 'j' ->j=0
        forj:
            cmp ch,cl  ;m=3   -- j<m
            jge endforj
            ;-------------------------------------------------------
                cmp sw,00h
                je sw0
                jne sw1
                  sw0:
                   
                   
                    MOSTRAR_NUMERO 02h
                    mov sw,01h
                    espacioElineas espacio
                    jmp salir
                  sw1:
                   
                    add impares,03h
                    imprimirNnum impares,aa,bb
                    espacioElineas espacio
                    mov sw,00h
                   
                  salir:
            
           
            ;-------------------------------------------------------
            
            inc ch   ;j++
        jmp forj
          
           endforj:;por falso si ponemos esto fuera de exit
                   ; se repetira innitamente
           inc cl
    jmp fori
    endfori:;por falso si ponemos esto fuera de exit
            ; se repetira innitamente
   
    ;exit
    mov ax, 4c00h ; exit to operating system.
    int 21h  
    
    ;------------------------------********************----------------
    LEER:
      mov ah, 01h
      int 21h
      mov dig,al
    ret 

     
   
ends

end start ; set entry point and stop the assembler.