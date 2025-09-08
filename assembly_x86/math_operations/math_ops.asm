section .data
    new_line_char equ 10
    char_zero equ '0'
    ascii_digit_offset equ 48

    digit db char_zero, new_line_char

section .text
    global _start:

_start:
    mov rax, 3

    ; operations like mul or div ussually only take
    ; one parameter, since the operation will be
    ; stored in rax, for example
    ; mul rbx -> rax = rax * rbx
    ; also, the instructions mul and div must take a
    ; register as parameters

    ; if i wanted to multiply i'd use the rbx register and for division we use rcx
    mov rbx, 2
    mul rbx

    xor rdx, rdx                            ; for division we have to clean the high part
    mov rcx, 3
    div rcx

    call _print_rax_val

    mov rax, 60
    mov rdi, 0
    syscall

_print_rax_val:
    add rax, ascii_digit_offset
    ; in this line of code we will overide the digit buffer
    ; so what we do is, we only overide its first byte
    ; thats why we use al instead of rax, al is just 1 byte long
    ; whereas rax is 8 bytes
    mov [digit], al                         ; when using the [] operator, is like direffencing a ptr in c

    mov rax, 1
    mov rdi, 1
    mov rsi, digit
    mov rdx, 2
    syscall

    ret

