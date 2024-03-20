.MODEL SMALL
.STACK 100H
.DATA
    C DW ?
    F DW 1000
.CODE
    MAIN PROC
      MOV AX, @DATA
      MOV DS, AX
      
      MOV BX, F
      
      MOV AX, BX
      MOV BX, 32
      SUB AX, BX
      MOV BX, 5
      MUL BX
      MOV BX, 9
      DIV BX
      MOV BX, 1
      ADD AX, BX
      MOV C, AX  
    MAIN ENDP
END MAIN