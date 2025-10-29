.stack 100h

.data
    number dw 42
    binary db 17 dup(?)

.code
    mov ax, @data
    mov ds, ax

    mov ax, number
    lea si, binary
    call word_to_binary

; procedure: word_to_binary
; input: ax = word number to convert
; output: binary string stored at ds:si (16 characters + null terminator)
; registers used: ax, bx, cx, dx, si
word_to_binary proc near
    push ax
    push bx
    push cx
    push dx
    push si
    
    mov cx, 16          ; 16 bits in a word
    mov bx, ax          ; save number in bx
    
convert_loop:
    mov dx, 0           ; clear dx
    shl bx, 1           ; shift left, msb goes to carry flag
    jc set_one          ; if carry set, bit was 1
    
set_zero:
    mov byte ptr [si], '0'
    jmp next_bit
    
set_one:
    mov byte ptr [si], '1'
    
next_bit:
    inc si              ; move to next position
    dec cx              ; decrement counter
    jnz convert_loop    ; continue if not zero
    
    mov byte ptr [si], 0    ; null terminate the string
    
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
word_to_binary endp
