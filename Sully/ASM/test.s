
section .data
	p_fl db 83,117,108,108,121,95,46,115,0;file name
section .bss
	init_int resq 1 
	flnu_len resb 1 

section .text
	global _start

	divide:
	xor rax, rax
	mov al, r8b
	mov rcx, 0xa
	div rcx
	ret

_start:
	mov [flnu_len], byte 0
	mov qword [init_int], 524

asmbl_fln:
	mov rax, 12
	xor rdi, rdi
	syscall
	push rax
	mov rdi, rax

	xor rax, rax
	mov al, byte [init_int]
	L1:
		inc byte [flnu_len]
		xor rdx, rdx
		mov rcx, 0xa
		div rcx
		test al, al
		jnz L1
	
	mov rbx, [flnu_len]
	add rdi, 9
	add rdi, rbx
	mov rax, 12
	syscall
	mov rax, p_fl

	pop rdi
	push rdi
	L2:;fill rdi with p_fl="Sully_.s"
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
	cmp [init_int], byte 0
	jne J1
	mov [rdi+6], byte 48
	ret
	J1:
	
	pop rdi 
	mov r8b, byte [init_int]
	mov r9b, byte [flnu_len]

	L3:
		call divide

		add rdx, 48
		lea rax, [r9 + 5]
		mov byte [rdi + rax], dl
		xor rdx, rdx	

		call divide
		xor rdx, rdx
		mov r8, rax

		dec r9b
		test r8b, r8b
		jnz L3

	cc:
