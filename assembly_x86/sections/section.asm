; each section is a chunk of code where we will do
; some specific tasks
; for example, in the .data section we define our
; variables
section .data
    msg db "this projects is about sections", 10

; there's also a bss section where we define variables
; for the future or something like that idk
; the .bss section is variables that we create but we 
; will initialize them through out the code execution

; in the .text section is where all of our code will 
; be, and also we put our labels a label is a like 
; a function, cuz when we call it we do a jump
section .text
    ; the _start label is like the main function/entry
    ; of every assembly program
    global _start
    global success_exit         ; creating my own label

success_exit:
    mov rax, 60
    mov rdi, 0
    syscall

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, 32
    syscall

    jmp success_exit            ; jumping to the success_exit label

