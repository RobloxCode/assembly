new_line_char equ 10
dollar_sign_char equ 36
carriage_ret_char equ 13

.stack 100h

.data
    title_msg db 35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,new_line_char,carriage_ret_char,35, '     CALCULATOR     ',35,new_line_char,carriage_ret_char,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35
    shapes_lst_msg db new_line_char, carriage_ret_char, 'Circle' ,10, 13, 'Cube', 10, 13, 'Triangle', 10, 13, 36

.code
start:
    mov ax, @data
    mov ds, ax

    mov dx, offset title_msg
    call _display_msg

    mov dx, offset shapes_lst_msg
    call _display_msg

    call _exit

_display_msg proc
    mov ah, 09h
    int 21h
    ret
_display_msg endp

_exit proc
    mov ah, 4Ch
    int 21h
_exit endp

