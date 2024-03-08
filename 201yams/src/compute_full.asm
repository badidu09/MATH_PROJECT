BITS 64

%include "./src/utils.inc"
%include "./src/my_puts.inc"
%include "./src/data.inc"
%define FULL_EXPECTED 5

[section .rodata]
    max_chance:         dq 100.00
    custum_format       db "Chances to get a %d full of %d: %0.2f%%", 10, 0

[section .data]
    my_chance:          dq 2.00
    facto_of_b:         dq 0
    facto_of_a:         dq 0
    mult_result:        dq 0
    b_minus_a:          dq 0
    my_pow_res:         dq 0
    facto_of_b_minus_a: dq 0
    left_res:           dq 0
    temp_res:           dq 0
    number_a:           dq 0
    number_b:           dq 0

[section .text]
    global compute_full
    extern printf
    extern my_factorial
    extern my_pow

chance_max:
    mov rbx, qword [max_chance]
    mov qword [temp_res], rbx
    jmp compute_full_end

compute_chance:
    mov [number_a], r9
    mov [number_b], r10

    mov r8, [number_b]
    mov rsi, [number_a]
    sub r8, rsi
    mov [b_minus_a], r8

    mov r8, [number_b]
    call my_factorial
    mov [facto_of_b], rax
    
    mov r8, [number_a]
    call my_factorial
    mov [facto_of_a], rax

    mov r8, [b_minus_a]
    call my_factorial
    mov [facto_of_b_minus_a], rax

    mov r8, DICE_FACE_NB
    mov rsi, [number_b]
    call my_pow
    mov [my_pow_res], rax

    mov rax, [facto_of_a]
    mov r9, [facto_of_b_minus_a]
    mul r9
    mov [mult_result], rax

    divide_decimals facto_of_b, mult_result, left_res
    int_to_double my_pow_res
    divide_decimals left_res, my_pow_res, my_chance
    mult_decimals my_chance, hundred, temp_res
    jmp compute_full_end

compute_full:
    push rbp
    mov rbp, rsp
    mov R8, [nb_apparition]
    cmp R8, FULL_EXPECTED
    jge chance_max

    mov r9, 3
    mov r8, [full_house]
    sub r9, R8

    mov r10, 5
    mov r8, [full_house]
    mov rcx, [full_house + 8]
    add r8, rcx
    sub r10, r8
    
    jmp compute_chance

compute_full_end:
    custum_print_full custum_format, [expected_nb], [expected_nb + 8], temp_res
    exit 0
