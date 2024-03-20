INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
    NEXTLINE DB 0DH, 0AH, "$"
    A DB 'A','B','C','D'
    B DB 1, 2, 3
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV SI, OFFSET A
        MOV CX, 4
        L1:
            MOV DX, [SI]
            MOV AH, 2
            INT 21H
            INC [SI]
            LOOP L1
        MOV AH, 9
        LEA DX, NEXTLINE
        INT 21H
        MOV SI, OFFSET B
        MOV CX, 4
        L2:
            MOV DX, [SI]
            ADD DX, '0'
            MOV AH, 2
            INT 21H
            INC [SI]
            LOOP L2
        
            
        END:
            MOV AH, 4CH
            INT 21H 
    MAIN ENDP
END MAIN