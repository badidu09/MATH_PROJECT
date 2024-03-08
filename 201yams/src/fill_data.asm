BITS 64

%include "./src/utils.inc"
%include "./src/my_puts.inc"
%include "./src/data.inc"

[section .text]
    global fill_data
    extern check_if_yams
    extern check_if_pair
    extern check_if_three
    extern check_if_four
    extern check_if_straight
    extern check_if_full
    extern fill_dices
    extern check_expected_nb
    extern get_nb_apparition

fill_data:
    push rbp
    mov rbp, rsp
    call fill_dices
    call check_if_yams
    call check_if_pair
    call check_if_three
    call check_if_four
    call check_if_straight
    call check_if_full
    call check_expected_nb
    call get_nb_apparition
    leave
    ret
