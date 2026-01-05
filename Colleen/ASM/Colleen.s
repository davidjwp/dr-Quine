/*
	comment 2
*/
section .data
	qn db '&',47,42,10,'	comment 2&',10,42,47,10,'section .data@',10,'	qn db Q@',10,'	p_nl db 64,39,44,49,48,44,39,0@',10,'	p_pnl db 35,39,44,92,10,9,49,48,44,39,0@',10,'	p_dnl db 33,39,44,49,48,44,49,48,44,39,0#',\
	10,'	p_com_open db 38,39,44,52,55,44,52,50,44,49,48,44,39,0@',10,'	p_com_clos db 38,39,44,49,48,44,52,50,44,52,55,44,49,48,44,39,0@',10,'	p_quo db 39,0#',\
	10,'	p_end db 39,44,48,0!',10,10,'section .bss@',10,'	is_print resb 1@',10,'	msg resb 1!',10,10,'section .text@',10,'	global _start!',10,10,'write:@',10,'	syscall#',\
	10,'	ret!',10,10,'print:@',10,'	add rbx, r9!',10,10,'write_loop:@',10,'	syscall@',10,'	inc rsi#',\
	10,'	mov r8b, byte [rsi]@',10,'	test r8b, r8b@',10,'	jne write_loop@',10,'	ret!',10,10,'eval:@',10,'	xor r8, r8@',10,'	lea r8, [rel loop]#',\
	10,'	push r8@',10,'	mov r8b, [is_print]@',10,'	test r8b, r8b@',10,'	jne print@',10,'	inc rbx@',10,'	jmp end_cond!',10,10,'p_33:@',10,'	mov rsi, p_dnl#',\
	10,'	mov r9, 3@',10,'	jmp eval!',10,10,'p_38:@',10,'	inc rbx@',10,'	xor r8, r8@',10,'	mov r8b, [is_print]@',10,'	test r8b, r8b@',10,'	jz end_cond@',10,'	lea r8, [end_cond]#',\
	10,'	push r8@',10,'	xor r8, r8@',10,'	mov r8b, [msg]@',10,'	test r8b, r8b@',10,'	jnz p_com_c@',10,'	mov [msg], byte 1@',10,'	jmp p_com_o!',10,10,'p_com_o:@',10,'	mov rsi, p_com_open@',10,'	mov r9, 3@',10,'	jmp print!',10,10,'p_com_c:#',\
	10,'	mov [msg], byte 0@',10,'	mov rsi, p_com_clos@',10,'	mov r9, 4@',10,'	jmp print!',10,10,'p_35:@',10,'	mov rsi, p_pnl@',10,'	mov r9, 2@',10,'	jmp eval!',10,10,'p_64:#',\
	10,'	mov rsi, p_nl@',10,'	mov r9, 2@',10,'	jmp eval!',10,10,'p_81:@',10,'	mov r8b, byte [is_print]@',10,'	test r8b, r8b@',10,'	jnz end_cond@',10,'	mov [is_print], byte 1#',\
	10,'	mov rbx, qn@',10,'	mov rsi, p_quo@',10,'	call write@',10,'	jmp loop!',10,10,'end_print:@',10,'	mov rsi, p_end@',10,'	call write_loop@',10,'	lea rbx, [qn + 42]#',\
	10,'	mov [is_print], byte 0@',10,'	jmp loop!',10,10,'_start:@',10,'	mov [is_print], byte 0@',10,'	mov [msg], byte 0@',10,'	mov rbx, qn@',10,'	mov rax, 1@',10,'	mov rdi, 1#',\
	10,'	mov rdx, 1!',10,10,'	loop: &',47,42,10,'	comment 1&',10,42,47,10,'		cmp [rbx], byte 33@',10,'		je p_33@',10,'		cmp [rbx], byte 38@',10,'		je p_38#',\
	10,'		cmp [rbx], byte 35@',10,'		je p_35@',10,'		cmp [rbx], byte 64@',10,'		je p_64@',10,'		cmp [rbx], byte 81@',10,'		je p_81!',10,10,'		end_cond:!',10,10,'		mov rsi, rbx#',\
	10,'		call write@',10,'		inc rbx!',10,10,'		mov r8b, byte [rbx]@',10,'		test r8b, r8b@',10,'		jnz loop!',10,10,'		mov r8b, byte [is_print]@',10,'		test r8b, r8b#',\
	10,'		jnz end_print!',10,10,'		mov rax, 60@',10,'		xor rdi, rdi@',10,'		syscall',0
	p_nl db 64,39,44,49,48,44,39,0
	p_pnl db 35,39,44,92,10,9,49,48,44,39,0
	p_dnl db 33,39,44,49,48,44,49,48,44,39,0
	p_com_open db 38,39,44,52,55,44,52,50,44,49,48,44,39,0
	p_com_clos db 38,39,44,49,48,44,52,50,44,52,55,44,49,48,44,39,0
	p_quo db 39,0
	p_end db 39,44,48,0

section .bss
	is_print resb 1
	msg resb 1

section .text
	global _start

write:
	syscall
	ret

print:
	add rbx, r9

write_loop:
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
	inc rbx
	xor r8, r8
	mov r8b, [is_print]
	test r8b, r8b
	jz end_cond
	lea r8, [end_cond]
	push r8
	xor r8, r8
	mov r8b, [msg]
	test r8b, r8b
	jnz p_com_c
	mov [msg], byte 1
	jmp p_com_o

p_com_o:
	mov rsi, p_com_open
	mov r9, 3
	jmp print

p_com_c:
	mov [msg], byte 0
	mov rsi, p_com_clos
	mov r9, 4
	jmp print

p_35:
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
	jmp loop

end_print:
	mov rsi, p_end
	call write_loop
	lea rbx, [qn + 42]
	mov [is_print], byte 0
	jmp loop

_start:
	mov [is_print], byte 0
	mov [msg], byte 0
	mov rbx, qn
	mov rax, 1
	mov rdi, 1
	mov rdx, 1

	loop: /*
	comment 1
*/
		cmp [rbx], byte 33
		je p_33
		cmp [rbx], byte 38
		je p_38
		cmp [rbx], byte 35
		je p_35
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

		mov rax, 60
		xor rdi, rdi
		syscall