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
		mov bx, 1
		mov rcx, qn
		mov cl, byte [rcx]
		test bx, bx
		mov rbx, [count]
		mov rax, 1
		mov rdi, 1
		mov rdx, 1
	.loop:

		syscall
		; inc rsi
		; mov r8b, byte [rsi]
		; test r8b, r8b
		; jne .loop

	mov rax, 60
	xor rdi, rdi
	syscall
