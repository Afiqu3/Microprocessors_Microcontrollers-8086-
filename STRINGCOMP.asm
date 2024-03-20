PRINTSTR MACRO STRING
    LEA DX, STRING
    MOV AH, 9
    INT 21H
ENDM

COMPSTRING MACRO STR1, STR2
       XOR SI, SI
       L1:
            XOR CX, CX
            XOR BX, BX
            MOV CL, STR1[SI]
            MOV BL, STR2[SI]
            CMP CL, BL
            JNE WRONG
            CMP STR1[SI], 0
            JE RIGHT
            INC SI
            ;INC DI
            JMP L1
       WRONG:
            PRINTSTR MSG5
            JMP RETURN
       RIGHT:
            PRINTSTR MSG4
            
       RETURN:
        
ENDM

.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'ENTER SIZE OF AN ARRAY(1-9): $', 0
    MSG2 DB 'ENTER VALUES OF AN ARRAY: $', 0
    MSG3 DB ' $'
    MSG4 DB 'MATCHED$', 0
    MSG5 DB 'NOT MATCHED$', 0
    MSG6 DB 20 DUP(?)
    MSG7 DB 20 DUP(?)
    NEXTLINE DB 0DH, 0AH, '$'
    N DB ?
    AR DB ?
    RESULT DW 0
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        XOR CX, CX
        MOV CL, 2
        XOR SI, SI
        L2:
           MOV AH, 1
           INT 21H
           MOV MSG6[SI], AL
           INC SI
           LOOP L2
        XOR CX, CX
        MOV CL, 3
        XOR SI, SI
        L3:
           MOV AH, 1
           INT 21H
           MOV MSG7[SI], AL 
           INC SI
           LOOP L3 
      
        COMPSTRING MSG6, MSG7    
        END:
            MOV AH, 4CH
            INT 21H 
    MAIN ENDP
    
END MAIN