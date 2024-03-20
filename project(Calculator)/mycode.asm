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
    RESULT2 DW ?
    TEMP DW 0
    AR DW 10 DUP(?)
    AR1 DW 10 DUP(?)
    N DW 2
    RESULTMAT DW 10 DUP(?)
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        GOTOXY 25, 2
        PRINT 'WELCOME TO MICRO CALCULATOR'
        PRINTN
        PRINTN
        PRINT 'NOTE: RANGE OF THIS MICRO CALCULATOR IS [0, 65535].'
        PRINTN
        CALL MYOPTION
        L1:
            ;PRINTN
            PRINTN
            PRINT 'ENTER YOUR CHOICE: '
            CALL MYFUNC
            CMP AX, 1
            JE AD
            CMP AX, 2
            JE SB
            CMP AX, 3
            JE MP
            CMP AX, 4
            JE DV
            CMP AX, 5
            JE FACT
            CMP AX, 6
            JE SQ
            CMP AX, 7
            JE RT
            CMP AX, 8
            JE CB
            CMP AX, 9
            JE LG
            CMP AX, 10
            JE DR
            CMP AX, 11
            JE RD
            CMP AX, 12
            JE NR
            CMP AX, 13
            JE NP
            CMP AX, 14
            JE MT
            JMP END
            
            AD:
               PRINTN
               CALL AD1
               MOV CX, 10
               JMP SKIP
               
            SB:
               PRINTN
               CALL SB1
               MOV CX, 10
               JMP SKIP
            MP:
               PRINTN
               CALL MP1
               MOV CX, 10
               JMP SKIP
            DV:
               PRINTN
               CALL DV1
               MOV CX, 10
               JMP SKIP
            FACT:
               PRINTN
               CALL FACT1
               MOV CX, 10
               JMP SKIP
            SQ:
               PRINTN
               CALL SQ1
               MOV CX, 10
               JMP SKIP
            RT:
               PRINTN
               CALL RT1
               MOV CX, 10
               JMP SKIP
            CB:
               PRINTN
               CALL CB1
               MOV CX, 10
               JMP SKIP
            LG:
               PRINTN
               CALL LG1
               MOV CX, 10
               JMP SKIP
            DR:
               PRINTN
               CALL DRR
               MOV CX, 10
               JMP SKIP
            RD:
               PRINTN
               CALL RD1
               MOV CX, 10
               JMP SKIP
            NR:
               PRINTN
               CALL NR1
               MOV CX, 10
               JMP SKIP
            NP:
               PRINTN
               CALL NP1
               MOV CX, 10
               JMP SKIP
            MT:
               PRINTN
               CALL MT1
               MOV CX, 10
               JMP SKIP
               
            SKIP:
               PRINTN
            LOOP L1
           
        END:
            PRINTN
            PRINTN
            PRINT 'THANKS FOR USING MICRO CALCULATOR.'
            MOV AH, 4CH
            INT 21H
    MAIN ENDP
    
    MYFUNC PROC
        CALL SCAN_NUM
        MOV AX, CX
        RET
    MYFUNC ENDP
    
    
    MYOPTION PROC
        PRINT 'CHOOSE YOUR OPTION FROM BELOW:'
        PRINTN
        PRINT '1. ADD'
        PRINTN
        PRINT '2. SUBTRACT'
        PRINTN
        PRINT '3. MULTIPLY'
        PRINTN
        PRINT '4. DIVIDE'
        PRINTN
        PRINT '5. FACTORIAL'
        PRINTN
        PRINT '6. SQUARE'
        PRINTN
        PRINT '7. ROOT'
        PRINTN
        PRINT '8. CUBE'
        PRINTN
        PRINT '9. LOGARITHM'
        PRINTN
        PRINT '10. DEGREE TO RADIAN'
        PRINTN
        PRINT '11. RADIAN TO DEGREE'
        PRINTN
        PRINT '12. NcR'
        PRINTN
        PRINT '13. NpR'
        PRINTN
        PRINT '14. MATRIX MULTIPLICATION(2X2)'
        PRINTN
        PRINT 'PRESS OTHER NUMBER WITHOUT OPTION TO QUIT'
        PRINTN
        RET
    MYOPTION ENDP
    
    AD1 PROC
        PRINTN
        PRINT 'ENTER FIRST NUMBER: '
        CALL SCAN_NUM
        MOV RESULT, CX
        PRINTN
        PRINT 'ENTER SECOND NUMBER: '
        CALL SCAN_NUM
        ADD RESULT, CX
        PRINTN
        XOR AX, AX
        MOV AX, RESULT
        PRINT 'AFTER ADDING TWO NUMBER RESULT IS: '
        CALL PRINT_NUM_UNS
        PRINTN
        RET
    AD1 ENDP
    
    SB1 PROC
        PRINTN
        PRINT 'ENTER FIRST NUMBER: '
        CALL SCAN_NUM
        MOV RESULT, CX
        PRINTN
        PRINT 'ENTER SECOND NUMBER: '
        CALL SCAN_NUM
        CMP RESULT, CX
        JB S1
        JMP S2
        S1:
            SUB CX, RESULT
            PRINTN
            XOR AX, AX
            MOV AX, CX
            PRINT 'AFTER SUBTRACTING TWO NUMBER RESULT IS: -'
            CALL PRINT_NUM_UNS
            JMP SKIP1
            
        S2:
           SUB RESULT, CX
           PRINTN
           XOR AX, AX
           MOV AX, RESULT
           PRINT 'AFTER SUBTRACTING TWO NUMBER RESULT IS: '
           CALL PRINT_NUM_UNS
           PRINTN
        SKIP1:
            PRINTN
        RET
    SB1 ENDP
    
    MP1 PROC
        PRINTN
        PRINT 'ENTER FIRST NUMBER: '
        CALL SCAN_NUM
        MOV BX, CX
        PRINTN
        PRINT 'ENTER SECOND NUMBER: '
        CALL SCAN_NUM
        PRINTN
        XOR AX, AX
        MOV AX, CX
        MUL BX
        PRINT 'AFTER MULTIPLING TWO NUMBER RESULT IS: '
        CALL PRINT_NUM_UNS
        PRINTN
        RET
    MP1 ENDP
    
    DV1 PROC
        PRINTN
        PRINT 'ENTER FIRST NUMBER: '
        CALL SCAN_NUM
        MOV BX, CX
        PRINTN
        PRINT 'ENTER SECOND NUMBER: '
        CALL SCAN_NUM
        PRINTN
        XOR AX, AX
        MOV AX, BX
        DIV CX
        PRINT 'AFTER DIVIDING TWO NUMBER RESULT IS: '
        CALL PRINT_NUM_UNS
        PRINT ' AND REMINDER IS: '
        XOR AX, AX
        MOV AX, DX
        CALL PRINT_NUM_UNS
        PRINTN
        RET
    DV1 ENDP
    
    FACT1 PROC
        PRINTN
        PRINT 'ENTER A NUMBER: '
        CALL SCAN_NUM
        XOR AX, AX
        MOV AX, 1
        CALF:
            MUL CX
            LOOP CALF
        PRINTN
        PRINT 'RESULT OF THE FACTORIAL IS: '
        CALL PRINT_NUM_UNS
        PRINTN
        RET
    FACT1 ENDP
    
    SQ1 PROC
        PRINTN
        PRINT 'ENTER A NUMBER: '
        CALL SCAN_NUM
        XOR AX, AX
        MOV AX, CX
        MUL CX
        PRINTN
        PRINT 'RESULT OF THE SQUARE IS: '
        CALL PRINT_NUM_UNS
        PRINTN
        RET
    SQ1 ENDP
    
    RT1 PROC
        PRINTN
        PRINT 'ENTER A NUMBER: '
        CALL SCAN_NUM
        XOR BX, BX
        MOV BX, 1
        FRESULT:
            XOR AX, AX
            MOV AX, BX
            MUL AX
            CMP AX, CX
            JA SHOWRESULT
            MOV RESULT, BX
            INC BX
            JMP FRESULT
        
        SHOWRESULT:
            PRINTN
            PRINT 'AFTER ROOT THE RESULT IS: '
            XOR AX, AX
            MOV AX, RESULT
            CALL PRINT_NUM_UNS
            MUL AX
            CMP CX, AX
            JE RETURN
            PRINT ' AND SOMETHING.'
            PRINTN
            
         RETURN:
            RET
    RT1 ENDP
    
    CB1 PROC
        PRINTN
        PRINT 'ENTER A NUMBER: '
        CALL SCAN_NUM
        XOR AX, AX
        MOV AX, CX
        MUL CX
        MUL CX
        PRINTN
        PRINT 'RESULT OF THE CUBE IS: '
        CALL PRINT_NUM_UNS
        PRINTN
        RET
    CB1 ENDP
    
    LG1 PROC
        PRINTN
        PRINT 'ENTER BASE NUMBER: '
        CALL SCAN_NUM
        XOR BX, BX
        MOV BX, CX
        PRINTN
        PRINT 'ENTER ARGUMENT: '
        CALL SCAN_NUM
        CMP CX, 0
        JE UNDEF
        CMP CX, 1
        JE ZR
        MOV RESULT, CX
        XOR AX, AX
        MOV AX, BX
        XOR CX, CX
        RES:
            CMP AX, RESULT
            JA RES1
            INC CX
            MUL BX
            JMP RES
        RES1:
            DIV BX
            CMP AX, RESULT
            JE RES2
            XOR AX, AX
            MOV AX, CX
            PRINTN
            PRINT 'RESULT IS: '
            CALL PRINT_NUM_UNS
            PRINT ' AND SOMETHING'
            JMP RN
        RES2:
            XOR AX, AX
            MOV AX, CX
            PRINTN
            PRINT 'RESULT IS: '
            CALL PRINT_NUM_UNS
            JMP RN
        UNDEF:
            PRINTN
            PRINT 'RESULT IS: UNDEFINED'
            JMP RN
        ZR:   
            PRINTN
            PRINT 'RESULT IS: 0'
        RN:
            RET
    LG1 ENDP
    
    DRR PROC
        PRINTN
        PRINT 'ENTER THE NUMBER OF DEGREE: '
        CALL SCAN_NUM
        XOR BX, BX
        MOV BX, 180
        XOR AX, AX
        MOV AX, 3
        MUL CX
        DIV BX
        PRINTN
        PRINT 'THE NUMBER OF RADIAN IS: '
        CALL PRINT_NUM_UNS
        PRINT ' AND SOMETHING'
        RET
    DRR ENDP
    
    RD1 PROC
        PRINTN
        PRINT 'ENTER THE NUMBER OF RADIAN: '
        CALL SCAN_NUM
        XOR BX, BX
        MOV BX, 3
        XOR AX, AX
        MOV AX, 180
        MUL CX
        DIV BX
        PRINTN
        PRINT 'THE NUMBER OF DEGREE IS: '
        CALL PRINT_NUM_UNS
        PRINT ' AND SOMETHING'
        RET
    RD1 ENDP
    
    NR1 PROC
        PRINTN
        PRINT 'ENTER N: '
        CALL SCAN_NUM
        XOR BX, BX
        MOV BX, CX
        PRINTN
        PRINT 'ENTER R: '
        CALL SCAN_NUM
        MOV RESULT1, CX
        XOR AX, AX
        XOR CX, CX
        MOV AX, 1
        MOV CX, BX
        FN:
            MUL CX
            LOOP FN
        MOV RESULT, AX
        XOR AX, AX
        XOR CX, CX
        MOV AX, 1
        MOV CX, RESULT1
        FN1:
            MUL CX
            LOOP FN1
        MOV RESULT2, AX
        SUB BX, RESULT1
        XOR AX, AX
        XOR CX, CX
        MOV AX, 1
        MOV CX, BX
        FN2:
            MUL CX
            LOOP FN2
        MOV RESULT1, AX
        XOR AX, AX
        MOV AX, RESULT
        XOR BX, BX
        MOV BX, RESULT1
        DIV BX    
        XOR BX, BX
        MOV BX, RESULT2
        DIV BX
        PRINTN
        PRINT 'RESULT IS: '
        CALL PRINT_NUM_UNS    
        RET
    NR1 ENDP
    
    NP1 PROC
        PRINTN
        PRINT 'ENTER N: '
        CALL SCAN_NUM
        XOR BX, BX
        MOV BX, CX
        PRINTN
        PRINT 'ENTER R: '
        CALL SCAN_NUM
        MOV RESULT1, CX
        XOR AX, AX
        XOR CX, CX
        MOV AX, 1
        MOV CX, BX
        FP:
            MUL CX
            LOOP FP
        MOV RESULT, AX
        SUB BX, RESULT1
        XOR AX, AX
        XOR CX, CX
        MOV AX, 1
        MOV CX, BX
        FP2:
            MUL CX
            LOOP FP2
        MOV RESULT1, AX
        XOR AX, AX
        MOV AX, RESULT    
        XOR BX, BX
        MOV BX, RESULT1
        DIV BX
        PRINTN
        PRINT 'RESULT IS: '
        CALL PRINT_NUM_UNS    
        RET
    NP1 ENDP
    
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