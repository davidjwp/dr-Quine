section .data
	qn db 'section .data@',10,'	qn db Q@',10,'	p_nl db 64,39,44,49,48,44,39*',\
	10,'	p_pnl db 42,39,44,92,10,49,48,44,39@',10,'	p_dnl db 33,39,44,49,48,44,49,48,44,39*',\
	10,'	p_com db 38,39,44,53,57,44,39@',10,'	p_quo db 39,0!',10,10,'section .bss*',\
	10,'	is_print resb 1!',10,10,'section .text@',10,'	global _main!',10,10,'write:@',10,'	syscall*',\
	10,'	ret!',10,10,'print:@',10,'	pop rsi@',10,'	syscall@',10,'	mov rax,1@',10,'	inc bx, r9b*',\
	10,'	'
	p_nl db 64,39,44,49,48,44,39;'@'
	p_pnl db 42,39,44,92,10,9,49,48,44,39 ;'*'
	p_dnl db 33,39,44,49,48,44,49,48,44,39 ;'!'
	p_com db 38,39,44,53,57,44,39;'&' for comments like so= &',59,'
	p_quo db 39,0; for quotes

section .bss
	is_print resb 1

section .text
	global _main

write:
	syscall
	ret

print:
	pop rsi
	syscall 
	mov rax, 1
	add bx, r9b; HERE
	add rcx, rbx

write_loop:
;comment
	syscall
	inc rsi
	movzx r8b, byte [rsi]
	test r8b, r8b
	jne .write_loop
	ret

;33=! 42=* 64=@ 81=Q 92=\
;constant reg: rax,rdi,rdx
;semi constant reg: bx,rcx

.eval:
	lea r8, [rel .loop]		; take ret addr
	push r8					; push ret addr and string
	mov r8b, [is_print]		; check if print literal
	test r8b, r8b
	jne print

	inc rcx				; if not print continue print
	jmp end_cond			; return

.p_33:
	push p_dnl
	mov r9b, 3
	jmp eval

.p_42:
	push p_pnl
	mov r9b, 2
	jmp eval

.p_64:
	push p_nl
	mov r9b, 2
	jmp eval

.p_81:
	mov [is_print], byte 1	; set print
	mov rcx, qn				; reset string
	mov rsi, p_quo			; write quote
	call write
	jmp loop				; jump back

_main:
	mov [count], byte 0
	mov [is_print], byte 0
	mov rcx, qn
	mov rax, 1
	mov rdi, 1
	mov rdx, 1

	.loop: ;comment

		cmp [rcx], byte 33
		je p_33
		cmp [rcx], byte 42
		je p_42
		cmp [rcx], byte 64
		je p_64
		cmp [rcx], byte 81
		je p_81
		
		.end_cond:

		mov rsi, rcx
		call write
		inc rcx

		mov bx, byte [rcx]
		test bx, bx
		je loop

;comment
	mov rax, 60
	xor rdi, rdi
	syscall