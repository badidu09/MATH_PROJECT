BITS 64

%include "./src/utils.inc"
%include "./src/my_puts.inc"
%include "./src/data.inc"

[section .rodata]
    max_chance:         dq 100.00
    custum_format       db "Chances to get a %d yams: %0.2f%%", 10, 0

[section .data]
    my_chance:          dq 2.00
    facto_of_b:         dq 0
    facto_of_a_minus_b: dq 0
    facto_of_a:         dq 0
    mult_result:        dq 0
    a_minus_b:          dq 0
    my_pow_res:         dq 0
    left_res:           dq 0
    temp_res:           dq 0
    number_a:           dq 0
    number_b:           dq 0

[section .text]
    global compute_yams
    extern printf
    extern my_factorial
    extern my_pow

chance_max:
    mov rbx, qword [max_chance]
    mov qword [temp_res], rbx
    jmp compute_yams_end

compute_chance:
    mov [number_a], r9
    mov [number_b], r10

    mov r8, [number_a]
    mov rsi, [number_b]
    sub r8, rsi
    mov [a_minus_b], r8
    
    mov r8, [number_a]
    call my_factorial
    mov [facto_of_a], rax

    mov r8, [number_b]
    call my_factorial
    mov [facto_of_b], rax

    mov r8, [a_minus_b]
    call my_factorial
    mov [facto_of_a_minus_b], rax

    mov r8, 6
    mov rsi, [number_a]
    call my_pow
    mov [my_pow_res], rax

    mov r8, [facto_of_a]
    mov rax, [facto_of_b]
    mov rbx, [facto_of_a_minus_b]
    mul rbx
    mov r10, rax
    mov rax, r8
    div r10
    mov [left_res], rax

    divide_decimals left_res, my_pow_res, my_chance
    multiply_by_100 my_chance, temp_res

    jmp compute_yams_end

compute_yams:
    push rbp
    mov rbp, rsp
    mov R8, [nb_apparition]
    cmp R8, 5
    jge chance_max
    mov r9, 5
    sub r9, R8
    mov r10, 5
    sub r10, R8
    jmp compute_chance

compute_yams_end:
    custum_print custum_format, [expected_nb], temp_res
    exit 0
    leave
    ret
