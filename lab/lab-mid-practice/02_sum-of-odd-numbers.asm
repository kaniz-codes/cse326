.MODEL SMALL
.STACK 100H
.DATA 
 
 STR DB "Input: $"
 STR1 DB 10,13, "Output: $"
 
.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH,9
    LEA DX, STR
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    SUB BH,30H        ; Convert ASCII to number
    
    MOV CL,BH         ; CX = n
    MOV CH,0
    
    MOV BL,1          ; i = 1
    MOV BH,0          ; sum = 0
     
FOR_LOOP:
    ADD BH,BL         ; sum = sum + i
    ADD BL,2          ; i = i + 2
    
    LOOP FOR_LOOP     ; Run n times
    
OUTPUT:
    MOV AH,9
    LEA DX, STR1
    INT 21H
    
    ; Result is stored in BH
    MOV AL,BH
    MOV AH,0
    
    MOV BL,10
    DIV BL            ; AL = tens, AH = ones
    
    MOV BH,AH         ; Save ones digit
    MOV BL,AL         ; Save tens digit
    
    CMP BL,0
    JE PRINT_ONES
    
    MOV DL,BL
    ADD DL,30H
    MOV AH,2
    INT 21H
    
PRINT_ONES:
    MOV DL,BH
    ADD DL,30H
    MOV AH,2
    INT 21H

EXIT:
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN