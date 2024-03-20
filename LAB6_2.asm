.MODEL SMALL
.STACK 100H
.DATA
    NEXTLINE DB 0DH, 0AH, "$"
    MSG1 DB 'ASCENDING: $'
    MSG2 DB 'DESCENDING: $'
    MSG3 DB 'ENTER 7 ELEMENT: $'
    MSG4 DB ' $'
    TEMP DB 7
    AR DB ?
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        LEA DX, MSG3
        CALL MY1
        CALL MY
        MOV AH, 1 
        L1:
           INT 21H
           SUB AL, '0'
           MOV AR[SI], AL
           INC SI
           LOOP L1
        CALL SORTASC
        CALL PRINT
        CALL SORTDSC
        END:
           MOV AH, 4CH
           INT 21H 
    MAIN ENDP
    
    MY PROC
        XOR CX, CX
        MOV SI, 0
        MOV CL, 7
        RET
    MY ENDP
    
    MY1 PROC
        MOV AH, 9
        INT 21H
        RET
    MY1 ENDP
    
    PRINT PROC
        CALL MY
        P1:
            MOV DL, AR[SI]
            ADD DL, '0'
            MOV AH, 2
            INT 21H
            LEA DX, MSG4
            CALL MY1
            INT 21H
            INC SI
            LOOP P1
        RET
    PRINT ENDP
    
    SORTASC PROC
           LEA DX, NEXTLINE
           CALL MY1
           LEA DX, MSG1
           CALL MY1
           MOV DI, 0
           CALL MY
           O1:
              IN1:
                MOV BL, AR[SI]
                MOV BH, AR[DI]
                CMP BL, BH
                JA LL1
                JMP LL2
                LL1:
                    MOV AR[SI], BH
                    MOV AR[DI], BL
                    JMP LL2
                LL2:
                    INC DI
                LOOP IN1
              INC SI
              MOV DI, SI
              INC DI
              DEC TEMP
              MOV CL, TEMP
              LOOP O1
           RET
    SORTASC ENDP
    
    SORTDSC PROC
          LEA DX, NEXTLINE
          CALL MY1
          LEA DX, MSG2
          CALL MY1
          CALL MY
          MOV SI, 6
        P2:
            MOV DL, AR[SI]
            ADD DL, '0'
            MOV AH, 2
            INT 21H
            LEA DX, MSG4
            CALL MY1
            INT 21H
            DEC SI
            LOOP P2
        RET
    SORTDSC ENDP
                        
END MAIN