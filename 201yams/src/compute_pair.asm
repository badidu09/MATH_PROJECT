BITS 64

%include "./src/utils.inc"
%include "./src/my_puts.inc"
%include "./src/data.inc"
%define PAIR_EXPECTED_DICE 2

[section .rodata]
    custum_format db "Chances to get a %d pair: %0.2f%%", 10, 0

[section .data]
    facto_of_b:         dq 0
    facto_of_a_minus_b: dq 0
    facto_of_a:         dq 0
    a_minus_b:          dq 0
    left_res:           dq 0.00
    my_fucking_result:  dq 0.00
    my_end_result:      dq 0.00
    my_end_result2:     dq 0.00
    final_result:       dq 0.00
    number_a:           dq 0.00
    number_b:           dq 0.00
    res_temp:           dq 0.00
    left_pow:           dq 0.00
    right_pow:          dq 0.00
    float_temp:         dq 0.00
    float_temp2:        dq 0.00

[section .text]
    global compute_pair
    extern printf
    extern my_factorial
    extern pow_double

chance_max:
    mov rbx, qword [hundred]
    mov qword [final_result], rbx
    jmp compute_pair_end

compute_chance:
    mov rax, DICE_FACE_NB
    sub rax, [nb_apparition]
    cmp r10, rax
    jge compute_pair_end

    mov [number_a], r9
    mov [number_b], r10

    mov r8, [number_a]
    mov rsi, [number_b]
    sub r8, rsi
    mov [a_minus_b], r8
    mov r9, [a_minus_b]

    mov r8, [number_a]
    call my_factorial
    mov [facto_of_a], rax

    mov r8, [number_b]
    call my_factorial
    mov [facto_of_b], rax

    mov r8, [a_minus_b]
    call my_factorial
    mov [facto_of_a_minus_b], rax

    divide_decimals one, six, float_temp

    movsd xmm0, [float_temp]
    cvtsi2sd xmm1, [number_b]
    call pow_double
    movsd [left_pow], xmm0

    divide_decimals five, six, float_temp2

    movsd xmm0, [float_temp2]
    cvtsi2sd xmm1, [a_minus_b]
    call pow_double
    movsd [right_pow], xmm0

    my_mul_int_2 facto_of_b, facto_of_a_minus_b, res_temp
    divide_integers facto_of_a , res_temp, left_res
    int_to_double left_res
    mult_decimals left_res, left_pow, my_fucking_result
    mult_decimals my_fucking_result, right_pow, my_end_result
    mult_decimals my_end_result, hundred, my_end_result2
    my_plus_equal final_result, my_end_result2

    mov r9, [number_a]
    mov r10, [number_b]
    inc r10
    jmp compute_chance

compute_pair:
    push rbp
    mov rbp, rsp
    mov R8, [nb_apparition]
    cmp R8, PAIR_EXPECTED_DICE
    jge chance_max
    mov r9, 5
    sub r9, [nb_apparition]
    mov r10, PAIR_EXPECTED_DICE
    sub r10, [nb_apparition]
    jmp compute_chance

compute_pair_end:
    custum_print custum_format, [expected_nb], final_result
    exit 0
