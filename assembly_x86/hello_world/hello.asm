section .data
    greater db "is greater", 10
    smaller db "is smaller", 10

section .text
    global _start
    global print_greater
    global print_smaller
    global return_sc

return_sc:
    mov rax, 60
    mov rdi, 0
    syscall

print_greater:
    mov rax, 1
    mov rdi, 1
    mov rsi, greater
    mov rdx, 11
    syscall

    jmp return_sc

print_smaller:
    mov rax, 1
    mov rdi, 1
    mov rsi, smaller
    mov rdx, 11
    syscall

    jmp return_sc

_start:
    cmp rax, 2
    jl print_smaller
    jmp return_sc

