.MODEL SMALL
.STACK 100H
.DATA
    NEXTLINE DB 0DH, 0AH, "$"
    MSG1 DB 'EVEN$'
    MSG2 DB 'ODD$'
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        L1:
           MOV AH, 1
           INT 21H
           MOV BL, AL
           CMP BL, 'N'
           JE END
           
           SUB BL, '0'
           MOV AL, BL
           MOV BL, 2
           DIV BL
           CMP AH, 0
           JE L2
           
           MOV AH, 9
           LEA DX, NEXTLINE
           INT 21H
           
           MOV AH, 9
           LEA DX, MSG2
           INT 21H
           MOV AH, 9
           LEA DX, NEXTLINE
           INT 21H
           LOOP L1
        
        L2:
            MOV AH, 9
            LEA DX, NEXTLINE
            INT 21H
            MOV AH, 9
            LEA DX, MSG1
            INT 21H
            MOV AH, 9
            LEA DX, NEXTLINE
            INT 21H
            JMP L1
            
        END:
            MOV AH, 4CH
            INT 21H 
    MAIN ENDP
END MAIN