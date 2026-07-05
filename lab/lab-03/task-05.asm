.MODEL SMALL
.STACK 100H

.DATA
STR  DB "Enter first digit: $"
STR1 DB 10,13,"Enter second digit: $"
STR2 DB 10,13,"Enter third digit: $"
STR3 DB 10,13,"Smallest: $"
STR4 DB 10,13,"Largest: $"

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

    MOV AH, 1
    INT 21H
    MOV CH, AL

    ; assume BL = smallest, CL = middle, CH = largest

    CMP BL, CL
    JLE STEP1
    MOV DL, BL
    MOV BL, CL
    MOV CL, DL

STEP1:
    CMP CL, CH
    JLE STEP2
    MOV DL, CL
    MOV CL, CH
    MOV CH, DL

STEP2:
    CMP BL, CL
    JLE PRINT
    MOV DL, BL
    MOV BL, CL
    MOV CL, DL

PRINT:
    MOV AH, 9
    LEA DX, STR3
    INT 21H

    MOV AH, 2
    MOV DL, BL
    INT 21H

    MOV AH, 9
    LEA DX, STR4
    INT 21H

    MOV AH, 2
    MOV DL, CH
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN