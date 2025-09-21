newline equ 0ah
carret equ 0dh

.stack 100h

.data
    num db '1'
    counter db 0

.code
    mov ax, @data
    mov ds, ax

    call _print_loop

    mov ah, 4ch
    int 21h

_print_al_char proc
    mov ah, 0eh
    int 10h
    ret
_print_al_char endp

_print_loop proc
    cmp counter, 5
    jge _done

    ; we dont need inc byte ptr [counter]
    ; since counter is defined just as 0 (one single element)
    ; the compiler already knows its size
    inc counter

    mov al, [num]
    call _print_al_char

    mov al, ' '
    call _print_al_char

    ; in this case we could also amit the byte ptr
    inc byte ptr [num]

    jmp _print_loop

_done:
    ret

_print_loop endp

