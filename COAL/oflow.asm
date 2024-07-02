[org 0x0100]

mov   al, 127
add   al, 127
std
mov  ax,0x4c00
int 0x21
