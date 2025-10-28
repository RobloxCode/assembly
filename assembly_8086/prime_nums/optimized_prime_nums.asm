EXIT_CODE equ 4ch
PRINT_CODE equ 0eh
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

    mov si, 2
    print_loop:
        cmp si, int_num
        jge continue

        mov bx, si
        call is_prime_check

        cmp ax, 1
        jne next

        mov ah, PRINT_CODE
        mov al, carret
        int 10h

        mov al, newline
        int 10h

        mov bx, si
        call print_3_digit_num_bx

    next:
        inc si
        jmp print_loop

    continue:
    mov ah, EXIT_CODE
    int 21h

; AX = 1 if its prime, 0 if its not prime
; BX = number to check
is_prime_check proc
    push bx
    push cx
    push dx

    cmp bx, 2
    jl not_prime
    je prime

    mov cx, 2
    check_loop:
        mov ax, cx
        mul cx
        cmp ax, bx
        ja prime

        mov ax, bx
        xor dx, dx
        div cx
        cmp dx, 0
        je not_prime

        inc cx
        jmp check_loop

    prime:
        mov ax, 1
        jmp done

    not_prime:
        mov ax, 0

    done:
        pop dx
        pop cx
        pop bx
        ret

is_prime_check endp

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

; BX = number to print
print_3_digit_num_bx proc
    mov cx, 100
    mov ax, bx
    xor dx, dx
    div cx

    add al, '0'

    mov ah, PRINT_CODE
    int 10h

    mov ax, dx
    mov cx, 10
    xor dx, dx
    div cx

    add al, '0'
    mov ah, PRINT_CODE
    int 10h

    mov ax, dx
    add al, '0'
    mov ah, PRINT_CODE
    int 10h

    ret
print_3_digit_num_bx endp

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

print_dx_val proc
    mov ah, 9
    int 21h
    ret
print_dx_val endp
