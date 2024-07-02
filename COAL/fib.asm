[org 0x0100]

jmp start

    fibonacci:
        push bp
        mov bp,sp
        sub sp,2
        
        mov ax,[bp+4]

        cmp ax,1
        jbe base_case
    
        sub ax,1
        push ax
    
        call fibonacci
    
        add sp,2
        mov [bp-2],ax    
        mov ax,[bp+4]
        sub ax,2
        push ax

        call fibonacci
        
        add sp,2
        add ax,[bp-2]

        jmp fib_end


    base_case:
        cmp ax,1
        je fib_one
        mov ax,0
        jmp fib_end
    
    fib_one:
        mov ax,1
    
    fib_end:
        mov sp,bp
        pop bp 
        ret
    
    start: 
        mov ax,5
        push ax
        call fibonacci
        add sp,2
        mov bx,ax
        
        mov ax,0x4c00
        int 0x21