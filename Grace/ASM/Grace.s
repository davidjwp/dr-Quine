%macro start 0
section .data
	qn db 'section .data@',10,'	qn db Q@',10,'	p_nl db 64,39,44,49,48,44,39,0*',\
	10,'	p_pnl db 42,39,44,92,10,9,49,48,44,39,0@',10,'	p_dnl db 33,39,44,49,48,44,49,48,44,39,0*',\
	10,'	p_com db 38,39,44,53,57,44,39,0@',10,'	p_quo db 39,0@',10,'	p_end db 39,44,48,0!',10,10,'section .bss*',\
	10,'	is_print resb 1!',10,10,'section .text@',10,'	global _start!',10,10,'write:@',10,'	syscall*',\
	10,'	ret!',10,10,'print:@',10,'	add rbx, r9!',10,10,'write_loop:@',10,'&',59,'comment@',10,'	syscall@',10,'	inc rsi*',\
	10,'	mov r8b, byte [rsi]@',10,'	test r8b, r8b@',10,'	jne write_loop@',10,'	ret!',10,10,'eval:@',10,'	xor r8, r8*',\
	10,'	lea r8, [rel loop]@',10,'	push r8@',10,'	mov r8b, [is_print]@',10,'	test r8b, r8b@',10,'	jne print*',\
	10,'	inc rbx@',10,'	jmp end_cond!',10,10,'p_33:@',10,'	mov rsi, p_dnl@',10,'	mov r9, 3@',10,'	jmp eval!',10,10,'p_38:*',\
	10,'	mov rsi, p_com@',10,'	mov r9, 2@',10,'	jmp eval!',10,10,'p_42:@',10,'	mov rsi, p_pnl*',\
	10,'	mov r9, 2@',10,'	jmp eval!',10,10,'p_64:@',10,'	mov rsi, p_nl@',10,'	mov r9, 2*',\
	10,'	jmp eval!',10,10,'p_81:@',10,'	mov r8b, byte [is_print]@',10,'	test r8b, r8b@',10,'	jnz end_cond*',\
	10,'	mov [is_print], byte 1@',10,'	mov rbx, qn@',10,'	mov rsi, p_quo@',10,'	call write*',\
	10,'	jmp end_cond!',10,10,'end_print:@',10,'	mov rsi, p_end@',10,'	call write_loop@',10,'	lea rbx, [qn + 24]*',\
	10,'	mov [is_print], byte 0@',10,'	jmp end_cond!',10,10,'_start:@',10,'	mov [is_print], byte 0*',\
	10,'	mov rbx, qn@',10,'	mov rax, [out]@',10,'	mov rdi, 1@',10,'	mov rdx, 1!',10,10,'	loop: &',59,'comment!',10,10,'		cmp [rbx], byte 33*',\
	10,'		je p_33@',10,'		cmp [rbx], byte 38@',10,'		je p_38@',10,'		cmp [rbx], byte 42*',\
	10,'		je p_42@',10,'		cmp [rbx], byte 64@',10,'		je p_64@',10,'		cmp [rbx], byte 81*',\
	10,'		je p_81!',10,10,'		end_cond:!',10,10,'		mov rsi, rbx@',10,'		call write*',\
	10,'		inc rbx!',10,10,'		mov r8b, byte [rbx]@',10,'		test r8b, r8b@',10,'		jnz loop!',10,10,'		mov r8b, byte [is_print]*',\
	10,'		test r8b, r8b@',10,'		jnz end_print!',10,10,'		&',59,'comment@',10,'		mov rax, 60*',\
	10,'		xor rdi, rdi@',10,'		syscall',0
	p_nl db 64,39,44,49,48,44,39,0
	p_pnl db 42,39,44,92,10,9,49,48,44,39,0
	p_dnl db 33,39,44,49,48,44,49,48,44,39,0
	p_com db 38,39,44,53,57,44,39,0
	p_quo db 39,0
	p_end db 39,44,48,0
	file_name db 46,47,71,114,97,99,101,95,107,105,100,46,99,0

section .bss
	is_print resb 1

section .text
	global _start

write:
	syscall
	ret

print:
	add rbx, r9

write_loop:
;comment
	syscall
	inc rsi
	mov r8b, byte [rsi]
	test r8b, r8b
	jne write_loop
	ret

eval:
	xor r8, r8
	lea r8, [rel loop]
	push r8
	mov r8b, [is_print]
	test r8b, r8b
	jne print
	inc rbx
	jmp end_cond

p_33:
	mov rsi, p_dnl
	mov r9, 3
	jmp eval

p_38:
	mov rsi, p_com
	mov r9, 2
	jmp eval

p_42:
	mov rsi, p_pnl
	mov r9, 2
	jmp eval

p_64:
	mov rsi, p_nl
	mov r9, 2
	jmp eval

p_81:
	mov r8b, byte [is_print]
	test r8b, r8b
	jnz end_cond
	mov [is_print], byte 1
	mov rbx, qn
	mov rsi, p_quo
	call write
	jmp end_cond

end_print:
	mov rsi, p_end
	call write_loop
	lea rbx, [qn + 24]
	mov [is_print], byte 0
	jmp end_cond

_start:
	mov rax, 2
	mov rdi, file_name
	mov rbx, 02 | 0100
	mov rdx, 0644
	syscall

	mov [is_print], byte 0
	mov rdi, 1
	mov rbx, qn
	mov rdx, 1

	loop: ;comment

		cmp [rbx], byte 33
		je p_33
		cmp [rbx], byte 38
		je p_38
		cmp [rbx], byte 42
		je p_42
		cmp [rbx], byte 64
		je p_64
		cmp [rbx], byte 81
		je p_81

		end_cond:

		mov rsi, rbx
		call write
		inc rbx

		mov r8b, byte [rbx]
		test r8b, r8b
		jnz loop

		mov r8b, byte [is_print]
		test r8b, r8b
		jnz end_print

		;comment
		mov rax, 60
		xor rdi, rdi
		syscall
%endmacro

start