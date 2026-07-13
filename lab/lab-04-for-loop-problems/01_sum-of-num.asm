.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC

    MOV BL, 1       ; Current number
    MOV AL, 0       ; Sum

L:
    ADD AL, BL      ; Sum = sum + current number
    
    INC BL          ; Current number = current number + 1
    CMP BL, 5
    JLE L

MAIN ENDP
END MAIN