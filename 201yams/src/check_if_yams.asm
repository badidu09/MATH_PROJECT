BITS 64

%include "./src/utils.inc"
%include "./src/my_puts.inc"
%include "./src/data.inc"

[section .rodata]
    yams:           db "yams_", 0
    yams_length:    equ $ - yams - 1

[section .text]
    global check_if_yams
    extern strncmp
    extern strlen
    extern bad_combination

set_to_true:
    mov rax, TRUE
    mov [is_yams], rax
    sub r9, 48
    mov [expected_nb], r9
    jmp end

check_if_yams:
    push rbp
    mov rbp, rsp
    mov rdi, [argv + 48]
    mov rsi, yams
    mov rdx, yams_length
    call strncmp
    cmp rax, 0
    jne end

    mov rax, [argv + 48]
    mov rdi, rax
    call strlen
    cmp rax, 6
    jne exit_with_error

    mov rax, [argv + 48]
    movzx r9, byte [rax + 5]
    cmp r9, 48
    jl exit_with_error
    cmp r9, 54
    jg exit_with_error
    jmp set_to_true

end:
    leave
    ret

exit_with_error:
    call bad_combination
