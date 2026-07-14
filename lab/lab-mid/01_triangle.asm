.MODEL SMALL
.STACK 100H

.DATA
STR1 DB "Input A: $"
STR2 DB 10,13,"Input B: $"
STR3 DB 10,13,"Input C: $"
STR4 DB 10,13,"Valid$"
STR5 DB 10,13,"Invalid$"

.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    ; input A
    MOV AH, 9
    LEA DX, STR1
    INT 21H

    MOV AH, 1
    INT 21H
    SUB AL, '0'
    MOV BL, AL      ; BL = A

    ; input B
    MOV AH, 9
    LEA DX, STR2
    INT 21H

    MOV AH, 1
    INT 21H
    SUB AL, '0'
    MOV BH, AL      ; BH = B

    ; input C
    MOV AH, 9
    LEA DX, STR3
    INT 21H

    MOV AH, 1
    INT 21H
    SUB AL, '0'
    MOV CL, AL      ; CL = C

    ; check A + B > C
    MOV AL, BL
    ADD AL, BH
    CMP AL, CL
    JLE INVALID

    ; check A + C > B
    MOV AL, BL
    ADD AL, CL
    CMP AL, BH
    JLE INVALID

    ; check B + C > A
    MOV AL, BH
    ADD AL, CL
    CMP AL, BL
    JLE INVALID

VALID:
    MOV AH, 9
    LEA DX, STR4
    INT 21H
    JMP EXIT

INVALID:
    MOV AH, 9
    LEA DX, STR5
    INT 21H
    JMP EXIT

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN