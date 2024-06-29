
%macro exit 1
	mov rax, 60
	mov dil, [%1]
	syscall
%endmacro

%macro print 1
	mov rsi, [%1]
	call _print
%endmacro

%macro getch 0
    call _getchar
%endmacro

section .data

	hi db "What is yar name scurvy dog!", 10, 0
	c1 db "Hello, ", 0
	c2 db "!", 10, 0
	name dq 0
	_getchar_charbuffer db 0

section .text
	global _start

_start:
	print hi

	mov rsi, name
	call _getLine

	print c1
	
	print [name]

	print c2

	exit 0

_print:
	call _getstrlen

	mov rax, 1
	mov rdi, 1
	syscall

	ret

_getline:
    mov [rsi], rsp

_getline_loop:
    getch
	cmp bl, 10
	je _getLine_end

	push bl
	jmp _getline_loop

_getline_end:
    push 0
    ret

_getstrlen:
    mov rdx, rsi
	mov cl, 0

_getstrlen_loop:
    mov cl, [rdx]
	cmp cl, 0
	je _getstrlen_end

	inc rdx
	jmp _getstrlen_loop

_getstrlen_end:
    sub rdx, rsi
	ret

_getchar:
    mov rax, 0
	mov rdi, 0
	mov rsi, _getchar_charbuffer
	mov rdx, 1
	syscall

	mov bl, [_getchar_charbuffer]
