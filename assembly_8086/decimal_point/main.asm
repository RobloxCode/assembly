.stack 100h

.data
    num_str db '132$'
    num_int dw 132

    div_res db ?
    div_rem db ?

    radius dw 12
    circle_area_before_point_str db 3 dup(?)
    circle_area_after_point_str db 3 dup(?)
    circle_area_before_point_int dw ?
    circle_area_after_point_int dw ?

    ntoa_res db 4 dup(?)
    cur_rem dw 0

.code
    mov ax, @data
    mov ds, ax

    mov ax, num_int
    call _ntoa

    lea dx, ntoa_res
    call _print_dx_val

    mov ah, 4ch
    int 21h

; AX = number to parse to ascii
; it will store the result in ntoa_res
_ntoa proc
    xor dx, dx

    mov bx, 100
    div bx

    add ax, '0'
    mov [ntoa_res], al

    mov ax, dx
    xor dx, dx
    mov bx, 10

    div bx
    add ax, '0'
    mov [ntoa_res + 1], al

    mov ax, dx
    add ax, '0'
    mov [ntoa_res + 2], al

    mov [ntoa_res + 3], '$'

    ret
_ntoa endp

; AX = radius
_get_circle_area proc
    mov bx, ax
    mul bx

    mov bx, 22
    mul bx

    mov bx, 7
    div bx

    add circle_area_before_point_int, ax
    mov circle_area_after_point_int, dx

    ret
_get_circle_area endp

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

