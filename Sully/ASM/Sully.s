section .data
	qn db 'section .data@',10,'	qn db Q@',10,'	p_nl db 64,39,44,49,48,44,39,0@',10,'	p_pnl db 35,39,44,92,10,9,49,48,44,39,0#',\
	10,'	p_dnl db 33,39,44,49,48,44,49,48,44,39,0@',10,'	p_fl db 83,117,108,108,121,95,46,115,0@',10,'	p_quo db 39,0#',\
	10,'	p_end db 39,44,48,0!',10,10,'section .bss@',10,'	flnu resq 1@',10,'	init_int resq 1@',10,'	is_print resb 1#',\
	10,'	flnu_len resb 1!',10,10,'section .text@',10,'	global _start!',10,10,'divide:@',10,'	xor rdx, rdx@',10,'	xor rax, rax#',\
	10,'	mov rax, r8@',10,'	mov rcx, 0xa@',10,'	div rcx@',10,'	ret!',10,10,'asmbl_fln:@',10,'	mov rax, 12@',10,'	xor rdi, rdi#',\
	10,'	syscall@',10,'	push rax@',10,'	mov rdi, rax!',10,10,'	xor rax, rax@',10,'	mov rax, qword [init_int]@',10,'	L1:#',\
	10,'		inc byte [flnu_len]@',10,'		xor rdx, rdx@',10,'		mov rcx, 0xa@',10,'		div rcx@',10,'		test al, al#',\
	10,'		jnz L1!',10,10,'	mov bl, byte [flnu_len]@',10,'	add rdi, 9@',10,'	add rdi, rbx@',10,'	mov rax, 12@',10,'	syscall#',\
	10,'	mov rax, p_fl!',10,10,'	pop rdi@',10,'	push rdi@',10,'	L2:@',10,'		mov cl, byte [rax]@',10,'		cmp cl, 46#',\
	10,'		jne cont@',10,'		add rdi, [flnu_len]@',10,'		cont:@',10,'		mov [rdi], byte cl@',10,'		inc rdi@',10,'		inc rax#',\
	10,'		test cl, cl@',10,'		jnz L2@',10,'	xor rax, rax@',10,'	pop rdi!',10,10,'	cmp [init_int], byte 0@',10,'	jne J1#',\
	10,'	mov byte [rdi+6], 48@',10,'	ret@',10,'	J1:@',10,'	mov r8, qword [init_int]@',10,'	mov r9b, byte [flnu_len]!',10,10,'	L3:#',\
	10,'		call divide!',10,10,'		add rdx, 48@',10,'		lea rax, [r9 + 5]@',10,'		mov byte [rdi + rax], dl!',10,10,'		call divide#',\
	10,'		xor rdx, rdx@',10,'		mov r8, rax!',10,10,'		dec r9b@',10,'		test r8b, r8b@',10,'		jnz L3!',10,10,'	mov [flnu], rdi#',\
	10,'	ret!',10,10,'write:@',10,'	syscall@',10,'	ret!',10,10,'print:@',10,'	add rbx, r9!',10,10,'write_loop:@',10,'	syscall@',10,'	inc rsi#',\
	10,'	mov r8b, byte [rsi]@',10,'	test r8b, r8b@',10,'	jne write_loop@',10,'	ret!',10,10,'eval:@',10,'	xor r8, r8@',10,'	lea r8, [rel loop]#',\
	10,'	push r8@',10,'	mov r8b, [is_print]@',10,'	test r8b, r8b@',10,'	jne print@',10,'	inc rbx@',10,'	pop r8@',10,'	jmp end_cond!',10,10,'p_33:#',\
	10,'	mov rsi, p_dnl@',10,'	mov r9, 3@',10,'	jmp eval!',10,10,'p_35:@',10,'	mov rsi, p_pnl@',10,'	mov r9, 2@',10,'	jmp eval!',10,10,'p_64:#',\
	10,'	mov rsi, p_nl@',10,'	mov r9, 2@',10,'	jmp eval!',10,10,'p_73:@',10,'	lea rsi, [flnu + 6]@',10,'	mov rsi, qword [flnu]@',10,'	add rsi, 6#',\
	10,'	mov r9b, byte [flnu_len]@',10,'	mov [rsi + r9], byte 0!',10,10,'	xor r8, r8@',10,'	mov r8b, [is_print]@',10,'	test r8b, r8b#',\
	10,'	jz not_literal@',10,'	jmp end_cond@',10,'	not_literal:!',10,10,'	call print@',10,'	mov r8, rdi@',10,'	mov rdi, qword [flnu]#',\
	10,'	mov rax, 12@',10,'	syscall!',10,10,'	mov rax, 1@',10,'	mov rdi, r8@',10,'	jmp loop!',10,10,'p_81:@',10,'	mov r8b, byte [is_print]#',\
	10,'	test r8b, r8b@',10,'	jnz end_cond@',10,'	mov [is_print], byte 1@',10,'	mov rbx, qn@',10,'	mov rsi, p_quo@',10,'	call write#',\
	10,'	jmp end_cond!',10,10,'end_print:@',10,'	mov rsi, p_end@',10,'	call write_loop@',10,'	lea rbx, [qn + 24]@',10,'	mov [is_print], byte 0#',\
	10,'	jmp end_cond!',10,10,'_start:@',10,'	mov qword [init_int], I!',10,10,'	cmp qword [init_int], 0@',10,'	jz exit!',10,10,'start_loop:#',\
	10,'	mov [flnu_len], byte 0@',10,'	call asmbl_fln!',10,10,'	mov rax, 2@',10,'	mov rsi, 02 | 0100@',10,'	mov rdx, 0422#',\
	10,'	syscall!',10,10,'	mov rdi, rax!',10,10,'	mov [is_print], byte 0@',10,'	mov rbx, qn@',10,'	mov rax, 1#',\
	10,'	mov rdx, 1!',10,10,'	loop:@',10,'		cmp [rbx], byte 33@',10,'		je p_33@',10,'		cmp [rbx], byte 35@',10,'		je p_35#',\
	10,'		cmp [rbx], byte 64@',10,'		je p_64@',10,'		cmp [rbx], byte 73@',10,'		je p_73@',10,'		cmp [rbx], byte 81#',\
	10,'		je p_81!',10,10,'		end_cond:!',10,10,'		mov rsi, rbx@',10,'		call write@',10,'		inc rbx!',10,10,'		mov r8b, byte [rbx]#',\
	10,'		test r8b, r8b@',10,'		jnz loop!',10,10,'		mov r8b, byte [is_print]@',10,'		test r8b, r8b@',10,'		jnz end_print!',10,10,'		mov rax, 3#',\
	10,'		syscall!',10,10,'		mov r8, qword [init_int]@',10,'		dec r8@',10,'		mov qword [init_int], r8@',10,'		test r8, r8#',\
	10,'		jnz start_loop!',10,10,'		exit:@',10,'		mov rax, 60@',10,'		xor rdi, rdi@',10,'		syscall',0
	p_nl db 64,39,44,49,48,44,39,0
	p_pnl db 35,39,44,92,10,9,49,48,44,39,0
	p_dnl db 33,39,44,49,48,44,49,48,44,39,0
	p_fl db 83,117,108,108,121,95,46,115,0
	p_quo db 39,0
	p_end db 39,44,48,0

section .bss
	flnu resq 1
	init_int resq 1
	is_print resb 1
	flnu_len resb 1

section .text
	global _start

divide:
	xor rdx, rdx
	xor rax, rax
	mov rax, r8
	mov rcx, 0xa
	div rcx
	ret

asmbl_fln:
	mov rax, 12
	xor rdi, rdi
	syscall
	push rax
	mov rdi, rax

	xor rax, rax
	mov rax, qword [init_int]
	L1:
		inc byte [flnu_len]
		xor rdx, rdx
		mov rcx, 0xa
		div rcx
		test al, al
		jnz L1

	mov bl, byte [flnu_len]
	add rdi, 9
	add rdi, rbx
	mov rax, 12
	syscall
	mov rax, p_fl

	pop rdi
	push rdi
	L2:
		mov cl, byte [rax]
		cmp cl, 46
		jne cont
		add rdi, [flnu_len]
		cont:
		mov [rdi], byte cl
		inc rdi
		inc rax
		test cl, cl
		jnz L2
	xor rax, rax
	pop rdi

	cmp [init_int], byte 0
	jne J1
	mov byte [rdi+6], 48
	ret
	J1:
	mov r8, qword [init_int]
	mov r9b, byte [flnu_len]

	L3:
		call divide

		add rdx, 48
		lea rax, [r9 + 5]
		mov byte [rdi + rax], dl

		call divide
		xor rdx, rdx
		mov r8, rax

		dec r9b
		test r8b, r8b
		jnz L3

	mov [flnu], rdi
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
	pop r8
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

p_73:
	lea rsi, [flnu + 6]
	mov rsi, qword [flnu]
	add rsi, 6
	mov r9b, byte [flnu_len]
	mov [rsi + r9], byte 0

	xor r8, r8
	mov r8b, [is_print]
	test r8b, r8b
	jz not_literal
	jmp end_cond
	not_literal:

	call print
	mov r8, rdi
	mov rdi, qword [flnu]
	mov rax, 12
	syscall

	mov rax, 1
	mov rdi, r8
	jmp loop

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
	mov qword [init_int], 5

	cmp qword [init_int], 0
	jz exit

start_loop:
	mov [flnu_len], byte 0
	call asmbl_fln

	mov rax, 2
	mov rsi, 02 | 0100
	mov rdx, 0422
	syscall

	mov rdi, rax

	mov [is_print], byte 0
	mov rbx, qn
	mov rax, 1
	mov rdx, 1

	loop:
		cmp [rbx], byte 33
		je p_33
		cmp [rbx], byte 35
		je p_35
		cmp [rbx], byte 64
		je p_64
		cmp [rbx], byte 73
		je p_73
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

		mov rax, 3
		syscall

		mov r8, qword [init_int]
		dec r8
		mov qword [init_int], r8
		test r8, r8
		jnz start_loop

		exit:
		mov rax, 60
		xor rdi, rdi
		syscall