.MODEL SMALL
.STACK 100H
.DATA
     MSG1 DW "EQUAL$"
     MSG2 DW "NOT EQUAL$";
.CODE
    MAIN PROC
      MOV AX, @DATA
      MOV DS, AX
      
      MOV AL, 7
      MOV BL, 2
      CMP AL, BL
      JZ L1
      JNZ L2
      
      
      L1:
        LEA DX, MSG1
        MOV AH, 9
        INT 21H
        JMP END
        RET
      L2:        
        LEA DX, MSG2
        MOV AH, 9
        INT 21H
        JMP END
        RET
        
      END:
        MOV AH, 4CH
        INT 21H
      
    MAIN ENDP
END MAIN  