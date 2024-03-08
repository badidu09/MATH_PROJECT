BITS 64

%include "./src/utils.inc"
%include "./src/my_puts.inc"
%include "./src/data.inc"

[section .rodata]
    full:           db "full_", 0
    full_length:    equ $ - full - 1

[section .text]
    global check_if_full
    extern strncmp
    extern strlen
    extern bad_combination

set_to_true:
    mov rax, TRUE
    mov [is_full], rax
    sub r9, 48
    sub r8, 48
    cmp r9, r8
    je exit_with_error
    mov [expected_nb], r9
    mov [expected_nb + 8], r8
    jmp end

check_if_full:
    push rbp
    mov rbp, rsp
    mov rdi, [argv + 48]
    mov rsi, full
    mov rdx, full_length
    call strncmp
    cmp rax, 0
    jne end

    mov rax, [argv + 48]
    mov rdi, rax
    call strlen
    cmp rax, 8
    jne exit_with_error

    mov rax, [argv + 48]
    movzx r9, byte [rax + 5]
    movzx r8, byte [rax + 7]
    movzx rcx, byte [rax + 6]
    cmp r9, 48
    jl exit_with_error
    cmp r9, 54
    jg exit_with_error
    cmp r8, 48
    jl exit_with_error
    cmp r8, 54
    jg exit_with_error
    cmp rcx, 95
    jne exit_with_error
    jmp set_to_true

end:
    leave
    ret

exit_with_error:
    call bad_combination
