section .data
    msg db "using call", 10

section .text
    global _start
    global _print
    global _end

_end:
    mov rax, 60
    mov rdi, 0
    syscall                     ; terminate the program, no return

_print:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, 11
    syscall
    ret                         ; we will not exit the program

_start:
    ; using call and jmp are basically the same, however
    ; when we use call we can come back to where we call it from,
    ; but, if we use call, we have to make sure that in the
    ; label we use "ret" too
    call _print

    jmp _end

