BITS 64

%include "./src/utils.inc"
%include "./src/my_puts.inc"

[section .rodata]
    argtest: db "-h", 0x0a, 0
    argtest_len: equ $ - argtest
    msg: db "USAGE", 0x0a, 0
    msg2: db "    ./201yams d1 d2 d3 d4 d5 c", 0x0a, 0
    msg3: db "DESCRIPTION", 0x0a, 0
    msg4: db "    d1   value of the first die (0 if not thrown)", 0x0a, 0
    msg5: db "    d2   value of the second die (0 if not thrown)", 0x0a, 0
    msg6: db "    d3   value of the third die (0 if not thrown)", 0x0a, 0
    msg7: db "    d4   value of the fourth die (0 if not thrown)", 0x0a, 0
    msg8: db "    d5   value of the fifth die (0 if not thrown)", 0x0a, 0
    msg9: db "    c    expected combination", 0x0a, 0
    msg_len: equ $ - msg

[section .text]
    global help_yams

help_yams:
    push rbp
    mov rbp, rsp

    mov rdi, argtest

    cmp BYTE [rdi + 0], '-'
    jne .end
    cmp BYTE [rdi + 1], 'h'
    jne .end
    puts msg, msg_len
    leave
    ret

.end:
    leave   
    ret
