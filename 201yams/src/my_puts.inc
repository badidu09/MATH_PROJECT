BITS 64

%define STDOUT 1
%define SYS_WRITE 1

[section .rodata]
    format_number db "%d", 0
    format_string db "%s", 0
    format_double db "%0.2f", 0
    newline db 10, 0

[section .text]
    extern printf

%macro puts 2
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, %1
    mov rdx, %2
    syscall
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, NEWLINE
    mov rdx, 1
    syscall
%endmacro

%macro my_putnbr 1
    save_all_registers
    mov     rdi, format_number
    mov     rsi, %1
    xor     rax, rax
    call    printf
    flushAllStreams
    restore_all_registers
%endmacro

%macro my_putstr 1
    save_all_registers
    mov     rdi, format_string
    mov     rsi, %1
    xor     rax, rax
    call    printf
    flushAllStreams
    restore_all_registers
%endmacro

%macro my_putnewline 0
    save_all_registers
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, newline
    mov rdx, 1
    syscall
    restore_all_registers
%endmacro

%macro custum_print 3
    save_all_registers
    mov rdi, %1
    mov rsi, %2
    movsd xmm0, [%3]
    movq rdx, xmm0
    call printf
    flushAllStreams
    restore_all_registers
%endmacro

%macro custum_print_full 4
    save_all_registers
    mov rdi, %1
    mov rsi, %2
    mov rdx, %3
    movsd xmm0, [%4]
    movq r8, xmm0
    call printf
    flushAllStreams
    restore_all_registers
%endmacro
