.MODEL SMALL 
.STACK 100H
.DATA
    MSG1 DB 'ENTER ARRAY SIZE(1-9): $'
    MSG2 DB 'ENTER ELEMENT(1-9): $'
    MSG3 DB 'SUM OF EVEN NUMBER: $'
    MSG4 DB 'SUM OF ODD NUMBER: $'
    NEXTLINE DB 0DH, 0AH, "$"
    N DB ?
    ARR DB ?
.CODE
    MAIN  PROC
        MOV AX, @DATA
        MOV DS, AX
         
        LEA DX, MSG1
        MOV AH, 9
        INT 21H
        
        MOV AH, 1
        INT 21H
        MOV N, AL
        
        XOR CX, CX
        MOV CL, N
        SUB CL, '0'
        MOV SI, 0
        LEA DX, NEXTLINE
        MOV AH, 9
        INT 21H
        LEA DX, MSG2
        MOV AH, 9
        INT 21H
        MOV AH, 1
        L1:
            INT 21H
            MOV ARR[SI], AL
            INC SI
            LOOP L1
        
        XOR CX, CX
        MOV CL, N
        SUB CL, '0'
        XOR BX, BX
        MOV SI, 0   
        L2:
           SUB ARR[SI], '0'
           XOR AX, AX
           MOV AL, ARR[SI]
           MOV DL, 2
           DIV DL
           CMP AH, 1
           JE ODD
           ADD BH, ARR[SI]
           JMP LAST
           ODD:
               ADD BL, ARR[SI]
           LAST:
               INC SI
           LOOP L2
        LEA DX, NEXTLINE
        MOV AH, 9
        INT 21H
        LEA DX, MSG3
        MOV AH, 9
        INT 21H
        
        XOR AX, AX
        MOV AL, BH
        MOV BH, 10
        DIV BH
        MOV BH, AH
        MOV DL, AL
        ADD DL, '0'
        MOV AH, 2
        INT 21H
        MOV DL, BH
        ADD DL, '0'
        INT 21H
        
        LEA DX, NEXTLINE
        MOV AH, 9
        INT 21H
        LEA DX, MSG4
        MOV AH, 9
        INT 21H
        
        XOR AX, AX
        MOV AL, Bl
        MOV BH, 10
        DIV BH
        MOV BH, AH
        MOV DL, AL
        ADD DL, '0'
        MOV AH, 2
        INT 21H
        MOV DL, BH
        ADD DL, '0'
        INT 21H 
            
        END:
            MOV AH, 4CH
            INT 21H    
        
    MAIN  ENDP
 END MAIN