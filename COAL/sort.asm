[org 0x100]

jmp start

data: dw 2,1,4,5,3

start:
    mov cx,5

    outerloop:
        mov bx,0
        
        innerloop:
            mov ax,[data+bx]
            cmp ax,[data+bx+2]

            jbe noswap
                mov dx,ax                   ;dx = 4
                mov ax,[data+bx+2]
                mov [data+bx+2],dx
                mov [data+bx],ax
        
        noswap:
            add bx,2
            cmp bx,8
            jne innerloop
    
    sub cx,1
    jnz outerloop

mov ax,0x4c00
int 0x21