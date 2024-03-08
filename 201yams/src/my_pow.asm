BITS 64

[section .text]
    global my_pow

my_pow:
    mov rax, 1
    mov rcx, rsi
pow_loop:
    cmp rcx, 0
    jle pow_end
    imul rax, r8
    sub rcx, 1
    jmp pow_loop
pow_end:
    ret
