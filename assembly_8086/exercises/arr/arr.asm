ascii_char_offset equ 48

.model small

.stack 100h

.data
    d1 dw 123, 4, 6, 8
.code

main proc far
    mov ax, @data
    mov ds, ax

    mov ax, d1

    call print

    mov ah, 4ch
    int 21h

main endp

print proc
    mov cx, 0
    mov dx, 0

    label1:
        cmp ax, 0
        je print1

        mov bx, 10
        div bx
        push dx
        inc cx

        xor dx, dx
        jmp label1
    print1:
        cmp cx, 0
        je exit

        pop dx
        add dx, ascii_char_offset

        mov ah, 02h
        int 21h

        dec cx
        jmp print1

    exit:
        ret
print endp
end main
