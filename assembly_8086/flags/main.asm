.stack 100h

.data
    num db 1
    num2 db 2

.code
    mov ax, @data
    mov ds, ax

    add num, 1                  ; this shoud change some flags
    inc num2                    ; this shouldnt change any flags

