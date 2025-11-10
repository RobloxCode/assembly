PRINT_STR_INT equ 9

.model small
.stack 100h

.data
    ; arrays for storing data
    students db 5 dup(20 dup('$'))  ; 5 students, 20 chars each
    grades db 5 dup(0)                ; 5 grades
    student_count db 0                ; current number of students
    
    ; menu strings
    menu_title db 13,10,'=== student grade manager ===',13,10,'$'
    menu_1 db '1. add student',13,10,'$'
    menu_2 db '2. display all students',13,10,'$'
    menu_3 db '3. calculate average',13,10,'$'
    menu_4 db '4. find highest grade',13,10,'$'
    menu_5 db '5. find lowest grade',13,10,'$'
    menu_6 db '6. search student',13,10,'$'
    menu_7 db '7. exit',13,10,'$'
    menu_prompt db 'enter choice: $'
    
    ; input prompts
    name_prompt db 13,10,'enter student name: $'
    grade_prompt db 'enter grade (0-100): $'
    search_prompt db 13,10,'enter name to search: $'
    
    ; output messages
    avg_msg db 13,10,'average grade: $'
    highest_msg db 13,10,'highest grade: $'
    lowest_msg db 13,10,'lowest grade: $'
    found_msg db 13,10,'student found! grade: $'
    not_found_msg db 13,10,'student not found!',13,10,'$'
    
    newline db 13,10,'$'
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; your main loop here
    call display_menu
    ; get user choice
    ; call appropriate procedure based on choice
    
    mov ah, 4ch
    int 21h
main endp

; todo: implement these procedures

display_menu proc
    lea dx, menu_title
    call print_string

    lea dx, menu_2
    call print_string

    lea dx, menu_3
    call print_string

    lea dx, menu_4
    call print_string

    lea dx, menu_5
    call print_string

    lea dx, menu_6
    call print_string

    lea dx, menu_7
    call print_string

    lea dx, menu_prompt
    call print_string

    ret
display_menu endp

add_student proc
    ; add a new student and grade
    ; practice: array manipulation, input operations, indexing
    ret
add_student endp

display_all proc
    ; display all students with their grades
    ; practice: loops, array traversal, string output
    ret
display_all endp

calc_average proc
    ; calculate and display average grade
    ; practice: arithmetic ops, loops, division, converting numbers
    ret
calc_average endp

find_highest proc
    ; find and display the highest grade
    ; practice: comparison, loops, variable updates
    ret
find_highest endp

find_lowest proc
    ; find and display the lowest grade
    ; practice: comparison, loops, conditional jumps
    ret
find_lowest endp

search_student proc
    ; search for a student by name
    ; practice: string comparison, loops, conditional display
    ret
search_student endp

; helper procedures you might need:

; input: dx = offset of string
print_string proc
    push ax
    mov ah, PRINT_STR_INT
    int 21h
    pop ax
    ret
print_string endp

get_number proc
    ; convert ascii input to number
    ; practice: ascii conversion, input validation
    ret
get_number endp

; input: bx = number to print
print_number proc
    ; convert number to ascii and print
    ; practice: division, modulo, ascii conversion, stack usage
    ret
print_number endp

end main
