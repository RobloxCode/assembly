.stack 100h

.data
    ; 00000000 00000000'\0'
    num_dec dw 19
    bin_str_rep db 16 dup(?), 0

.code
    mov ax, @data
    mov ds, ax

    mov ax, num_dec
    call to_binary

    mov ah, 4ch
    int 21h

; AX = number in decimal to convert to binary
; OUTPUT, the result will be stored at bin_str_rep
to_binary proc
    lea bx, bin_str_rep
    mov si, 15
    mov cx, 2

    conversion_loop:
        cmp si, -1
        jl exit

        xor dx, dx
        div cx
        add dl, '0'
        mov [bx + si], dl

        dec si
        cmp si, 0
        jne conversion_loop

    exit:
        ret
to_binary endp
