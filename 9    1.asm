ORG 100h

MOV AH, 01h        ; Function to read a character (digit 1)
INT 21h            ; Read first digit
SUB AL, 30h        ; Convert ASCII to numeric value
MOV BL, AL         ; Store first digit in BL

MOV DL, 0Ah        ; Move ASCII newline (line feed) character
MOV AH, 02h        ; Function to display character
INT 21h            ; Display newline

MOV AH, 01h        ; Function to read a character (digit 2)
INT 21h            ; Read second digit
SUB AL, 30h        ; Convert ASCII to numeric value

CMP BL, AL         ; Compare first and second digit
JE EQUAL           ; If equal, jump to EQUAL
JMP NOTEQUAL       ; Otherwise, jump to NOTEQUAL

EQUAL:
MOV DX, OFFSET MSG_EQUAL ; Load the address of "Equal" message
JMP DISPLAY_MSG          ; Jump to display message

NOTEQUAL:
MOV DX, OFFSET MSG_NOTEQUAL ; Load the address of "Not Equal" message

DISPLAY_MSG:
MOV AH, 09h        ; Function to display string
INT 21h            ; Display the message
INT 20h            ; Terminate the program

MSG_EQUAL DB 'Numbers are equal$', 0
MSG_NOTEQUAL DB 'Numbers are not equal$', 0

END
