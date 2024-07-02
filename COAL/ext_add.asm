[org 0x0100]

jmp start

;------------ Extended Addition -----------------------
;dest: dw 4000
;src: dw 8000

;start:

;mov al,[src]
;add byte[dest],al

;mov al,[src+1]
;adc byte[dest+1],al

;mov ax,0x4c00
;int 0x21
;------------- Extended Multiplication ----------------

multiplicand: dw 200
multiplier: db 50
result: dw 0

start:
    mov cl,8
    mov dl,[multiplier]

    checkbit:
        shr dl,1
        jnc skip

        mov al,[multiplicand]
        add byte[result],al

        mov al,[multiplicand+1]
        adc byte[result+1],al

    skip:
        shl byte[multiplicand],1
        rcl byte[multiplicand+1],1

        dec cl
        jnz checkbit
