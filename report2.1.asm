.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "ENTER A CHARACTER TO CHECK VOWEL OR NOT: $"
    MSG2 DB "VOWEL$"
    MSG3 DB "NOT VOWEL$"
    NEXTLINE DB 0DH, 0AH, "$"
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 9
        LEA DX, MSG1
        INT 21H
        
        MOV AH, 1
        INT 21H
        MOV BL, AL
        
        CMP BL, 'A'
        JE VOWEL
        CMP BL, 'E'
        JE VOWEL
        CMP BL, 'I'
        JE VOWEL
        CMP BL, 'O'
        JE VOWEL
        CMP BL, 'U'
        JE VOWEL
        CMP BL, 'a'
        JE VOWEL
        CMP BL, 'e'
        JE VOWEL
        CMP BL, 'i'
        JE VOWEL
        CMP BL, 'o'
        JE VOWEL
        CMP BL, 'u'
        JE VOWEL
        
        MOV AH, 9
        LEA DX, NEXTLINE
        INT 21H
             
        MOV AH, 9
        LEA DX, MSG3
        INT 21H
        
        JMP END
        VOWEL:
             MOV AH, 9
             LEA DX, NEXTLINE
             INT 21H
             
             MOV AH, 9
             LEA DX, MSG2
             INT 21H
             
             JMP END
        END:
            MOV AH, 4CH
            INT 21H   
    MAIN ENDP
END MAIN