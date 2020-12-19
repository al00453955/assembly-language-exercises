; Gabriel Téllez Morales 	453955
; Exam 2 Problem 2, Assembly Language, September 26th, 2002

global _value, _result, _bitcount

section .data
        _value  dd 0
        _result dd 0

section .text

_bitcount

        mov     eax, [_value]

	mov	ecx,0
        

.loop1
 
        shr     eax, 1		; shift right with carry flag, modifies CF
	mov	ebx,0
        adc     ebx,0		; ADD dest, orig = dest <-- dest + orig + CF
	add	ecx,ebx
	cmp	eax,0
	jne	.loop1

        mov     [_result],ecx
        ret