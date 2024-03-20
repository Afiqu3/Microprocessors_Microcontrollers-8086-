.MODEL SMALL
.STACK 100H
.DATA
    FACT DW ?
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 1
        INT 21H
        SUB AL, '0'
        MOV CL, AL
        
        XOR AX, AX
        MOV AX, 1
        XOR CH, CH
        
        L1:
           MUL CX
           LOOP L1

        MOV FACT, AX
            
        END:
            MOV AH, 4CH
            INT 21H 
    MAIN ENDP
END MAIN