[org 0x0100]

mov ax, [num1]  
mov cx, 2

main_loop:
    mov bx,130
    inner_loop:
    	add ax, 1  
    	sub bx, 1
    	jnz inner_loop
    	
    	cmp bx,0
    	je main_loop
    	
   
mov ax, 0x4c00  
int 0x21        

num1: dw 0     

