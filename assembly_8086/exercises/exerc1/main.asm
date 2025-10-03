carriage_ret_char equ 13
newline equ 10
hex_offset equ 33h

.stack 100h

.data
    title_msg db '###############################', newline, carriage_ret_char
              db '#         calculadora         #', newline, carriage_ret_char
              db '###############################', newline, carriage_ret_char, '$'

    enter_num_msg db 'Escribe el numero de la figura: ', newline, carriage_ret_char, '$'

    lst_shapes_msg db '1 -> circulo', newline, carriage_ret_char
                   db '2 -> cuadrado', newline, carriage_ret_char
                   db '3 -> triangulo', newline, carriage_ret_char, '$'

    circle_data_msg db 'Radio: ', newline, carriage_ret_char, '$'
    cube_data_msg db 'lado: ', newline, carriage_ret_char, '$'
    triangle_data_msg db 'base, altura: ', newline, carriage_ret_char, '$'

    helper_100_c dw ?
    helper_10_c dw ?
    helper_1_c dw ?
    ston_res dw ?

.code
    mov ax, @data
    mov ds, ax

    mov dx, offset title_msg
    call _print_dx_val

    mov dx, offset lst_shapes_msg
    call _print_dx_val

    mov dx, offset enter_num_msg
    call _print_dx_val

    mov ah, 1
    int 21h

    cmp al, '1'
    je _print_circle_msg

    cmp al, '2'
    je _print_cube_msg

    cmp al, '3'
    je _print_triangle_msg

    mov dx, al
    call _str_to_num
    mov dx, ston_res


_str_to_num:
    mov si, dx
    xor ax, ax
    xor bx, bx

    mov al, [si]
    sub al, hex_offset
    mov bl, 100
    mul bl
    mov helper_100_c, ax

    inc si
    mov al, [si]
    sub al, hex_offset
    mov bl, 10
    mul bl
    mov helper_10_c, ax

    inc si
    mov al, [si]
    sub al, hex_offset
    xor ah, ah
    mov helper_1_c, ax

    mov ax, helper_100_c
    add ax, helper_10_c
    add ax, helper_1_c

    mov ston_res, ax
    ret

_print_circle_msg:
    mov dx, offset circle_data_msg
    call _print_dx_val
    jmp _exit

_print_cube_msg:
    mov dx, offset cube_data_msg
    call _print_dx_val
    jmp _exit

_print_triangle_msg:
    mov dx, offset triangle_data_msg
    call _print_dx_val
    jmp _exit

_print_dx_val:
    mov ah, 09h
    int 21h
    ret

_exit:
    mov ah, 4Ch
    int 21h
