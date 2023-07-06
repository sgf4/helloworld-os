[bits 16]
[org 0x7c00]

jmp start

hello_str: db "Hello world OS", 0

print_string:
    push bp
    mov bp, sp
    mov bx, [bp+4]
    .loop:
        mov al, [bx]
        cmp al, 0
        je .endloop    
        mov ah, 0x0e
        int 0x10
        inc bx
        jmp .loop
    .endloop:
    pop bp
    ret


start:
    mov bp, 0x8000
    mov sp, bp
    push hello_str
    call print_string
    jmp $

times 510-($-$$) db 0
dw 0xaa55

