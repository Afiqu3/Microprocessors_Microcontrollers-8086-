
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.DATA
.CODE
    MAIN PROC
    MOV CX, 10
    MOV DX, '9'
    L1:
      MOV AH, 2
      INT 21H
      
      DEC DX
      LOOP L1


ret




