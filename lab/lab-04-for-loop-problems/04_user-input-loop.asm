.MODEL SMALL
.STACK 100H

.DATA
MSG1 DB "Enter a hex digit: $"
MSG2 DB 10,13,"In decimal it is $"
MSG3 DB 10,13,"Do you want to do it again? $"
MSG4 DB 10,13,"Illegal character - ENTER 0 ... 9 OR A ... F: $"

.CODE
MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX

START:
    MOV AH, 9
    LEA DX, MSG1
    INT 21H

READ_HEX:
    MOV AH, 1
    INT 21H          ; input character in AL

    ; check 0 to 9
    CMP AL, '0'
    JB ILLEGAL

    CMP AL, '9'
    JBE DIGIT

    ; check A to F
    CMP AL, 'A'
    JB ILLEGAL

    CMP AL, 'F'
    JBE LETTER

    JMP ILLEGAL

DIGIT:
    SUB AL, 30H      ; convert ASCII to number
    MOV BL, AL       ; store value in BL
    JMP DISPLAY

LETTER:
    SUB AL, 'A'      ; A becomes 0
    ADD AL, 10       ; A = 10, B = 11, C = 12 ...
    MOV BL, AL
    JMP DISPLAY

ILLEGAL:
    MOV AH, 9
    LEA DX, MSG4
    INT 21H
    JMP READ_HEX

DISPLAY:
    MOV AH, 9
    LEA DX, MSG2
    INT 21H

    ; print decimal value from BL
    CMP BL, 10
    JB PRINT_SINGLE

    ; print 10 to 15
    MOV AH, 2
    MOV DL, '1'
    INT 21H

    MOV DL, BL
    SUB DL, 10
    ADD DL, 30H
    INT 21H
    JMP ASK

PRINT_SINGLE:
    MOV AH, 2
    MOV DL, BL
    ADD DL, 30H
    INT 21H

ASK:
    MOV AH, 9
    LEA DX, MSG3
    INT 21H

    MOV AH, 1
    INT 21H

    CMP AL, 'Y'
    JE START

    CMP AL, 'y'
    JE START

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN