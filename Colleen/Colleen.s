section .data
	qn db 'section .data@', 10, '	qn db Q@', 10, '	len equ $ - qn*', \
	10, 10, 'section .bss@', 10, '	count resb 1@', 10, '	is_print resb 1*', \
	10, 10, 'section .text@', 10, '	global _main@', 10, ''
	len equ $ - qn

section .bss
	count resb 1
	is_print resb 1

section .text
	global _main

if_@: ; newline

if_Q: ; print qn as literal 

if_*: ; print newline + '\' characters

write:
	; comment 2
	mov rax, 1
	mov rdi, 1
	mov rdx, 1
	pop rsi

write_loop:
	syscall
	inc rsi
	push [ip] + 1
	jne write_loop
	ret

.loop:
	cmp (qn + counter), 42
	call write

_main:
	jmp .loop

; comment 1