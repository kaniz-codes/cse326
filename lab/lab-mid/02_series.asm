.MODEL SMALL
.STACK 100H
.DATA
STR DB "Input: $"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS, AX
    
    MOV AH,9
    LEA DX,STR
    INT 21H
    
    MOV AH,1
    INT 21H
    
    SUB AL,'0'
    
    MOV CX,0
    MOV CL,AL
    MOV BX,0
    MOV AX,2
    
L:
    ADD BX,AX
    ADD AX,2
    LOOP L
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN