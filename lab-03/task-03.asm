.MODEL SMALL
.STACK 100H

.DATA
STR  DB "Enter letter: $"
STR1 DB 10,13,"It is a vowel$"
STR2 DB 10,13,"It is a consonant$"

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

    CMP BL, 'A'
    JE Vowel
    CMP BL, 'E'
    JE Vowel
    CMP BL, 'I'
    JE Vowel
    CMP BL, 'O'
    JE Vowel
    CMP BL, 'U'
    JE Vowel

    CMP BL, 'a'
    JE Vowel
    CMP BL, 'e'
    JE Vowel
    CMP BL, 'i'
    JE Vowel
    CMP BL, 'o'
    JE Vowel
    CMP BL, 'u'
    JE Vowel

    MOV AH, 9
    LEA DX, STR2
    INT 21H
    JMP EXIT

Vowel:
    MOV AH, 9
    LEA DX, STR1
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN