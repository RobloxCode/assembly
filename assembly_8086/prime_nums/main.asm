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

    mov al, newline
    mov ah, 0eh
    int 10h

    mov al, carret
    int 10h

    mov si, 2
    print_nums_loop:
        cmp si, int_num
        ja done

        mov bx, si
        call is_prime

        cmp ax, 1
        jne next

        mov bx, si
        call print_3_digit_num_bx

        mov ah, 0Eh
        mov al, carret
        int 10h

        mov al, newline
        int 10h
    next:
        inc si
        jmp print_nums_loop
    done:
        mov ah, 4Ch
        int 21h

; AX = 1 is prime, 0 not prime
; BX = number to check whether its prime or not
is_prime proc
    push si        ; Save SI register

    cmp bx, 2
    jl not_prime_exit
    je prime_exit

    mov si, 2
    mov cx, bx
    dec cx
    check_loop:
        cmp si, cx
        jge prime_exit

        mov ax, bx
        xor dx, dx
        div si

        cmp dx, 0
        je not_prime_exit

        inc si
        jmp check_loop

    prime_exit:
        pop si         ; Restore SI register
        mov ax, 1
        ret

    not_prime_exit:
        pop si         ; Restore SI register
        mov ax, 0
        ret
is_prime endp

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

; BX = number to print
print_3_digit_num_bx proc
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

end
