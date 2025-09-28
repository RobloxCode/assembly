section .bss
    digit_space resb 100
    digit_space_pos resb 8

section .text
    global _start

_start:
    mov rax, 1234
    call _print_rax_val

    mov rax, 60
    mov rdi, 0
    syscall

_print_rax_val:
    mov rcx, digit_space
    mov rbx, 10
    mov [rcx], rbx
    inc rcx
    mov [digit_space_pos], rcx

_print_rax_loop:
    mov rdx, 0
    mov rbx, 10
    div rbx
    push rax
    add rdx, 48

    mov rcx, [digit_space_pos]
    mov [rcx], dl
    inc rcx
    mov [digit_space_pos], rcx

    pop rax
    cmp rax, 0
    jne _print_rax_loop

_print_rax_loop_2:
    mov rcx, [digit_space_pos]

    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 1
    syscall

    mov rcx, [digit_space_pos]
    dec rcx
    mov [digit_space_pos], rcx

    cmp rcx, digit_space
    jge _print_rax_loop_2

    ret

