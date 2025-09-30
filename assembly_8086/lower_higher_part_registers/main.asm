.stack 100h

.data

.code
    mov ax, @data
    mov ds, ax

    ; the general purpuse registers have a lower and a higher
    ; part, we can access those parts seperately (al -> lower part of ax or
    ; ah for the higher part of the ax register), or we can access
    ; the full register as usuall

    mov ax, 10                  ; 0Ah

    ; moving into the higher part
    mov bh, 'a'                 ; 61h

    ; moving into the lower part
    mov bl, 2

