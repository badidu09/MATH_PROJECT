BITS 64

%include "./src/utils.inc"
%include "./src/my_puts.inc"
%include "./src/data.inc"

[section .text]
    global fill_argv

fill_argv:
    push rbp
    mov rbp, rsp
    xor rcx, rcx

fill_argv_loop:
    mov r9, [rsi + rcx * 8]
    mov [argv + rcx * 8], r9
    inc rcx
    cmp rcx, 6
    jg fill_argv_end
    jmp fill_argv_loop

fill_argv_end:
    leave
    ret
