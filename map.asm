; Gabriel Téllez Morales 	453955
; Exam 3, Assembly Language, November 1st, 2002

global _map

%define ar 	ebp + 8
%define s	ebp + 12
%define f 	ebp + 16
                          
section .text

_map       
        ; Subroutine Prologue
        push    ebp
        mov     ebp, esp
        finit        
        
        ; storing size and pointer
	mov edx,0 			
	mov ecx,0
        mov edx,[ar]                  ; pointer
        mov ecx,[s]                    ;size

.loop        
	; preserve the values of ecx and edx
        push	ecx 
        push	edx
        
        ; function call        
        push    dword[edx]
        call    dword[f]
        add     esp, 4
        
        ;cleaning edx, just in case
        mov	edx,0
	
        ;restoring the previous value of edx       
        pop	edx
        
        ; putting the function result in edx
        fstp	dword[edx]
        
        ;cleaning ecx, just in case
        mov	ecx,0
        
        ;restoring the previous value of ecx
	pop 	ecx
	
        ; walking through the array                
	add	edx,4        
	dec 	ecx
	
        ; check if we already finished to read the values
        cmp	ecx,0			
	jnz	.loop
        
        ; Subroutine Epilogue
        pop     ebp
        ret