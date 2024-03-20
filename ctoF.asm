.MODEL SMALL
.STACK 100H
.DATA
    C DW 260
    F DW ?
.CODE
    MAIN PROC
      MOV AX, @DATA
      MOV DS, AX
      
      MOV BX, C
      
      MOV AX, BX
      MOV BX, 9
      MUL BX
      MOV BX, 5
      DIV BX
      MOV BX, 32
      ADD AX, BX
      MOV BX, 1
      SUB AX, BX
      MOV F, AX  
    MAIN ENDP
END MAIN