default rel

section .data
	sr db 'this is just \n a test!'
	len equ $ - sr

section .text
	global test

test:

	mov rax, 1
	mov rsi, sr
	mov rdx, len
	syscall


