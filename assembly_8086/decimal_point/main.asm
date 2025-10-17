.stack 100h

.data
    num_str db '13$'
    num_int dw 13

    div_res db ?
    div_rem db ?

.code
    mov ax, @data
    mov ds, ax

    mov ax, num_int
    call _print_2_digit_num

    mov ah, 4ch
    int 21h

_print_dx_val proc
    mov ah, 9
    int 21h
    ret
_print_dx_val endp

; AX = number to print
_print_2_digit_num proc
    mov bx, 10
    div bx

    mov div_res, al
    mov div_rem, dl

    add div_res, '0'
    add div_rem, '0'

    mov al, div_res
    mov ah, 0eh
    int 10h

    mov al, div_rem
    mov ah, 0eh
    int 10h

    ret
_print_2_digit_num endp

