; Gabriel Téllez Morales 	453955
; Exam 2 Problem 1, Assembly Language, September 26th, 2002

global _arrayptr, _size, _result, _oddcount

section	.data

	_arrayptr	dd	0
	_size		dd	0
	_result		dd	0
	_currentindex	dd	0

section	.text

_oddcount

	mov	eax,[_arrayptr]
	mov	esi,[_size]
	mov	edi,[_currentindex]
	mov	ebx,1
	mov 	edx,0

.loop1

	cmp	esi,edi
	je	.final


	test	[eax+edi*4],ebx
	jz	.actualizaedi

.sumaimpares

	inc	edx

.actualizaedi

	inc	edi
	jmp	.loop1

.final

	mov	[_result], edx
	ret