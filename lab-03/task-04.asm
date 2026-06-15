.MODEL SMALL
.STACK 100H

.DATA
STR  DB "Enter a character: $"
STR1 DB 10,13,"Digit$"
STR2 DB 10,13,"Alphabet$"
STR3 DB 10,13,"Invalid character$"

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

    ; check digit 0-9
    CMP BL, '0'
    JL CHECK_UPPER
    CMP BL, '9'
    JLE DIGIT

CHECK_UPPER:
    ; check uppercase A-Z
    CMP BL, 'A'
    JL INVALID
    CMP BL, 'Z'
    JLE ALPHABET

CHECK_LOWER:
    ; check lowercase a-z
    CMP BL, 'a'
    JL INVALID
    CMP BL, 'z'
    JLE ALPHABET

    JMP INVALID

DIGIT:
    MOV AH, 9
    LEA DX, STR1
    INT 21H
    JMP EXIT

ALPHABET:
    MOV AH, 9
    LEA DX, STR2
    INT 21H
    JMP EXIT

INVALID:
    MOV AH, 9
    LEA DX, STR3
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN