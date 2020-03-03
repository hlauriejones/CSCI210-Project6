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
		LD	R1, RT          ;puts the ASCII13 in R1
        LD  R5, RT2         ;puts the ASCII10 in R1
		LEA	R2, ARRAY       ;blocks out 30 spaces for R2
       

;Main loop
;displays the prompt	
WHILE	GETC                ;gets the character
		OUT                 ;outputs it ot the monitor
		ADD	R3, R0, R1      ;check to see if its ascii13
        ADD R3, R0, R5      ;check to see if its ascii10
        ST R6, SIZE
		BRz	LOWERCASE        ;if the previous instruction is 0 then go to ENDWHILE

;loads the input
		STR	R0, R2, #0      ;puts null at the end of R0
		ADD R2, R2, #1      ;increments R2
		BR	WHILE           ;breaks the loop
LOWERCASE	STR R3, R2, #0      ;stores the null character at the end after the last input
	LEA R0, PROMPT2
    PUTS
    LEA R0, ARRAY       ;clears the input array
    PUTS
    LEA R0, EXCL
    PUTS
	HALT

; Data Variables
RT		.FILL		X-00D       ;ascii13
RT2     .FILL       X-000A      ;ascii10
SIZE    .FILL       #30

PROMPT	.STRINGZ	"Enter your name:  "
PROMPT2 .STRINGZ    "Thank you, "
EXCL    .STRINGZ    "!"
ARRAY	.BLKW		#30

	.END