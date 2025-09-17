new_line_char equ 10
carriage_ret_char equ 13
dollar_sign_char equ 36

.stack 100h

.data
    title_msg db 35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35
              db 35,35,35,35,35,35,35,35,35,35,new_line_char,carriage_ret_char
              db 35,'         CALCULADORA        ',35,new_line_char,carriage_ret_char
              db 35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35
              db 35,35,35,35,35,35,35,35,35,new_line_char,carriage_ret_char,dollar_sign_char

    lst_shapes_msg db 49,' ',45,62,' ','Circulo',new_line_char,carriage_ret_char
                   db 49,' ',45,62,' ','Cuadrado',new_line_char,carriage_ret_char
                   db 49,' ',45,62,' ','Triangulo',new_line_char,carriage_ret_char,dollar_sign_char

.code
start:
    mov ax, @data
    mov ds, ax

    mov dx, offset title_msg
    call _print_dx_val

    mov dx, offset lst_shapes_msg
    call _print_dx_val

    jmp _exit

_print_dx_val:
    mov ah, 09h
    int 21h
    ret

_exit:
    mov ah, 4ch
    int 21h


