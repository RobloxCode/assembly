newline equ 0ah
carret equ 0dh

.stack 100h

.data
    num db "1", newline, carret
    counter db 0

.code
    mov ax, @data
    mov ds, ax

    push 5
    call _print_nxt_num_n_times

    jmp _exit

_print_al_char:
    mov ah, 0eh
    int 10h
    ret

_print_nxt_num_n_times:
    push bp
    mov bp, sp
    mov ax, [bp+4]              ; parameter is now in ax

    cmp counter, ax
    jge _exit

    add counter, 1

    add num, 1
    mov al, num
    call _print_al_char

    pop bp
    ret 2

    call _print_al_char

_exit:
    mov ah, 4ch
    int 21h
