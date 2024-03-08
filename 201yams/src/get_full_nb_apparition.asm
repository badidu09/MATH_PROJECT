BITS 64

%include "./src/utils.inc"
%include "./src/my_puts.inc"
%include "./src/data.inc"

[section .text]
    global get_full_nb_apparition

get_full_nb_apparition:
    push rbp
    mov rbp, rsp
    xor rcx, rcx
    xor rdx, rdx 
    mov rax, [nb_apparition]
    add rax, 0
    mov [nb_apparition], rax
    jmp check_three

inc_counter_three:
    inc rdx
    mov rax, [nb_apparition]
    add rax, 1
    mov rax, [full_house]
    add rax, 1
    mov [full_house], rax
    mov [nb_apparition], rax
    jmp check_three

check_three:
    cmp rcx, 5
    jge reset_val
    cmp rdx, 3
    jge reset_val
    mov r8, [dices + rcx * 8]
    mov r9, [expected_nb]
    inc rcx
    cmp r8, r9
    je inc_counter_three
    jmp check_three

reset_val:
    xor rdx, rdx
    xor rcx, rcx
    jmp check_pair

inc_counter_pair:
    inc rdx
    mov rax, [nb_apparition]
    add rax, 1
    mov rax, [full_house + 8]
    add rax, 1
    mov [full_house + 8], rax
    mov [nb_apparition], rax
    jmp check_pair

check_pair:
    cmp rcx, 5
    jge fnc_end
    cmp rdx, 2
    jge fnc_end
    mov r8, [dices + rcx * 8]
    mov r9, [expected_nb + 8]
    inc rcx
    cmp r8, r9
    je inc_counter_pair
    jmp check_pair

fnc_end:
    leave
    ret
