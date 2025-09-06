section .data
    prompt_txt db "What is your name?: "
    msg_txt db "Hello, "

; the .bss section is variables that we create but we
; will initialize them through out the code execution
section .bss
    usr_name resb 16

section .text
    global _start

_start:
    call _display_prompt
    call _get_name
    call _display_txt2
    call _display_name_var

    jmp _exit_success

_get_name:
    mov rax, 0
    mov rdi, 0
    mov rsi, usr_name
    mov rdx, 16
    syscall
    ret

_display_prompt:
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt_txt
    mov rdx, 20
    syscall
    ret

_display_txt2:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_txt
    mov rdx, 7
    syscall
    ret

_display_name_var:
    mov rax, 1
    mov rdi, 1
    mov rsi, usr_name
    mov rdx, 16
    syscall
    ret

_exit_success:
    mov rax, 60
    mov rdi, 0
    syscall

_exit_err:
    mov rax, 60
    mov rdi, 1
    syscall

