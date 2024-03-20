PRINTSTR MACRO STRING
    LEA DX, STRING
    MOV AH, 9
    INT 21H
ENDM

CALCULATEODD MACRO NN, ARR
    XOR CX, CX
    XOR SI, SI
    MOV SI, 0
    L1:
        CMP SI, NN
        JE RETURN
        MOV BL, 2
        XOR AX, AX
        MOV AL, ARR[SI]
        DIV BL
        CMP AH, 0
        JE EV
        JMP OD
        OD:
            ADD CL, ARR[SI]
            INC SI
            JMP L1
        EV:
            ADD CH, ARR[SI]
            INC SI
            JMP L1
    
    RETURN:
        PRINTSTR NEXTLINE
        PRINTSTR MSG4
        MOV BL, 10
        XOR AX, AX
        MOV AL, CL
        DIV BL
        MOV BH, AH
        ADD AL, '0'
        MOV DL, AL
        MOV AH, 2
        INT 21H
        ADD BH, '0'
        MOV DL, BH
        MOV AH, 2
        INT 21H
        PRINTSTR NEXTLINE
        PRINTSTR MSG5
        MOV BL, 10
        XOR AX, AX
        MOV AL, CH
        DIV BL
        MOV BH, AH
        ADD AL, '0'
        MOV DL, AL
        MOV AH, 2
        INT 21H
        ADD BH, '0'
        MOV DL, BH
        MOV AH, 2
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
    NEXTLINE DB 0DH, 0AH, '$'
    N DW ?
    AR DB ?
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
        MOV N, BX
        
        PRINTSTR NEXTLINE
        PRINTSTR MSG2
        
        MOV SI, 0
        XOR CX, CX
        MOV CX, N
        TAKEVALUE:
             MOV AH, 1
             INT 21H
             SUB AL, '0'
             MOV AR[SI], AL
             PRINTSTR MSG3
             INC SI
             LOOP TAKEVALUE
        
        PRINTSTR NEXTLINE
        CALCULATEODD N, AR
            
        END:
            MOV AH, 4CH
            INT 21H 
    MAIN ENDP
   
END MAIN