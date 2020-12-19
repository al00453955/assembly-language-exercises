;;; File: prog1.asm
;;; (C) 2002 Ariel Ortiz, ITESM CEM
;;; First Example on assembly language programming.
;;; This is the assembly language module.

global _test

section .text

_test
       ; eax = 5
        mov     eax, 5

       ; ebx = 10
        mov     ebx, 10

        ; ecx = (eax + ebx) * 4 - eax - 1
        mov     ecx, eax
        add     ecx, ebx
        add     ecx, ecx
        add     ecx, ecx
        sub     ecx, eax
        dec     ecx

        ret         ; Return to the calling subroutine.