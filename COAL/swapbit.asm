[org 0x100]

jmp start
value1: dw 3
value2: dw 4

start:
    mov ah, [value1]
    mov al, [value2]
    mov bx,4     
    higher_loop:
        mov cl,1
        rol ah,cl
        rol al,cl
        dec bx
        jnz higher_loop

    mov ax, 0x4c00     
    int 0x21           
