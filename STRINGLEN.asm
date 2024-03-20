PRINTSTR MACRO STRING
    LEA DX, STRING
    MOV AH, 9
    INT 21H
ENDM

COUNTLEN MACRO STR
       MOV SI, OFFSET STR
       XOR CX, CX
       CNT:
            CMP [SI], 0
            JE RETURN
            INC SI
            INC CX
            JMP CNT
       RETURN:
            MOV RESULT, CX
ENDM

.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'ENTER SIZE OF AN ARRAY(1-9): $', 0
    MSG2 DB 'ENTER VALUES OF AN ARRAY: $', 0
    MSG3 DB ' $'
    MSG4 DB 'SUM OF ODD DIGITS: $', 0
    MSG5 DB 'SUM OF EVEN DIGITS: $', 0
    MSG6 DB 'ODD DIGITS: $', 0
    MSG7 DB 'EVEN.', 0
    NEXTLINE DB 0DH, 0AH, '$'
    N DB ?
    AR DB ?
    RESULT DW 0
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
              
        COUNTLEN MSG7    
        END:
            MOV AH, 4CH
            INT 21H 
    MAIN ENDP
    
END MAIN