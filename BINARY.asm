PRINTSTR MACRO STRING
    LEA DX, STRING
    MOV AH, 9
    INT 21H
ENDM

BINARY MACRO NN, ARR, SN
        XOR SI, SI
        XOR DI, DI
        ;XOR BX, BX
        MOV DI, NN
        DEC DI
        L1:
            CMP SI, DI
            JA VALNFD
            XOR BX, BX
            ADD BX, SI
            ADD BX, DI
            SHR BX, 1
            XOR CX, CX
            MOV CL, ARR[BX]
            CMP CL, SN
            JE VALFD
            JB INCSI
            JA DECDI
        
        INCSI:
            MOV SI, BX
            INC SI
            JMP L1
        
        DECDI:
            MOV DI, BX
            DEC DI
            JMP L1
            
        VALNFD:
            PRINTSTR MSG5
            JMP ED
            
        VALFD:
            PRINTSTR MSG4
            
        ED:
            PRINTSTR MSG3      
ENDM    

.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'ENTER SIZE OF AN ARRAY(1-9): $'
    MSG2 DB 'ENTER VALUES OF AN ARRAY: $'
    MSG3 DB ' $'
    MSG4 DB 'VALUE FOUND.$'
    MSG5 DB 'VALUE NOT FOUND.$'
    NEXTLINE DB 0DH, 0AH, '$'
    N DW 5
    AR DB 10, 20, 25, 30, 35
    SEARCHNUM DB 9
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        ;PRINTSTR MSG1
        ;MOV AH, 1
        ;INT 21H
        ;SUB AL, '0'
        ;XOR BX, BX
        ;MOV BL, AL
        ;MOV N, BX
        
        ;PRINTSTR NEXTLINE
        ;PRINTSTR MSG2
        
        ;MOV SI, 0
        ;XOR CX, CX
        ;MOV CX, N
        ;TAKEVALUE:
             ;MOV AH, 1
             ;INT 21H
             ;SUB AL, '0'
             ;MOV AR[SI], AL
             ;PRINTSTR MSG3
             ;INC SI
             ;LOOP TAKEVALUE
        
        ;PRINTSTR NEXTLINE
        BINARY N, AR, SEARCHNUM
            
        END:
            MOV AH, 4CH
            INT 21H 
    MAIN ENDP
   
END MAIN