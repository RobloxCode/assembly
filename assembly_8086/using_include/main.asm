include emu8086.inc

.stack 100h

.data

.code
    mov ax, @data
    mov ds, ax

    printn 'Hello'
    putc '!'

    mov ah, 4ch
    int 21h

