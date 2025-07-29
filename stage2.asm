
BITS 16
ORG 0x8000

start:
    mov si, msg
.print:
    lodsb
    or al, al
    jz $
    mov ah, 0x0E
    int 0x10
    jmp .print

msg db "Stage 2 loaded!", 0
