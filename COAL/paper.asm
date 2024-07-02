[org 0x0100]

mov bx, num1
mov cl, 8       ; Number of elements in num1 (7 elements but we start from 0)
mov al, 0       ; Initialize sum to 0

loop_start:
    add al, [bx] ; Add the value at memory location pointed by bx to al
    add bl, 2    ; Move to the next byte (8 bits)
    sub cl, 1    ; Decrement loop counter
    jnz loop_start

mov ax, 0x4c00
int 0x21

num1: db 15,20,25,30,35,45,50
total: db 0      ; Define total as a byte (8 bits) to hold the sum

