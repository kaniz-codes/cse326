.MODEL SMALL
.STACK 100H

.DATA
STR  DB "Enter the first letter: $"
STR1 DB 10,13,"Enter the second letter: $"
STR2 DB 10,13,"The letters in alphabetical order: $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, STR
    INT 21H

    MOV AH, 1
    INT 21H
    MOV BL, AL

    MOV AH, 9
    LEA DX, STR1
    INT 21H

    MOV AH, 1
    INT 21H
    MOV CL, AL

    MOV AH, 9
    LEA DX, STR2
    INT 21H
    
    CMP BL, CL
    JLE Order

    MOV AH, 2
    MOV DL, CL
    INT 21H

    MOV DL, BL
    INT 21H
    JMP Exit

Order:
    MOV AH, 2
    MOV DL, BL
    INT 21H

    MOV DL, CL
    INT 21H

Exit:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN