.stack 100h

.data

.code
    mov bx, 12
    call print_3_digit_num

    mov ah, 4ch
    int 21h

; BX = number to print
print_3_digit_num proc
    mov cx, 100

    mov ax, bx
    xor dx, dx

    div cx

    add al, '0'

    ; print
    mov ah, 0eh
    int 10h

    mov ax, dx
    mov cx, 10

    xor dx, dx
    div cx

    add al, '0'

    mov ah, 0eh
    int 10h

    mov ax, dx
    add al, '0'

    mov ah, 0eh
    int 10h

    ret
print_3_digit_num endp
