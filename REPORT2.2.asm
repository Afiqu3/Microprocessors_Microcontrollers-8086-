.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "ENTER ALPHABET OR DIGIT: $"
    MSG2 DB "ALPHABET$"
    MSG3 DB "DIGIT$"
    VAR DB '9$'
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
        CMP VAR, AL
        JB ALPHABET
        
        MOV AH, 9
        LEA DX, NEXTLINE
        INT 21H
             
        MOV AH, 9
        LEA DX, MSG3
        INT 21H
        JMP END
        ALPHABET:
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