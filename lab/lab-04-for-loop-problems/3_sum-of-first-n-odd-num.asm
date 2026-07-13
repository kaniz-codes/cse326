.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC

    MOV BL, 1       ; Current odd number
    MOV AL, 0       ; Sum
    MOV CX, 5       ; Run loop 5 times

L:
    ADD AL, BL      ; Sum = sum + current odd number
    ADD BL, 2       ; Next odd number

    LOOP L

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN