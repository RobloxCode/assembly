.stack 100h

.data
    msg db "Hola"
    msg2 dw "mensaje 2"

.code
    mov ax, @data
    mov ds, ax

    ; mov ax, bx                ; registro
    ; mov bx, 20                ; inmediato
    ; mov [003], bx             ; directo
    mov ax, msg

    mov bx, [dx]

