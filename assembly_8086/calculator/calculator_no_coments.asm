carret equ 13
newline equ 10

.stack 100h

.data
    title_msg db '###################', newline, carret
              db '#   calculadora   #', newline, carret
              db '###################', newline, carret, '$'
    shapes_lst_msg db 'C -> Circulo', newline, carret
                   db 'T -> Triangulo', newline, carret
                   db 'c -> Cuadrado', newline, carret, '$'
    choose_shape_msg db 'Escoje la figura: ', '$'
    circle_prompt_radius_msg db newline, carret, 'Radio: ', '$'
    triangle_prompt_base_msg db newline, carret, 'Base: ', '$'
    triangle_prompt_height_msg db newline, carret, 'Altura: ', '$'
    cube_prompt_side_msg db newline, carret, 'Lado: ', '$'
    invalid_input_msg db newline, carret, 'Caracter invalido', newline, carret, '$'

    circle_radius dw ?
    triangle_base dw ?
    triangle_height dw ?
    cube_side dw ?

    user_input_num db 3 dup(?)
    aton_res dw 0

    shape_user_option db ?

.code
    mov ax, @data
    mov ds, ax

    mov dx, offset title_msg
    call _print_dx_string

    mov dx, offset shapes_lst_msg
    call _print_dx_string

    mov dx, offset choose_shape_msg
    call _print_dx_string

    call _store_char_input_in_al
    mov shape_user_option, al

    cmp shape_user_option, 'C'
    jne _check_triangle
    call _prompt_circle_data
    jmp _continue

    _check_triangle:
    cmp shape_user_option, 'T'
    jne _check_cube
    call _prompt_triangle_data
    jmp _continue

    _check_cube:
    cmp shape_user_option, 'c'
    jne _invalid_option
    call _prompt_cube_data
    jmp _continue

    _invalid_option:
    mov dx, offset invalid_input_msg
    call _print_dx_string

    _continue:
    mov ax, 4C00h
    int 21h

_aton proc
    mov aton_res, 0

    mov al, [user_input_num]
    sub al, '0'
    mov bl, 100
    mul bl
    add aton_res, ax

    mov al, [user_input_num + 1]
    sub al, '0'
    mov bl, 10
    mul bl
    add aton_res, ax

    mov al, [user_input_num + 2]
    sub al, '0'
    xor ah, ah
    add aton_res, ax

    ret
_aton endp

_fill_user_input_num proc
    mov ah, 1
    int 21h
    mov [user_input_num], al

    mov ah, 1
    int 21h
    mov [user_input_num + 1], al

    mov ah, 1
    int 21h
    mov [user_input_num + 2], al

    ret
_fill_user_input_num endp

_print_single_al_char proc
    mov ah, 0Eh
    int 10h
    ret
_print_single_al_char endp

_print_dx_string proc
    mov ah, 09h
    int 21h
    ret
_print_dx_string endp

_store_char_input_in_al proc
    mov ah, 1
    int 21h
    ret
_store_char_input_in_al endp

_prompt_circle_data proc
    mov dx, offset circle_prompt_radius_msg
    call _print_dx_string

    call _fill_user_input_num
    call _aton
    mov ax, aton_res
    mov circle_radius, ax

    ret
_prompt_circle_data endp

_prompt_triangle_data proc
    mov dx, offset triangle_prompt_base_msg
    call _print_dx_string

    call _fill_user_input_num
    call _aton
    mov ax, aton_res
    mov triangle_base, ax

    mov dx, offset triangle_prompt_height_msg
    call _print_dx_string

    call _fill_user_input_num
    call _aton
    mov ax, aton_res
    mov triangle_height, ax

    ret
_prompt_triangle_data endp

_prompt_cube_data proc
    mov dx, offset cube_prompt_side_msg
    call _print_dx_string

    call _fill_user_input_num
    call _aton
    mov ax, aton_res
    mov cube_side, ax

    ret
_prompt_cube_data endp

