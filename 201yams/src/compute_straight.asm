BITS 64

%include "./src/utils.inc"
%include "./src/my_puts.inc"
%include "./src/data.inc"
%define STRAIGHT_EXCEPTED_NB 5

[section .rodata]
    custum_format db "Chances to get a %d straight: %0.2f%%", 10, 0

[section .data]
    my_chance: dq 0.00
    my_pow_res: dq 0
    left_res: dq 0
    temp_res: dq 0
    number_a: dq 0
    number_b: dq 0

[section .text]
    global compute_straight
    extern printf
    extern my_factorial
    extern my_pow

chance_max:
    mov rbx, qword [hundred]
    mov qword [temp_res], rbx
    jmp compute_straight_end

compute_chance:
    my_mul_int temp_res, number_b
    mov rdx, [temp_res]
    mov [left_res], rdx
    mov r9, [number_b]
    dec r9
    mov [number_b], r9
    cmp r9, 0
    jle end_of_compute_straight
    jmp compute_chance

end_of_compute_straight:
    mov r8, DICE_FACE_NB
    mov rsi, [number_a]
    call my_pow
    mov [my_pow_res], rax
    divide_decimals left_res, my_pow_res, my_chance
    multiply_by_100 my_chance, temp_res
    jmp compute_straight_end

compute_straight:
    push rbp
    mov rbp, rsp
    mov R8, [nb_apparition]
    cmp R8, STRAIGHT_EXCEPTED_NB
    jge chance_max
    mov r9, DICES_NB
    sub r9, R8
    mov [number_a], r9
    mov [number_b], r9
    mov r9, 1
    mov [temp_res], r9
    jmp compute_chance

compute_straight_end:
    custum_print custum_format, [expected_nb], temp_res
    exit 0
