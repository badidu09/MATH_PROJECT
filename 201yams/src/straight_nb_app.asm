BITS 64

%include "./src/utils.inc"
%include "./src/my_puts.inc"
%include "./src/data.inc"

[section .data]
    array1: dq 1, 2, 3, 4, 5
    array2: dq 2, 3, 4, 5, 6

[section .text]
    global get_straight_nb_apparition

fnc_find_border:
    mov r8, [expected_nb]
    cmp r8, 5
    jg set_second_tab
    jmp set_first_tab

set_first_tab:
    mov r8, array1
    jmp fnc_loop

set_second_tab:
    mov r8, array2
    jmp fnc_loop

get_straight_nb_apparition:
    push rbp
    mov rbp, rsp
    xor rcx, rcx
    xor rdx, rdx
    xor r11, r11
    xor r8, r8
    mov rax, [expected_nb]
    jmp fnc_find_border

increment_and_re_iterate:
    inc rdx
    jmp check_this_nb

check_this_nb:
    cmp rdx, 5
    jge fnc_loop
    mov r9, [r8 + rdx * 8]
    cmp r9, r10
    jne increment_and_re_iterate
    inc r11
    mov rax, 7
    mov [r8 + rdx * 8], rax
    jmp increment_and_re_iterate

fnc_loop:
    cmp rcx, 5
    jge fnc_end
    mov r10, [dices + rcx * 8]
    inc rcx
    xor rdx, rdx
    jmp check_this_nb

fnc_end:
    mov [nb_apparition], r11
    leave
    ret
