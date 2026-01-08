section .text
	global _start

_start:
	mov rdx, 0;clear dividend 
	mov rax, 32
	mov rcx, 10
	div rcx

	