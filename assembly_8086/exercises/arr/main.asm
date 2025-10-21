.stack 100h

.data
    arr db 1, 2, 3, 4, 5
    len dw 5

.code
    mov ax, @data
    mov ds, ax

    lea bx, arr
    mov cx, len
    call print_byte_arr

    lea bx, arr
    mov cx, len
    call sum_byte_arr

    mov ah, 4ch
    int 21h

; BX = array offset, CX = len
print_byte_arr proc
    mov si, 0

    loop:
        cmp si, cx
        jge exit

        mov al, [bx + si]

        inc si
        add al, '0'
        mov ah, 0eh
        int 10h

        jmp loop

    exit:
        ret
print_byte_arr endp

; Params BX = offset of arr, CX = len
; Return AL = result of all the numbers added
sum_byte_arr proc
    mov ax, 0
    mov si, 0

    loop:
        cmp si, cx
        jge exit

        add ax, [bx + si]
        inc si

        jmp loop

    exit:
        ret
sum_byte_arr endp
