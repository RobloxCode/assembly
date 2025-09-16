new_line equ 0ah
carr_ret equ 0dh

.stack 100h

.data
    nums db '1', '2', '3', new_line, carr_ret, '$'
    msg db 'this ', 'message ', 'has ', 'multiple ', 'strings', new_line, carr_ret, '$'

.code
start:
    mov ax, @data
    mov ds, ax

    ; printing without indexing
    lea dx, nums
    call _print_dx_val

    ; printing an indexed char outta the msg bytes
    mov si, 6
    mov al, [msg+si]
    call _print_single_al_char

    mov si, 20
    mov al, [msg+si]
    call _print_single_al_char

    jmp _exit:

_print_dx_val:
    mov ah, 09h
    int 21h
    ret

_print_single_al_char:
    mov dl, al
    mov ah, 02h
    int 21h
    ret

_exit:
    mov ah, 4ch
    int 21h

