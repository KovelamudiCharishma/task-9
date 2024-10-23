
ORG 100h

MOV AH, 01h        ; Function to read a character (digit)
INT 21h            ; Read the digit
SUB AL, 30h        ; Convert ASCII to numeric value

MOV BL, AL         ; Store the digit in BL
AND AL, 01h        ; Perform bitwise AND with 1 to check if the number is odd

CMP AL, 0          ; Compare the result with 0
JE EVEN            ; If zero, the number is even
JMP ODD            ; Otherwise, it's odd

EVEN:
MOV DX, OFFSET MSG_EVEN   ; Load the address of "Even" message
JMP DISPLAY_MSG           ; Jump to display the message

ODD:
MOV DX, OFFSET MSG_ODD    ; Load the address of "Odd" message

DISPLAY_MSG:
MOV AH, 09h        ; Function to display string
INT 21h            ; Display the message
INT 20h            ; Terminate the program

MSG_EVEN DB 'The number is even$', 0
MSG_ODD DB 'The number is odd$', 0

END     

