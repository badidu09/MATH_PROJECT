BITS 64

%include "./src/utils.inc"
%include "./src/my_puts.inc"
%include "./src/data.inc"

[section .rodata]
    bad_combi: db "Wrong arguments bro", 0x0a, 0
    short_usage: db "Bad arguments, try ./201yams -h", 0x0a, 0
    len_short_usage: equ $ - short_usage - 1
    msg_usage: db "USAGE", 0x0a, "    ./201yams d1 d2 d3 d4 d5 c", 0x0a, "DESCRIPTION", 0x0a, "    d1   value of the first die (0 if not thrown)", 0x0a, "    d2   value of the second die (0 if not thrown)", 0x0a, "    d3   value of the third die (0 if not thrown)", 0x0a, "    d4   value of the fourth die (0 if not thrown)", 0x0a, "    d5   value of the fifth die (0 if not thrown)", 0x0a, "    c    expected combination", 0x0a, 0
    len_usage: equ $ - msg_usage - 1

[section .text]
    global error_handler
    global bad_combination
    global check_int

no_arguments:
    puts short_usage, len_short_usage
    exit 84

error_handler:
    push rbp
    mov rbp, rsp
    mov rcx, [argc]
    cmp rcx, 1
    jle no_arguments
    cmp rcx, 2

    mov r8, [rsi + 8]
    mov r9, [rsi + 16]
    cmp BYTE [r8 + 0], '-'
    jne continue
    cmp BYTE [r8 + 1], 'h'
    jne continue
    cmp BYTE [r8 + 2], 0
    jne bad_combination
    cmp r9, 0
    jne bad_combination

    puts msg_usage, len_usage
    exit 0


continue:
    mov r9, [argc]
    cmp r9, 7
    jne bad_combination
    leave
    ret

bad_combination:
    my_putstr bad_combi 
    exit 84

check_int:
    push rbp
    mov rbp, rsp
    mov rcx, 8

check_int_loop:
    mov r8, [argv + rcx]
    cmp BYTE [r8], '0'
    jl bad_combination
    cmp BYTE [r8], '6'
    jg bad_combination
    cmp BYTE [r8 + 1], 0
    jne bad_combination
    add rcx, 8
    cmp rcx, 48
    jne check_int_loop
    leave
    ret
