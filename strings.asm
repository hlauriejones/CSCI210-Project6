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
        LD  R7, UPPER       ;
		LEA	R2, ARRAY       ;blocks out 30 spaces for R2
        LEA R4, ARRAY2      ;
       

;Main loop
;displays the prompt	
WHILE	GETC                ;gets the character
		OUT                 ;outputs it ot the monitor
		ADD	R3, R0, R1      ;check to see if its ascii13
        ADD R3, R0, R5      ;check to see if its ascii10
        ST R6, SIZE
		BRz	LOWERCASE        ;if the previous instruction is 0 then go to LOWERCASE
        ;ST R6, SIZE
        
;loads the input
		STR	R0, R2, #0      ;puts null at the end of R0
		LD R7, UPPER
		ADD R0, R0, R7
		STR R0, R4, #0
;loads it as uppercase
; subtract 97 from the number if it is neg, elave it if it is pos. don't leave it
		LD R3, CHECK
		ADD R3, R0, R3
		ADD R3, R3, #0
		BRzp MOVE
        ADD R7, R0, R4

        ADD R2, R2, #1      ;increments R2
		ADD R4, R4, #1
		BR	WHILE           ;breaks the loop

LOWERCASE	STR R3, R2, #0      ;stores the null character at the end after the last input
	LEA R0, PROMPT2
    PUTS
    LEA R0, ARRAY       ;clears the input array
    PUTS
    LEA R0, EXCL
    PUTS
	LEA R0, PROMPT3
	PUTS
	LEA R0, ARRAY2
	PUTS
    BRz DONE

MOVE 
	ADD R2, R2, #1

	
DONE	HALT




; Data Variables
RT		.FILL		X-00D       ;ascii13
RT2     .FILL       X-000A      ;ascii10
SIZE    .FILL       #30 
UPPER   .FILL       #-32        ;the difference in ascii numbers from lower to uppercase


PROMPT	.STRINGZ	"Enter your name:  "
PROMPT2 .STRINGZ    "Thank you, "
PROMPT3 .STRINGZ	"Your name in uppercase is"
EXCL    .STRINGZ    "!"
ARRAY	.BLKW		#30
ARRAY2  .BLKW       #30

DIFF  .BLKW 	#1
CHECK  .FILL	#-97
	.END