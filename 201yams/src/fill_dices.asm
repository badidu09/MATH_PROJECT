BITS 64

%include "./src/utils.inc"
%include "./src/my_puts.inc"
%include "./src/data.inc"

[section .text]
    global fill_dices
    global atoi

atoi:
    mov rax, 0
    cmp rdi, 0
    je atoi_end

atoi_convert:
    movzx rsi, byte [rdi]
    cmp rsi, 0
    je atoi_end
    cmp rsi, 48
    jl atoi_error
    cmp rsi, 57
    jg atoi_error
    sub rsi, 48 ; rsi -= 48 (decimal)
    imul rax, 10 ; rax *= 10
    add rax, rsi
    inc rdi
    jmp atoi_convert

atoi_error:
    mov rax, 0

atoi_end:
    ret

fill_dices:
    push rbp
    mov rbp, rsp
    mov rcx, 1
    xor rdx, rdx
    jmp fill_dices_loop

fill_dices_loop:
    cmp rcx, 6
    jge fill_dices_end
    mov rdi, [argv + rcx * 8]
    call atoi
    mov [dices + rdx * 8], rax
    inc rcx
    inc rdx
    jmp fill_dices_loop

fill_dices_end:
    leave
    ret
