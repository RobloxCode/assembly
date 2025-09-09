section .data
    top_val db 0, 10

section .text
    global _start

_start:
    push 1
    push 2
    push 3

    pop rax
    add rax, '0'
    mov [top_val], al

    call _print_top_val_var

    pop rax
    add rax, '0'
    mov [top_val], al

    call _print_top_val_var

    mov rax, 60
    mov rdi, 0
    syscall

_print_top_val_var:
    mov rax, 1
    mov rdi, 1
    mov rsi, top_val
    mov rdx, 2
    syscall
    ret

