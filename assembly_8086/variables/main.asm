.stack 100h

.data
    var db '1234$'

.code
    mov ax, @data
    mov ds, ax

    mov al, var                 ; doing this just to see it in the debugger
    lea bx, var                 ; saving the memor address of var in bx
    mov [bx], '2'               ; dereference the memory address and put a 2 there
    mov al, var                 ; doing this just to see it in the debugger

    ; only the registers BX, SI, DI, BP are
    ; used when indexing

    mov si, 0
    mov [var + si], '1'

    ; this line is the same as the above one
    ; mov var[si], '1'

    mov ah, 4ch
    int 21h

