section .data
    fmt db "Result is: %d", 10, 0
    num1 dq 20
    num2 dq 22

section .text
    extern printf
    global main

main:
    sub rsp, 40
    mov rax, [rel num1]
    add rax, [rel num2]
    mov rcx, fmt
    mov rdx, rax
    call printf
    add rsp, 40
    ret
