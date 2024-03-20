.MODEL SMALL
.STACK 100H
.DATA
    NEXTLINE DB 0DH, 0AH, "$"
    MSG1 DB 'LARGEST: $'
    MSG2 DB 'SMALLEST: $'
    MSG3 DB 'AVERAGE: $'
    MSG4 DB 'ENTER 5 ELEMENT: $'
    TEMP DB ?
    AR DB ?
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        LEA DX, MSG4
        CALL MY1
        CALL MY
        MOV AH, 1 
        L1:
           INT 21H
           SUB AL, '0'
           MOV AR[SI], AL
           INC SI
           LOOP L1
        CALL AVG
        CALL LARGEST
        CALL SMALLEST
        END:
           MOV AH, 4CH
           INT 21H 
    MAIN ENDP
    
    MY PROC
        XOR CX, CX
        MOV SI, 0
        MOV CL, 5
        RET
    MY ENDP
    
    MY1 PROC
        MOV AH, 9
        INT 21H
        RET
    MY1 ENDP
    
    MY2 PROC
        ADD DL, '0'
        MOV AH, 2
        INT 21H
        RET
    MY2 ENDP
    
    AVG PROC
        XOR BX, BX
        CALL MY
        CALAVG:
            ADD BL, AR[SI]
            INC SI
            LOOP CALAVG
        LEA DX, NEXTLINE
        CALL MY1
        LEA DX, MSG3
        CALL MY1
        XOR AX, AX
        MOV AL, BL
        MOV BL, 5
        DIV BL
        MOV DL, AL
        CALL MY2
        RET
   AVG ENDP
    
   LARGEST PROC
        LEA DX, NEXTLINE
        CALL MY1
        LEA DX, MSG1
        CALL MY1
        MOV TEMP, 0
        CALL MY
        LR:
            MOV BL, AR[SI]
            CMP BL, TEMP
            JA LL1
            JMP LL3
            LL1:
               MOV TEMP, BL
               JMP LL3
            LL3:
                INC SI
            LOOP LR
        MOV DL, TEMP
        CALL MY2
        RET
   LARGEST ENDP
   
   SMALLEST PROC
        LEA DX, NEXTLINE
        CALL MY1
        LEA DX, MSG2
        CALL MY1
        MOV TEMP, 9
        CALL MY
        SR:
            MOV BL, AR[SI]
            CMP BL, TEMP
            JB LL2
            JMP LL4
            LL2:
               MOV TEMP, BL
               JMP LL4
            LL4:
                INC SI
            LOOP SR
        MOV DL, TEMP
        CALL MY2
        RET
   SMALLEST ENDP
        
END MAIN