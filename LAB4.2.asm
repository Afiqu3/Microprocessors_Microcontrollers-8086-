.MODEL SMALL
.STACK 100H
.DATA
    NEXTLINE DB 0DH, 0AH, "$"
    SUM DB ?
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 1
        INT 21H
        SUB AL, '0'
        MOV CL, AL
        
        XOR BX, BX
        XOR CH, CH
        
        L1:
           ADD BL, CL
           LOOP L1

        MOV SUM, BL
        MOV AL, SUM
        
        MOV BL, 10
        XOR AH, AH
        DIV BL
        CMP AL, 0
        JZ L2
        
        MOV AH, 9
        LEA DX, NEXTLINE
        INT 21H
        
        MOV BL, 10
        MOV AL, SUM
        XOR AH, AH
        DIV BL
        
        MOV BL, AH
        MOV DL, AL
        ADD DL, '0'
        MOV AH, 2
        INT 21H
        MOV DL, BL
        ADD DL, '0'
        MOV AH, 2
        INT 21H
        JMP END
        
        L2:
            MOV AH, 9
            LEA DX, NEXTLINE
            INT 21H
            MOV DL, SUM
            ADD DL, '0'
            MOV AH, 2
            INT 21H
            
        END:
            MOV AH, 4CH
            INT 21H 
    MAIN ENDP
END MAIN