INCLUDE 'EMU8086.INC'

PRINT2DARRAY MACRO ARRAY, CNT
        XOR CX, CX
        MOV CX, CNT
        XOR BP, BP
        RESMT:
            MOV AX, ARRAY[BP] 
            CALL PRINT_NUM_UNS
            PRINT ' '
            ADD BP, 2
            MOV AX, ARRAY[BP] 
            CALL PRINT_NUM_UNS
            ADD BP, 2
            PRINTN
            LOOP RESMT
        PRINTN
ENDM
    
.MODEL SMALL
.STACK 100H
.DATA
    RESULT DW ?
    RESULT1 DW ?
    TEMP DW 0
    AR DW 10 DUP(?)
    AR1 DW 10 DUP(?)
    N DW 2
    RESULTMAT DW 10 DUP(?)
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        CALL MT1
            
        END:
            MOV AH, 4CH
            INT 21H 
    MAIN ENDP
    
    MT1 PROC
        PRINTN
        PRINT 'ENTER FIRST ROW OF FIRST MATRIX: '
        XOR SI, SI
        XOR BX, BX
        MOV BX, 2
        MTR:
            PRINTN
            CALL SCAN_NUM
            MOV AR[SI], CX
            ADD SI, 2
            DEC BX
            CMP BX, 0
            JNE MTR
        PRINTN
        PRINT 'ENTER SECOND ROW OF FIRST MATRIX: '
        XOR BX, BX
        MOV BX, 2
        MTR1:
            PRINTN
            CALL SCAN_NUM
            MOV AR[SI], CX
            ADD SI, 2
            DEC BX
            CMP BX, 0
            JNE MTR1
        PRINTN
        
        PRINT 'ENTER FIRST COLUMN OF SECOND MATRIX: '
        XOR SI, SI
        XOR BX, BX
        MOV BX, 2
        MTC:
            PRINTN
            CALL SCAN_NUM
            MOV AR1[SI], CX
            ADD SI, 2
            DEC BX
            CMP BX, 0
            JNE MTC
        PRINTN
        PRINT 'ENTER SECOND COLUMN OF SECOND MATRIX: '
        XOR BX, BX
        MOV BX, 2
        MTC1:
            PRINTN
            CALL SCAN_NUM
            MOV AR1[SI], CX
            ADD SI, 2
            DEC BX
            CMP BX, 0
            JNE MTC1
        PRINTN
        
        XOR BX, BX
        XOR BP, BP
        XOR CX, CX
        MOV CL, 2
        XOR SI, SI
        XOR DI, DI
        MT11:
            XOR AX, AX
            MOV AX, AR[SI]
            MOV BX, AR1[DI]
            MUL BX
            ADD TEMP, AX
            ADD SI, 2
            ADD DI, 2
            LOOP MT11
         XOR BX, BX
         MOV BX, TEMP
         MOV RESULTMAT[BP], BX
         ADD BP, 2
         XOR BX, BX
         XOR CX, CX
         MOV CL, 2
         XOR SI, SI
         MOV TEMP, BX
         MT12:
            XOR AX, AX
            MOV AX, AR[SI]
            MOV BX, AR1[DI]
            MUL BX
            ADD TEMP, AX
            ADD SI, 2
            ADD DI, 2
            LOOP MT12
         XOR BX, BX
         MOV BX, TEMP
         MOV RESULTMAT[BP], BX
         ADD BP, 2
         XOR BX, BX
         XOR CX, CX
         MOV CL, 2
         XOR SI, SI
         MOV SI, 4
         XOR DI, DI
         MOV TEMP, BX
         MT21:
             XOR AX, AX
             MOV AX, AR[SI]
             MOV BX, AR1[DI]
             MUL BX
             ADD TEMP, AX
             ADD SI, 2
             ADD DI, 2
             LOOP MT21
         XOR BX, BX
         MOV BX, TEMP
         MOV RESULTMAT[BP], BX
         ADD BP, 2
         XOR BX, BX
         XOR CX, CX
         MOV CL, 2
         XOR SI, SI
         MOV SI, 4
         MOV TEMP, BX
         MT22:
             XOR AX, AX
             MOV AX, AR[SI]
             MOV BX, AR1[DI]
             MUL BX
             ADD TEMP, AX
             ADD SI, 2
             ADD DI, 2
             LOOP MT22
         XOR BX, BX
         MOV BX, TEMP
         MOV RESULTMAT[BP], BX
         PRINTN
         PRINT 'RESULT IS:'
         PRINTN
         PRINT2DARRAY RESULTMAT, N
         RET
    MT1 ENDP
    DEFINE_PRINT_STRING
    DEFINE_PTHIS
    DEFINE_GET_STRING
    DEFINE_CLEAR_SCREEN
    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS
        
END MAIN