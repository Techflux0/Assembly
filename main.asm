

section .data
    msg db "Hello, World!", 10, 0         ; message + newline + null terminator

section .text
    extern printf
    global main

main:
    sub rsp, 40       
    lea rcx, [rel msg]  
    call printf
    add rsp, 40
    ret
