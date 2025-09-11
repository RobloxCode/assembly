new_line_char equ 10
dollar_sign_char equ 36
carriage_ret_char equ 13

.stack 100h

.data
    tittle db 'Shape calculator$', new_line_char, carriage_ret_char
    shapes_list_msg db 'Cicle', new_line_char, carriage_ret_char, 'Cube', new_line_char, carriage_ret_char, 'Triangle', new_line_char, carriage_ret_char, dollar_sign_char

.code
start:
    mov ax, @data
    mov ds, ax

    mov dx, offset tittle
    call _display_msg

    mov dx, offset shapes_list_msg
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
