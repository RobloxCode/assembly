.stack 100h

.data

print_al_char proc
    mov ah, 0eh
    int 10h
    ret
print_al_char endp
