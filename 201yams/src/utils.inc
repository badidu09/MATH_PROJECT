BITS 64

%define SYS_EXIT 60
%define SYS_WRITE 1
%define STDOUT 1
%define STDERR 2
%define NEWLINE 10
%define NULL 0
%define TRUE 1
%define FALSE 0
%define DICES_NB 5
%define DICE_FACE_NB 6

[section .rodata]
    hundred: dq 100.00

[section .text]
    extern fflush

%macro exit 1
    mov rax, SYS_EXIT
    mov rdi, %1
    syscall
%endmacro

%macro save_all_registers 0
    push rax
    push rbx
    push rcx
    push rdx
    push rsi
    push rdi
    push rbp
    push r8
    push r9
    push r10
%endmacro

%macro restore_all_registers 0
    pop r10
    pop r9
    pop r8
    pop rbp
    pop rdi
    pop rsi
    pop rdx
    pop rcx
    pop rbx
    pop rax
%endmacro

%macro flushAllStreams 0
    xor rdi, rdi
    call fflush
%endmacro

%macro divide_decimals 3 ; %1 = dividend, %2 = divisor, %3 = result
    movsd xmm0, qword [%1]
    movsd xmm1, qword [%2]
    divsd xmm0, xmm1
    movsd qword [%3], xmm0
%endmacro

%macro divide_integers 3 ; %1 = dividend, %2 = divisor, %3 = result
    mov rax, qword [%1]
    cqo
    idiv qword [%2]
    mov qword [%3], rax
%endmacro

%macro multiply_by_100 2 ; %1 = input, %2 = output
    movsd xmm0, qword [%1]
    mulsd xmm0, qword [hundred]
    movsd qword [%2], xmm0
%endmacro

%macro add_two_decimals 3 ; %1 = first, %2 = second, %3 = result
    movsd xmm0, qword [%1]
    movsd xmm1, qword [%2]
    addsd xmm0, xmm1
    movsd qword [%3], xmm0
%endmacro

%macro my_plus_equal 2 ; %1 = first, %2 = second
    movsd xmm0, qword [%1]
    movsd xmm1, qword [%2]
    addsd xmm0, xmm1
    movsd qword [%1], xmm0
%endmacro

%macro my_mul_int 2 ; %1 = first, %2 = second
    mov rax, qword [%1]
    mul qword [%2]
    mov qword [%1], rax
%endmacro

%macro my_mul_int_2 3 ; %1 = first, %2 = second, %3 = result
    mov rax, qword [%1]
    mul qword [%2]
    mov qword [%3], rax
%endmacro

%macro mult_decimals 3 ; %1 = first, %2 = second, %3 = result
    movsd xmm0, qword [%1]
    movsd xmm1, qword [%2]
    mulsd xmm0, xmm1
    movsd qword [%3], xmm0
%endmacro

%macro int_to_double 1
    mov rax, qword [%1]
    cvtsi2sd xmm0, rax
    movsd qword [%1], xmm0
%endmacro
