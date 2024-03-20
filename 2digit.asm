.MODEL SMALL
.STACK 100H
.DATA 
    VAR DB ?
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 1
        INT 21H
        SUB AL, '0'
        MOV BL, 10
        MUL BL
        MOV VAR, AL
        
        MOV AH, 1
        INT 21H
        SUB AL, '0'
        ADD VAR, AL
        
        MOV AH, 4CH
        INT 21H
    MAIN ENDP
END MAIN