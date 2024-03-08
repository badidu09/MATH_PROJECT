BITS 64

[section .text]
    global my_factorial

my_factorial:
    mov rax, 1
    mov rcx, r8
factorial_loop:
    cmp rcx, 0
    jle factorial_end
    imul rax, rcx
    sub rcx, 1
    jmp factorial_loop
factorial_end:
    ret
