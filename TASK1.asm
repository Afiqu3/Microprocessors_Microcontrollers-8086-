PRINTSTR MACRO STRING
    LEA DX, STRING
    MOV AH, 9
    INT 21H
ENDM
    

.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'ENTER SIZE OF AN ARRAY(1-9): $'
    MSG2 DB 'ENTER VALUES OF AN ARRAY: $'
    MSG3 DB ' $'
    MSG4 DB 'SUM OF ODD DIGITS: $'
    MSG5 DB 'SUM OF EVEN DIGITS: $'
    MSG6 DB 'ODD DIGITS: $'
    MSG7 DB 'EVEN DIGITS: $'
    NEXTLINE DB 0DH, 0AH, '$'
    N DB ?
    AR DB ?
    RESULT DW 0
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        PRINTSTR MSG1
        MOV AH, 1
        INT 21H
        SUB AL, '0'
        XOR BX, BX
        MOV BL, AL
        MOV N, BL
        
        PRINTSTR NEXTLINE
        PRINTSTR MSG2
        
        MOV SI, 0
        XOR CX, CX
        MOV CL, N
        TAKEVALUE:
             MOV AH, 1
             INT 21H
             SUB AL, '0'
             MOV AR[SI], AL
             PRINTSTR MSG3
             INC SI
             LOOP TAKEVALUE
        
        MOV SI, 0
        XOR CX, CX
        MOV CL, N
        XOR BX, BX
        SUM:
           XOR AX, AX
           MOV AL, AR[SI]
           MUL AL
           ADD BX, AX
           INC SI
           LOOP SUM
           
        MOV RESULT, BX
        
        PRINTSTR NEXTLINE
        XOR AX, AX
        MOV AX, BX
        MOV BX, 10
        DIV BX
        XOR CX, CX
        MOV CL, AH
        MOV DL, AL
        ADD DL, '0'
        MOV AH, 2
        INT 21H
        MOV DL, CL
        ADD DL, '0'
        MOV AH, 2
        INT 21H
         
            
        END:
            MOV AH, 4CH
            INT 21H 
    MAIN ENDP
    
END MAIN