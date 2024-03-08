BITS 64

%include "./src/utils.inc"
%include "./src/my_puts.inc"
%include "./src/data.inc"

[section .data]
    argc:           dq 0
    argv:           dq 0, 0, 0, 0, 0, 0, 0, 0

    dices:          dq 0, 0, 0, 0, 0
    expected_nb:    dq 0, 0, 0
    nb_apparition:  dq 0, 0
    full_house:     dq 0, 0

    is_pair:        dq FALSE
    is_three:       dq FALSE
    is_four:        dq FALSE
    is_full:        dq FALSE
    is_yams:        dq FALSE
    is_straight:    dq FALSE

[section .text]
    global main
    extern error_handler
    extern printf
    extern atoi
    extern fill_argv
    extern fill_data
    extern compute
    extern check_int

main:
    push rbp
    mov rbp, rsp
    mov [argc], rdi
    call error_handler
    call fill_argv
    call check_int
    call fill_data
    call compute
    exit 0
