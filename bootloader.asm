BITS 16
ORG 0x7C00

start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00

    mov si, msg
.print:
    lodsb
    or al, al
    jz .done
    mov ah, 0x0E
    int 0x10
    jmp .print

.done:
    mov ah, 0x02
    mov al, 1
    mov ch, 0
    mov cl, 2
    mov dh, 0
    mov dl, 0x80
    mov bx, 0x8000
    mov es, bx
    xor bx, bx
    int 0x13

    jc fail

    jmp 0x8000

fail:
    mov si, fail_msg
.fail_print:
    lodsb
    or al, al
    jz $
    mov ah, 0x0E
    int 0x10
    jmp .fail_print

msg db "Loading Stage 2...", 0
fail_msg db "Disk read error!", 0

times 510 - ($ - $$) db 0
dw 0xAA55
