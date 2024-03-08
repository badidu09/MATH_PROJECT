BITS 64

%include "./src/utils.inc"
%include "./src/my_puts.inc"
%include "./src/data.inc"

[section .rodata]
    straight:           db "straight_", 0
    straight_length:    equ $ - straight - 1

[section .text]
    global check_if_straight
    extern strncmp
    extern strlen
    extern bad_combination

set_to_true:
    mov rax, TRUE
    mov [is_straight], rax
    sub r9, 48
    mov [expected_nb], r9
    jmp end

check_if_straight:
    push rbp
    mov rbp, rsp
    mov rdi, [argv + 48]
    mov rsi, straight
    mov rdx, straight_length
    call strncmp
    cmp rax, 0
    jne end

    mov rax, [argv + 48]
    mov rdi, rax
    call strlen
    cmp rax, 10
    jne bad_combination

    mov rax, [argv + 48]
    movzx r9, byte [rax + 9]
    cmp r9, 53
    jl bad_combination
    cmp r9, 54
    jg bad_combination
    jmp set_to_true

end:
    leave
    ret

exit_with_error:
    call bad_combination
