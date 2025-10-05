.stack 100h

.data
    arr dw 1, 2, 3, 4, 5, 6

.code
    mov ax, @data
    mov s, ax

    mov si, offset arr
    mov bx, 6
    call _print_arr

    mov ax, 4c00h
    int 21h

; Parameters: SI = array offset, BX = length
_print_arr proc
    xor cx, cx
    print_loop:
        cmp cx, bx
        jge exit

        mov ah, 2
        mov di, si
        add di, cx
        mov dl, [di]
        add dl, '0'
        int 21h

        inc cx
        jmp print_loop
    exit:
        ret
_print_arr endp

