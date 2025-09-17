newline equ 10
carriage_ret_char equ 13

.stack 100h

.data
    title_msg db '###############################', newline, carriage_ret_char
              db '#         calculadora         #', newline, carriage_ret_char
              db '###############################', newline, carriage_ret_char, '$'

    lst_shapes_msg db '1 -> circulo', newline,carriage_ret_char
                   db '2 -> cuadrado', newline, carriage_ret_char
                   db '3 -> triangulo', newline, carriage_ret_char, '$'

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

