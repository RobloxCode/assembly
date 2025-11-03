carret equ 13
newline equ 10

PRINT_CHAR_INT equ 0eh
PRINT_STR_INT equ 09h
STDI_INT equ 01h
EXIT_INT equ 4ch

.stack 100h

.data
    ; messages
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
    area_result_msg db newline, carret, 'Area: ', '$'
    invalid_input_msg db newline, carret, 'Caracter invalido', newline, carret, '$'
    decimal_point_char db '.', '$'

    ; shapes data
    circle_radius dw ?
    triangle_base dw ?
    triangle_height dw ?
    cube_side dw ?

    ; parse variables
    user_input_num db 3 dup(?)
    aton_res dw 0

    shape_user_option db ?

    area_res dw 0
    area_rem dw 0

    ntoa_res db 6 dup(?)

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
    call _calculate_circle_area
    jmp _continue

    _check_triangle:
    cmp shape_user_option, 'T'
    jne _check_cube
    call _prompt_triangle_data
    call _calculate_triangle_area
    jmp _continue

    _check_cube:
    cmp shape_user_option, 'c'
    jne _invalid_option
    call _prompt_cube_data
    call _calculate_cube_area
    jmp _continue

    _invalid_option:
    mov dx, offset invalid_input_msg
    call _print_dx_string

    _continue:
    mov dx, offset area_result_msg
    call _print_dx_string

    mov ax, area_res
    call _ntoa

    mov dx, offset ntoa_res
    call _print_dx_string

    mov dx, offset decimal_point_char
    call _print_dx_string

    mov ax, area_rem
    call _ntoa

    mov dx, offset ntoa_res
    call _print_dx_string

    mov ax, EXIT_INT
    int 21h

; AX = number to parse to ascii
; it will store the result in ntoa_res
_ntoa proc
    xor dx, dx

    mov bx, 10000
    div bx

    add al, '0'
    mov [ntoa_res], al

    mov ax, dx
    xor dx, dx
    mov bx, 1000

    div bx

    add al, '0'
    mov [ntoa_res + 1], al

    mov ax, dx
    xor dx, dx
    mov bx, 100

    div bx

    add al, '0'
    mov [ntoa_res + 2], al

    mov ax, dx
    xor dx, dx
    mov bx, 10

    div bx
    add al, '0'
    mov [ntoa_res + 3], al

    mov ax, dx
    add al, '0'
    mov [ntoa_res + 4], al

    mov [ntoa_res + 5], '$'

    ret
_ntoa endp

_calculate_triangle_area proc
    xor dx, dx

    mov ax, triangle_base
    mov bx, triangle_height
    mul bx

    mov bx, 2
    div bx

    mov area_res, ax
    mov area_rem, dx

    ret
_calculate_triangle_area endp

_calculate_circle_area proc
    xor dx, dx

    mov ax, circle_radius
    mov bx, circle_radius
    mul bx

    mov bx, 314
    mul bx

    mov bx, 100
    div bx

    mov area_res, ax
    mov area_rem, dx

    ret
_calculate_circle_area endp

_calculate_cube_area proc
    xor dx, dx

    mov ax, cube_side
    mov bx, cube_side
    mul bx

    add area_res, dx
    add area_res, ax

    ret
_calculate_cube_area endp

; Parses from a char to a number
; the value stored at user_input_num
; and saves it in aton_res
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
    mov ah, STDI_INT
    int 21h
    mov [user_input_num], al

    mov ah, STDI_INT
    int 21h
    mov [user_input_num + 1], al

    mov ah, STDI_INT
    int 21h
    mov [user_input_num + 2], al

    ret
_fill_user_input_num endp

_print_single_al_char proc
    mov ah, PRINT_CHAR_INT
    int 10h
    ret
_print_single_al_char endp

_print_dx_string proc
    mov bx, dx
    mov si, 0

    skip_zeros:
        cmp byte ptr [bx + si], '0'
        jne _print

        inc si
        jmp skip_zeros

    _print:
    add dx, si
    mov ah, PRINT_STR_INT
    int 21h

    ret
_print_dx_string endp

_store_char_input_in_al proc
    mov ah, STDI_INT
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
