section .data

    hi db "Hello John D. Rockefeller ):<", 10, 0
	bye db "DIE John D. Rockefeller!", 10, 0

section .text
    global _start

_start:
    mov rsi, hi
	call _print

	mov rsi, bye
	call _print

	mov dil, 0
	call _exit

_print:
    mov rdx, rsi
	mov cl, 0
	
_printLoop:
    mov cl, [rdx]
	cmp cl, 0
	je _printEnd

	inc rdx
	jmp _printLoop
	
_printEnd:
    sub rdx, rsi

	mov rax, 1
	mov rdi, 1
	syscall
	
    ret

_exit:
    mov rax, 60
	syscall