.MODEL SMALL
.STACK 100H
.DATA 
 
 STR DB "Enter first digit: $"
 STR1 DB 10,13, "Enter second digit: $"
 STR2 DB 10,13, "The substraction is $"
 
.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH,9
    LEA DX,STR
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,9
    LEA DX,STR1
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    SUB BL,BH
    ADD BL,48
    
    MOV AH,9
    LEA DX,STR2
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MAIN ENDP
END MAIN