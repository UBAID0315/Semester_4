[org 0x0100]

;mov ah,[num]
;mov [num+1],ah
;mov cx,0
;mov ch,255
;myloop:
;    add [num+1],ah
;    sub ch,1
;    jnz myloop

;mov ch,45
;againloop:
;    add [num+1],ah
;    sub ch,1
;    jnz againloop

;mov ax,0x4c00
;int 0x21

;num: db 1,0


mov ax,3
mov bx,5

sub ax,bx

mov ax,0x4c00
int 0x21