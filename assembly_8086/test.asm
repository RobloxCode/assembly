org 0x100

mov ah, 0x09
mov dx, hello
int 0x21

mov ah, 0x4c
int 0x21

hello db 'juan es noob, World!$'

