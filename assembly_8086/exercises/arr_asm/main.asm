.stack 100h

.data
    nums dw 1, 2, 3
    len dw 3

.code
    mov ax, @data
    mov ds, ax

    lea bx, nums
    mov cx, len
    call _print_arr

    mov ah, 4ch
    int 21h

; Parameters BX = arr offset, CX = len
_print_arr proc
    xor si, si

    print_loop:
        cmp si, cx
        jge exit_loop

        mov di, si
        shl di, 1
        mov ax, [bx + di]

        add ax, '0'
        mov ah, 0eh
        int 10h

        inc si
        jmp print_loop

    exit_loop:
        ret
_print_arr endp

; Parameters BX = arr offset, CX = len
_add_arr_elements proc

_add_arr_elements endp
