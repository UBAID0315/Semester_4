[org 0x100]

jmp start

multiplicand: db 13
multiplier: db 4
result:db 0

start:
mov cl,4
mov al,[multiplicand]
mov bl,[multiplier]

checkbit:
shr bl,1
jnc skip
add [result],al
skip:
shl al,1
dec cl
jnz checkbit

mov ax,0x4c00
int 0x21
    