;; Authors:  Bryce Burnette Laurie Jones
;; File Name; strings.asm
;; project6

;; This program prompts you for your name and accepts it as input. 
;; The program then displays your name back to you. The program then
;; converts the lowercase letters to uppercase letters and displays the result

;; pseudocode:

.ORIG X3000

;; Register usage
; R0 = The input character
; R1 = the newline character
; R2 = the base address of the array
; R3 = temporary working storage

; lowercase ascii values are 22 less than the UPPERCASE letter

; Program Code
		LEA	R0, PROMPT		;Display the prompt
		PUTS
		LD	R1, RT
		LEA	R2, ARRAY
	
WHILE	GETC
		OUT
		ADD	R3, R0, R1
		BRz	ENDWHILE
		STR	R0, R2, #0
		ADD R2, R2, #1
		BR	WHILE
ENDWHILE	STR R3, R2, #0

		LEA R0, ARRAY
	HALT

; Data Variables
RT		.FILL		X-00D
PROMPT	.STRINGZ	"Enter your name:  "
ARRAY	.BLKW		#30

	.END