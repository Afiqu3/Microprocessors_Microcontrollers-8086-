.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "ENTER A NUMBER(MAX 2DIGIT): $"
    MSG2 DB "DIVISILBE BY 5$"
    MSG3 DB "NOT DIVISILBE BY 5$"
    VAR DB ?
    NEXTLINE DB 0DH, 0AH, "$"
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 9
        LEA DX, MSG1
        INT 21H
        
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
        
        MOV AL, VAR
        MOV BL, 5
        MOV AH, 0H
        DIV BL
        
        CMP AH, 0
        JE DIVIDE
        
        MOV AH, 9
        LEA DX, NEXTLINE
        INT 21H
        MOV AH, 9
        LEA DX, MSG3
        INT 21H
        JMP END
        DIVIDE:
             MOV AH, 9
             LEA DX, NEXTLINE
             INT 21H
             
             MOV AH, 9
             LEA DX, MSG2
             INT 21H
        END:
            MOV AH, 4CH
            INT 21H   
    MAIN ENDP
END MAIN