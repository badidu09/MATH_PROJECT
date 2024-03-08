BITS 64

%include "./src/utils.inc"
%include "./src/my_puts.inc"
%include "./src/data.inc"

[section .text]
    global get_nb_apparition
    extern get_straight_nb_apparition
    extern get_full_nb_apparition

nb_apparition_straight:
    call get_straight_nb_apparition
    jmp get_nb_apparition_end

nb_apparition_full:
    call get_full_nb_apparition
    jmp get_nb_apparition_end

get_nb_apparition:
    push rbp
    mov rbp, rsp
    xor rcx, rcx
    mov r9, [is_straight]
    cmp r9, TRUE
    je nb_apparition_straight
    mov r9, [is_full]
    cmp r9, TRUE
    je nb_apparition_full
    mov rax, [expected_nb]
    jmp get_nb_apparition_loop

inc_nb_apparition:
    mov rsi, [nb_apparition]
    inc rsi
    mov [nb_apparition], rsi

get_nb_apparition_loop:
    cmp rcx, 5
    je get_nb_apparition_end
    mov r9, [dices + rcx * 8]
    inc rcx
    cmp r9, rax
    je inc_nb_apparition
    jmp get_nb_apparition_loop

get_nb_apparition_end:
    leave
    ret
