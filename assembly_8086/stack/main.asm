.stack 100h

.data

.code
    mov ax, @data
    mov ds, ax

    mov bx, 10
    push bx

    pop ax
    pop cx

    mov ah, 4ch
    int 21h

