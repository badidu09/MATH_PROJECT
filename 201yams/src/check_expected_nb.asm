BITS 64

%include "./src/utils.inc"
%include "./src/my_puts.inc"
%include "./src/data.inc"

[section .text]
    global check_expected_nb
    extern bad_combination

check_full_dice:
    mov r10, [expected_nb + 8]
    cmp r10, 0
    jle exit_with_error
    cmp r10, 6
    jg exit_with_error
    jmp end_of_check

check_expected_nb:
    push rbp
    mov rbp, rsp
    mov r9, [expected_nb]
    cmp r9, 0
    jle exit_with_error
    cmp r9, 6
    jg exit_with_error
    mov r8, [is_full]
    cmp r8, TRUE
    je check_full_dice
    jmp end_of_check

exit_with_error:
    call bad_combination

end_of_check:
    leave
    ret
