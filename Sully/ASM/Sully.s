section .data
	qn db 'section .data@',10,'	qn db Q@',10,'	p_fl db 83,117,108,108,121,95,46,99,0@',10,'	p_nl db 64,39,44,49,48,44,39,0@',10,'	p_pnl db 35,39,44,92,10,9,49,48,44,39,0@',10,'	p_dnl db 33,39,44,49,48,44,49,48,44,39,0#',\
	10,'	p_quo db 39,0@',10,'	p_end db 39,44,48,0!',10,10,'section .bss@',10,'	is_print resb 1#',\
	10,'	msg resb 1!',10,10,'section .text@',10,'	global _start!',10,10,'write:@',10,'	syscall@',10,'	ret!',10,10,'print:@',10,'	add rbx, r9!',10,10,'write_loop:@',10,'	syscall@',10,'	inc rsi#',\
	10,'	mov r8b, byte [rsi]@',10,'	test r8b, r8b@',10,'	jne write_loop@',10,'	ret!',10,10,'eval:@',10,'	xor r8, r8@',10,'	lea r8, [rel loop]@',10,'	push r8@',10,'	mov r8b, [is_print]@',10,'	test r8b, r8b@',10,'	jne print#',\
	10,'	inc rbx@',10,'	jmp end_cond!',10,10,'p_33:@',10,'	mov rsi, p_dnl@',10,'	mov r9, 3@',10,'	jmp eval!',10,10,'p_35:@',10,'	mov rsi, p_pnl@',10,'	mov r9, 2@',10,'	jmp eval!',10,10,'p_64:@',10,'	mov rsi, p_nl@',10,'	mov r9, 2@',10,'	jmp eval!',10,10,'p_81:#',\
	10,'	mov r8b, byte [is_print]@',10,'	test r8b, r8b@',10,'	jnz end_cond@',10,'	mov [is_print], byte 1@',10,'	mov rbx, qn@',10,'	mov rsi, p_quo@',10,'	call write@',10,'	jmp end_cond!',10,10,'end_print:@',10,'	mov rsi, p_end@',10,'	call write_loop#',\
	10,'	lea rbx, [qn + 40]@',10,'	mov [is_print], byte 0@',10,'	jmp end_cond!',10,10,'_start:@',10,'	mov rax, 2@',10,'	mov rdi, p_fl@',10,'	mov rsi, 02 | 0100@',10,'	mov rdx, 0422@',10,'	syscall!',10,10,'	mov [is_print], byte 0#',\
	10,'	mov rbx, qn@',10,'	mov rdi, rax@',10,'	mov rax, 1@',10,'	mov rdx, 1!',10,10,'	loop:@',10,'		cmp [rbx], byte 33@',10,'		je p_33@',10,'		cmp [rbx], byte 35@',10,'		je p_35@',10,'		cmp [rbx], byte 64@',10,'		je p_64@',10,'		cmp [rbx], byte 81@',10,'		je p_81!',10,10,'		end_cond:!',10,10,'		mov rsi, rbx@',10,'		call write#',\
	10,'		inc rbx!',10,10,'		mov r8b, byte [rbx]@',10,'		test r8b, r8b@',10,'		jnz loop!',10,10,'		mov r8b, byte [is_print]@',10,'		test r8b, r8b@',10,'		jnz end_print!',10,10,'		mov rax, 60#',\
	10,'		xor rdi, rdi@',10,'		syscall',0
	p_nl db 64,39,44,49,48,44,39,0;new line
	p_pnl db 35,39,44,92,10,9,49,48,44,39,0;qn print new line 
	p_dnl db 33,39,44,49,48,44,49,48,44,39,0;double new line
	p_fl db 83,117,108,108,121,95,46,115,0;file name
	p_quo db 39,0;dbl quote
	p_end db 39,44,48,0;print end

section .bss
	file_name resq 1;
	is_print resb 1
	flnu_len resb 1
	init_int resb 1

section .text
	global _start

asmbl_fln:;this is no good because brk rdi is an adress not an int
	mov rax, 12
	xor rdi, rdi
	syscall
	push rax

	xor r8, r8
	mov r8b, byte [init_int]
	L1:
		inc flnu_len
		div r8b, 10
		test r8b, r8b
		jnz L1

	mov rdi, rax
	add rdi, 9 + flnu_len
	mov rax, 12
	syscall
	mov rax, p_fl

	pop rdi
	push rdi
	L2:
		mov cl, byte [rax]
		cmp cl, 46
		jne cont
		add rdi, byte [flnu_len]
		cont:
		mov [rdi], cl
		inc rdi
		test cl, cl
		jnz L2
	
	cmp init_int, 0
	jne J1
	mov [rdi+6], 48
	jmp J2
	J1:
	
	pop rdi 
	mov r8b, byte [init_int]
	mov r9b, byte [flnu_len]
	xor cl, cl
	L3:
		mov cl, byte 48 + [r8b % 10]
		mov [rdi+(6+(r9b-1))], cl
		div r8b, 10
		dec r9b
		test r8b, r8b
		jnz L3

	J2:
	ret

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
	jmp end_cond

end_print:
	mov rsi, p_end
	call write_loop
	lea rbx, [qn + 28]
	mov [is_print], byte 0
	jmp end_cond

_start:
	mov [init_int], byte 5

start_loop:
	call asmbl_fln

	mov rax, 2
	mov rsi, 02 | 0100
	mov rdx, 0422
	syscall

	mov rax, 12
	syscall

	mov [is_print], byte 0
	mov rbx, qn
	mov rdi, rax
	mov rax, 1
	mov rdx, 1

	loop:
		cmp [rbx], byte 33
		je p_33
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

		dec [init_int]
		mov r8b, [init_int]
		xor r8b, r8b
		jnz start_loop

		mov rax, 60
		xor rdi, rdi
		syscall