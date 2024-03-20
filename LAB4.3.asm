.MODEL SMALL
.STACK 100H
.DATA
    I DW 1
    N DW 50
    SUM DW ?
    SUM1 DW ?
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
         
        MOV CX, 50
        
        XOR BX, BX
        
        L1:
           ADD BX, I
           ADD I, 2
           LOOP L1

        MOV SUM, BX
        MOV BX, 10
        XOR AX, AX
        MOV AX, SUM
        DIV BX
        MOV SUM, AX
        MOV CL, DL
        
        MOV BX, 10
        XOR AX, AX
        MOV AX, SUM
        DIV BX
        MOV SUM, AX
        MOV CH, DL
        
        MOV BX, 10
        XOR AX, AX
        MOV AX, SUM
        DIV BX
        MOV SUM, AX
        MOV BH, DL
        ADD AL, '0'
        MOV DL, AL
        MOV AH, 2
        INT 21H
        
        ADD BH, '0'
        MOV DL, BH
        MOV AH, 2
        INT 21H
        
        ADD CH, '0'
        MOV DL, CH
        MOV AH, 2
        INT 21H
        
        
        ADD CL, '0'
        MOV DL, CL
        MOV AH, 2
        INT 21H
        
        SUMWITHFORMULA:;N/2[2A+(N-1)D],A=1,D=2,N=50
             XOR AX, AX
             MOV AX, 1
             MOV BX, 2
             MUL BX
             MOV SUM1, AX
             MOV BX, N
             DEC BX
             XOR AX, AX
             MOV AX, BX
             MOV BX, 2
             MUL BX
             ADD AX, SUM1
             DIV BX
             MOV BX, N
             MUL BX
             MOV SUM1, AX
        
        END:
            MOV AH, 4CH
            INT 21H 
    MAIN ENDP
END MAIN