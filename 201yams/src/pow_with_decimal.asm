[section .rodata]
    one: dq 1.00
    zero: dq 0.00

[section .text]
    global pow_double

pow_double: ;take xmm0 as base, xmm1 as exponent
    push rbp
    mov rbp, rsp
    movsd xmm2, [one]
    ucomisd xmm1, [zero]
    jbe return_1
    ucomisd xmm0, [zero]
    je return_1
    mulsd xmm2, xmm0

my_pow_loop:
    ucomisd xmm1, [one]
    jle my_pow_end
    mulsd xmm2, xmm0
    subsd xmm1, [one]
    jmp my_pow_loop

my_pow_end:
    movsd xmm0, xmm2
    leave
    ret

return_1:
    movsd xmm0, xmm2
    leave
    ret
