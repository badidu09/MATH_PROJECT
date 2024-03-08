BITS 64

%include "./src/utils.inc"
%include "./src/my_puts.inc"
%include "./src/data.inc"

[section .rodata]
    pair:           db "pair_", 0
    pair_length:    equ $ - pair - 1

[section .text]
    global check_if_pair
    extern strncmp
    extern strlen
    extern bad_combination

set_to_true:
    mov rax, TRUE
    mov [is_pair], rax
    sub r9, 48
    mov [expected_nb], r9
    jmp end

check_if_pair:
    push rbp
    mov rbp, rsp
    mov rdi, [argv + 48]
    mov rsi, pair
    mov rdx, pair_length
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