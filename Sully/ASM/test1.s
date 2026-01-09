
section .bss
    init_int resq 1
    flnu_len resb 1
section .text
    global _start

_start:
    mov rax, 5
    mov rcx, 0xa
    div rcx
    ; xor rdx, -1

    ; mov qword [init_int], 2425
    ; mov [flnu_len], byte 4
	; mov r8b, byte [init_int]
	; mov r9b, byte [flnu_len]
    ; xor rax, rax

    ; mov al, r8b   	; dividend
    ; mov rcx, 0xa   ; divisor
    ; div rcx         ; RAX = re
