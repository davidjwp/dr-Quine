
section .data
	p_fl db 83,117,108,108,121,95,46,115,0
section .bss
	init_int resq 1 
	flnu_len resb 1 

section .text
	global _start

	divide:
	xor rax, rax
	mov rax, r8
	mov rcx, 0xa
	div rcx
	ret

_start:
	mov [flnu_len], byte 0
	mov qword [init_int], 23

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
	
	mov rbx, [flnu_len]
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
		xor rdx, rdx	

		call divide
		xor rdx, rdx
		mov r8, rax

		dec r9b
		test r8b, r8b
		jnz L3
cc:
xor r8, r8
mov r8b, byte [init_int]
mov byte rsi, r8 + 49