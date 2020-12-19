; Gabriel Téllez Morales 	453955
; Final Exam, Assembly Language Course, December 2nd, 2002
; Professor: Ariel Ortiz

global _max

%define aptr ebp + 8
%define n ebp + 12

section .data

	limpia	dq 0.0

section .text

align 16

_max
	;program prologue
        push    ebp
        mov     ebp, esp
        push    ebx

        ;pointing ebx to the array
	mov	ebx, [aptr]
	
        ;necessary counter
        xor     esi, esi
        mov	esi,8

        ; -16606, -32148, 13337, 5940
        movq	mm0, [ebx]		

        ; comparing and finding
        ; the largest values
.loopa
        movq	mm1, [ebx + esi]	
        pmaxsw	mm0,mm1			
	movq	mm1,[limpia]           	
        add	esi,8        	
	cmp	esi,128
        jne	.loopa    

	;cleaning registers 
        xor	eax,eax
	xor	ebx,ebx
        xor	ecx,ecx
        xor	edx,edx
        xor	esi,esi
        xor	edi,edi
        
        ;returning the 4 largest values of the array
        ;to the first 4 indexes of the array
        mov	ebx,[aptr]
        movq	[ebx],mm0
        
        ;filling 16 bit registers with the
        ;4 largest values of the array
        mov	dx,[ebx] 	;28904
	mov	si,[ebx+2]   	;31240
       	mov	ax,[ebx+4]    	;29323
        mov	cx,[ebx+6]    	;28139            
        mov	edi,3
        
        ;finding the largest value
        ;of these 4 values
.loop2
        cmp     edi,0
        je      .exit
        add     ebx, 2
        cmp     ax, [ebx]
        jg      .continue
        mov     eax, [ebx]
.continue
        dec     edi
        jmp     .loop2
.exit
	;program epilogue
        pop     ebx
        pop     ebp
        ret