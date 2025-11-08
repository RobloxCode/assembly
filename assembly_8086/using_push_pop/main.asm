PRINT_CHAR_INT equ 0eh
PRINT_STR_INT equ 9h
EXIT_PROGRAM_INT equ 4ch

.stack 100h

.data
    arr dw 1,2,3,4,5
    num dw 3
    yes_msg db 'yes$'
    no_msg db 'no$'

.code
    mov ax, @data
    mov ds, ax

    ; putting the number 4 in the cx register
    ; befire calling a function that uses the
    ; cx register
    mov cx, 4

    mov bx, 9
    call print_nums

    ; in si we multiply by 2 since, when we use the
    ; + operator in here, itll increase by a byte and
    ; the arr in a defined by dw so we gotta shift
    ; twice to make up for the bytes

    lea bx, arr
    mov si, 4
    cmp word ptr [bx + si*2], 4
    je print_yes_msg_comparison
    jne print_no_msg_comparison

    print_yes_msg_comparison:
        call print_yes_msg
        jmp continue

    print_no_msg_comparison:
        call print_no_msg
        jmp continue

    continue:
    mov ah, EXIT_PROGRAM_INT
    int 21h

print_yes_msg proc
    lea dx, yes_msg
    mov ah, PRINT_STR_INT
    int 21h
    ret
print_yes_msg endp

print_no_msg proc
    lea dx, no_msg
    mov ah, PRINT_STR_INT
    int 21h
    ret
print_no_msg endp

; params BX = top number
; prints all the numbers from 0 all the way to BX
print_nums proc
    push cx
    mov cx, 0

    print_loop:
        cmp cx, bx
        jae exit_loop

        mov ax, cx
        add al, '0'
        mov ah, PRINT_CHAR_INT
        int 10h

        inc cx
        jmp print_loop

    exit_loop:
        pop cx
        ret
print_nums endp

