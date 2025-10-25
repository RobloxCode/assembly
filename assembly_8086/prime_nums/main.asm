carret equ 13
newline equ 10

.stack 100h

.data
    msg db 'escribe un numero de 3 digitos: $', newline, carret
    char_num db 3 dup(?)
    int_num dw 0

.code
    mov ax, @data
    mov ds, ax

    lea dx, msg
    call print_dx_val

    call scan_3_digit_num

    lea bx, char_num
    call to_num

    mov ah, 4ch
    int 21h

print_dx_val proc
    mov ah, 9
    int 21h
    ret
print_dx_val endp

scan_3_digit_num proc
    mov cx, 3
    mov si, 0

    mov ah, 1
    get_char:
        int 21h

        mov [char_num + si], al
        inc si

        loop get_char

    ret
scan_3_digit_num endp

to_num proc
    xor ax, ax
    mov si, 0

    mov al, [bx + si]
    sub al, '0'
    mov cx, 100
    mul cx

    add int_num, ax
    inc si

    xor ax, ax
    mov al, [bx + si]
    sub al, '0'
    mov cx, 10
    mul cx

    add int_num, ax
    inc si

    xor ax, ax
    mov al, [bx + si]
    sub al, '0'

    add int_num, ax

    ret
to_num endp

to_binary proc
    ret
to_binary endp
