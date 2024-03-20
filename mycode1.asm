.MODEL SMALL
.STACK 100H

.CODE
    MAIN PROC
        MOV AX, 6
        MOV BX, 2
        ADD AX, BX
        
        MOV AX, 6
        MOV BX, 2
        SUB AX, BX
        
        MOV AX, 6
        MOV BX, 2
        MUL BX 
        
        MOV AX, 6
        MOV BX, 4
        DIV BX
        
        MOV AH, 4CH
        INT 21H
              
    MAIN ENDP
    
END MAIN