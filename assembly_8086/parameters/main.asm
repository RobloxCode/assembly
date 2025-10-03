ascii_num_offset equ 48

.stack 100h

.data

.code
    mov ax, 1
    mov bx, 2
    call _add_nums

    add al, ascii_num_offset
    call _print_single_al_char

    mov ax, 4C00h
    int 21h

; Parameters: AX = first number, BX = second number
; Return: AX = result
_add_nums proc
    add ax, bx
    ret
_add_nums endp

_print_single_al_char proc
    mov ah, 0Eh
    int 10h
    ret
_print_single_al_char endp

