BITS 64

%include "./src/utils.inc"
%include "./src/my_puts.inc"
%include "./src/data.inc"

[section .text]
    global compute
    extern compute_straight
    extern compute_pair
    extern compute_three
    extern compute_four
    extern compute_full
    extern compute_yams
    extern compute_four

call_compute_four:
    call compute_four

call_compute_yams:
    call compute_yams

call_compute_pair:
    call compute_pair

call_compute_three:
    call compute_three

call_compute_straight:
    call compute_straight

call_compute_full:
    call compute_full

compute:
    push rbp
    mov rbp, rsp

    mov rax, [is_pair]
    cmp rax, TRUE
    je call_compute_pair

    mov rax, [is_three]
    cmp rax, TRUE
    je call_compute_three

    mov rax, [is_four]
    cmp rax, TRUE
    je call_compute_four

    mov rax, [is_full]
    cmp rax, TRUE
    je call_compute_full

    mov rax, [is_yams]
    cmp rax, TRUE
    je call_compute_yams

    mov rax, [is_straight]
    cmp rax, TRUE
    je call_compute_straight

compute_end:
    leave
    ret
