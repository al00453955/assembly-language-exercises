;------------------------------------------------
; ITESM CEM, September 20, 2002.
; NASM/Windows x86 Assembly Language Source File
; Activity: Most Repeated
; Authors: Gabriel Téllez 	453955 
;          Piero A. Ocampo	460973
; (R) Collective 2002
;------------------------------------------------

global _arrayptr, _size, _result, _most_repeated

section .data 

	_arrayptr 	dd 0	;Start of the array
	_size	  	dd 0    ;Size of the array
	_result	  	dd 0    ;Final result
	_mostrep  	dd 0	;Most repeated number so far	
	_repcount	dd 0    ;Times the most repeated so far was repeated
        _counter        dd 0    ;Counter for the times the current value repeats


section .text

_most_repeated	
        mov esi, 1		;Increases to indicate the iteration #
	mov ebx, [_arrayptr]    ;points ebx to the start of the array
	mov ecx, 1     		;to control the advances over the array
	mov eax, ebx            ;points eax to the start of the array

;first loop, the execution will never stop by the previous section again        
  .fstloop
	mov dword[_counter], 1	;the value appears at least one time :P	
	mov edx, [eax]          ;move the value to compare to edx

  .compare
        cmp edx, [ebx+ecx*4]  	;compares the current value to the next element of the array
	jne .notequal           ;if not equal, act in consequence
	inc dword[_counter]     ;if it is equal, increment the counter

  .notequal
	inc ecx    		;increment ecx to reach the next element
	cmp [_size], ecx 	;Have we reached the end of the array?
	jne .compare          	;if not, compare to the next element
        mov edi, [_counter]     ;if yes, move counter to edi
	cmp edi , [_repcount]   ;compare edi to the counter of the most repeated value so far
	jng .final              ;if it was not greater, end with current value
        mov [_repcount], edi    ;if it was greater, update the counter
	mov [_mostrep], edx     ;store the value(new most repeated) into the most repeated variable

  .final 
	inc esi   		;indicates which position is to be
	mov ecx, esi            ;to indicate in which position we are, so we don't compare to elements outside the declared array
	add eax, 4		;move to the next element
	cmp [_size], ecx    	;compares the size to the current position
	jne .fstloop            ;if we haven't compared all elements, go to the first loop
	mov edx, [_mostrep]   	;if we are finished, move the most repeated to edx
	mov [_result], edx      ;move the most repeated to the result variable
	ret                     ;return to main() program
