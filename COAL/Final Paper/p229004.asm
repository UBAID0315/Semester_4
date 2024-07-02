; Roll_No: 22P-9004 ( Ubaid-ur-Rehman )

[org 0x100]

jmp start

operand1: dw 10
operand2: dw 20

greator_than_equal_to:
                push ax
                mov ax,[bp+4]
                cmp [bp+2],ax
                
                jge skip             ; use for comparsion of greator/above or equal to


less_than_equal_to:
                push ax
                mov ax,[bp+4]
                cmp [bp+2],ax
                
                jbe skip             ; use for comparsion of less/below or equal to

                pop ax              ; the above line can't set the flag in my case that's why i add this
                ret


equality:
        push ax
        mov ax,[bp+4]
        cmp [bp+2],ax
        
        je  skip                      ; use for comparsion of equal to
        
        

skip:
    pop ax
    ret

start:
    mov ax,[operand1]
    push ax
    mov ax,[operand2]
    push ax
    
    push bp
    mov bp,sp

    call greator_than_equal_to
    call less_than_equal_to
    call equality

    pop bp                          ; pop the previous stored value of bp

    mov ax,0x4c00
    int 0x21
