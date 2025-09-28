newline equ 0ah
carret equ 0dh

.model small
.stack 100h
.data
    msg db '1', newline, carret, "$"
    counter db 0

.code
main:
    mov ax, @data
    mov ds, ax
    mov dx, offset msg
    call _print_loop
    jmp _exit

_print_dx_val:
    mov ah, 09h
    int 21h
    ret

_print_loop:
    cmp counter, 10
    jge _done_loop

    inc [counter]

    mov dx, offset msg
    call _print_dx_val

    inc byte ptr [msg]
    jmp _print_loop

_done_loop:
    ret

_exit:
    mov ah, 4ch
    int 21h

end main
