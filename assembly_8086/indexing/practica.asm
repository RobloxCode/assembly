.stack 100h

.data
    var1 db "    "
    var2 db "    "
    var3 dw "rojo"
    var4 db "azul"

.code
    mov ax, @data
    mov ds, ax

    ; fill var1
    mov ah, 1
    int 21h
    mov var1[0], al

    mov ah, 1
    int 21h
    mov var1[1], al

    mov ah, 1
    int 21h
    mov var1[2], al

    mov ah, 1
    int 21h
    mov var1[3], al

    ; fill var2
    mov ah, 1
    int 21h
    mov var2[0], al

    mov ah, 1
    int 21h
    mov var2[1], al

    mov ah, 1
    int 21h
    mov var2[2], al

    mov ah, 1
    int 21h
    mov var2[3], al

    mov ax, var3[0]
    mov bx, var3[1]
    mov cx, var3[2]
    mov dx, var3[3]

    mov al, var4[0]
    mov var1[0], al

    mov al, var4[1]
    mov var1[1], al

    mov al, var4[2]
    mov var1[2], al

    mov al, var4[3]
    mov var1[3], al

.exit

