[org 0x0100]

mov ax,0
mov bx,2

jump:
mov cx,150

add_loop:
add ax,1
sub cx,1
jnz add_loop

sub bx,1
jnz jump

mov ax,0x4c00
int 0x21
