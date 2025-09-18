.stack 100h

.data
    msg1 db 'msg 1', 10, 13, '$'
    msg3 dw 'msg 2', 10, 13, '$'

.code
    mov ax, @data
    mov ds, ax

    mov ax, bx
    mov bx, 123

    mov bx, [0023]
    mov bx, msg3

.exit
