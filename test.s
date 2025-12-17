section .data
	qn db 'hello', 10, 0
	len equ $ - qn
	la db 'stack1', 10, 0
	ls db 'stack2', 10, 0

section .bss
	count resb 1

section .text
	global _start

_start:
		push la
		push ls
		mov rax, 1
		mov rdi, 1
		mov rdx, 7
	.loop:
		pop rsi
		syscall
		mov rax, 1
		pop rsi
		syscall

		; inc rsi
		; mov r8b, byte [rsi]
		; test r8b, r8b
		; jne .loop

	mov rax, 60
	xor rdi, rdi
	syscall