[org 0x100]

jmp start

operand dw 10
result dw 0

start:
    mov ax, [operand]
    mov cx, ax

    cmp cx, 0
    je fib_zero

    cmp cx, 1
    je fib_one

    mov ax, 0
    mov bx, 1
    mov dx, 2

fib_loop:
    cmp dx, cx
    jae fib_done

    mov si, bx        
    add bx, ax        
    mov ax, si        
    inc dx
    jmp fib_loop

fib_one:
    mov word[result], 1
    jmp fib_end

fib_zero:
    mov word[result], 0
    jmp fib_end

fib_done:
    mov word[result], bx

fib_end:
    mov ax, 0x4c00
    int 0x21