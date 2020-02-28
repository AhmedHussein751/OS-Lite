;**************************************************************************************
;           Boot1.asm
;                    - A simple Bootloader
;
;**************************************************************************************

org 0x7c00 ; tell nasm this code is executed at address 0x7c00

bits 16 ; We are in 16 bits real mode


xor	ax, ax		; Setup segments to insure they are 0. Remember that
mov	ds, ax		; we have ORG 0x7c00. This means all addresses are based
mov	es, ax		; from 0x7c00:0. Because the data segments are within the same
				; code segment, null em.

mov	si, msg
call	Print

cli
hlt

times 510 - ($-$$) db 0  ; $ sign means current line add, $$ means first line add, 510 to leave 2B for signature

dw 0xAA55   ; Boot Signature
