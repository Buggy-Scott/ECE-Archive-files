;****************** main.s ***************
; Program written by: Anaya Scott and Victoria Dehoyos
; Date Created: 2/3/26
; Last Modified: 
; Brief description of the program: 
;	

		  

	THUMB

AStudent1	EQU		3
AStudent2	EQU		2
AStudent3	EQU		1
AStudent4	EQU		1
AStudent5	EQU		3
	
BStudent1	EQU		5
BStudent2	EQU		1
BStudent3	EQU		4
BStudent4	EQU		3
BStudent5	EQU		2
	
CStudent1	EQU		7
CStudent2	EQU		4
CStudent3	EQU		5
CStudent4	EQU		3
CStudent5	EQU		6
	
GroupN		EQU		5
	  
	  
; *********************************************************************
; *************************** CODE AREA IN ROM ************************
; *********************************************************************
; ROM addresses start at address 0x0000.0000, but your code starts a little after that
	AREA    |.text|, CODE, READONLY, ALIGN=2			; Flash EEPROM
		  
		  

		  
	EXPORT  Start

; * Program begins here!
Start

; ********************************* TASK 1 *********************************
; ***************************************************************************
;Completed by Anaya Scott
; Means
; R12 - MEANS FOR GROUP A, R11 = MEANS FOR GROUP B, R10 = MEANS FOR GROUP C
; R9 = GRAND MEAN <- THIS IS THE AVERAGE MEAN FOR ALL OF THE GROUPS.

; GROUP A 	
	;Load the resistors values for group A
	MOV R0, #AStudent1 
	MOV R1, #AStudent2 
	MOV R2, #AStudent3 
	MOV R3, #AStudent4
	MOV R4, #AStudent5 	
	
	; Summ of Group A
	ADD R5, R0,R1
	ADD R5, R5,R2
	ADD R5, R5,R3
	ADD R5, R5,R4
	
	; THIS WILL GATHER THE NUMBER OF GROUPS
	MOV R6,#GroupN
	SDIV R12,R5,R6 ; THIS LINE WILL GIVE US THE MEAN OF GROUP A
	NOP
	;------------------------------------------------------------
	; GROUP B 	
	;Load the resistors values for group B
	MOV R0, #BStudent1 
	MOV R1, #BStudent2 
	MOV R2, #BStudent3 
	MOV R3, #BStudent4
	MOV R4, #BStudent5 	
	
	; Summ of Group B
	ADD R5, R0,R1
	ADD R5, R5,R2
	ADD R5, R5,R3
	ADD R5, R5,R4
	
	
	SDIV R11,R5,R6 ; THIS LINE WILL GIVE US THE MEAN OF GROUP B
	NOP
	;------------------------------------------------------------
	; GROUP C 	
	;Load the resistors values for group C
	MOV R0, #CStudent1 
	MOV R1, #CStudent2 
	MOV R2, #CStudent3 
	MOV R3, #CStudent4
	MOV R4, #CStudent5 	
	
	; Summ of Group C
	ADD R5, R0,R1
	ADD R5, R5,R2
	ADD R5, R5,R3
	ADD R5, R5,R4
	
	
	SDIV R10,R5,R6 ; THIS LINE WILL GIVE US THE MEAN OF GROUP B
	NOP
	;-------------------------------------------------------
	; THE GRAND MEAN
	ADD R0, R12,R11
	ADD R0, R0,R10
	MOV R1, #3 ; THIS WILL ALLOW US TO DIVIDE BY 3 GROUPS
	SDIV R9,R0,R1 ; GRAND MEAN IS IN R9


	NOP

; ********************************* TASK 2 *********************************
; **************************************************************************
;Completed by Anaya Scott
; Sum of Squared Errors (SS) by Group
; WE  NEED TO FIND THE SUM OF SQUARED ERRORS BY GROUPS
;R8 IS FOR GROUP A
;R7 IS FOR GROUP B
;R6 IS FOR GROUP C
;------------------------------------------------
	;GROUP A
	MOV R8, #0
	; UNDERSTAND THAT WE NEED TO CALCULATE (ASTUDENT1 - MEAN_A)^2
	MOV R0, AStudent1
	SUB R1,R0,R12 ; THIS IS X-MEAN
	MUL R1,R1,R1  ; THIS MAKE (X-MEAN)^2
	ADD R8,R8,R1
	NOP
	; CONTINUE DOING THIS FOR ALL OF THE STUDENTS IN GORUP A,B,C
	;STUDENT 2
	MOV R0, AStudent2
	SUB R1,R0,R12 ; THIS IS X-MEAN
	MUL R1,R1,R1  ; THIS MAKE (X-MEAN)^2
	ADD R8,R8,R1
	NOP
	;STUDENT 3
	MOV R0, AStudent3
	SUB R1,R0,R12 ; THIS IS X-MEAN
	MUL R1,R1,R1  ; THIS MAKE (X-MEAN)^2
	ADD R8,R8,R1
	NOP
	;STUDENT 4
	MOV R0, AStudent4
	SUB R1,R0,R12 ; THIS IS X-MEAN
	MUL R1,R1,R1  ; THIS MAKE (X-MEAN)^2
	ADD R8,R8,R1
	NOP
	;STUDENT 5
	MOV R0, AStudent5
	SUB R1,R0,R12 ; THIS IS X-MEAN
	MUL R1,R1,R1  ; THIS MAKE (X-MEAN)^2
	ADD R8,R8,R1 ; NOW R8 SHOULD HAVE ALL OF THE SSE FOR GROUP A.
	NOP
	;------------------------------------------
	;GROUP B
	MOV R7,#0
	;STUDENT 1
	MOV R0, BStudent1
	SUB R1,R0,R11 ; THIS IS X-MEAN
	MUL R1,R1,R1  ; THIS MAKE (X-MEAN)^2
	ADD R7,R7,R1 
	NOP
	;STUDENT 2
	MOV R0, BStudent2
	SUB R1,R0,R11 ; THIS IS X-MEAN
	MUL R1,R1,R1  ; THIS MAKE (X-MEAN)^2
	ADD R7,R7,R1 
	NOP
	;STUDENT 3
	MOV R0, BStudent3
	SUB R1,R0,R11 ; THIS IS X-MEAN
	MUL R1,R1,R1  ; THIS MAKE (X-MEAN)^2
	ADD R7,R7,R1 
	NOP
	;STUDENT 4
	MOV R0, BStudent4
	SUB R1,R0,R11 ; THIS IS X-MEAN
	MUL R1,R1,R1  ; THIS MAKE (X-MEAN)^2
	ADD R7,R7,R1 
	NOP
	;STUDENT 5
	MOV R0, BStudent5
	SUB R1,R0,R11 ; THIS IS X-MEAN
	MUL R1,R1,R1  ; THIS MAKE (X-MEAN)^2
	ADD R7,R7,R1 
	NOP
	;-----------------------------------------------
	;GROUP C
	MOV R6,#0
	;STUDENT 1
	MOV R0, CStudent1
	SUB R1,R0,R10 ; THIS IS X-MEAN
	MUL R1,R1,R1  ; THIS MAKE (X-MEAN)^2
	ADD R6,R6,R1
	NOP	
	;STUDENT 2
	MOV R0, CStudent2
	SUB R1,R0,R10 ; THIS IS X-MEAN
	MUL R1,R1,R1  ; THIS MAKE (X-MEAN)^2
	ADD R6,R6,R1
	NOP
	;STUDENT 3
	MOV R0, CStudent3
	SUB R1,R0,R10 ; THIS IS X-MEAN
	MUL R1,R1,R1  ; THIS MAKE (X-MEAN)^2
	ADD R6,R6,R1 
	NOP
	;STUDENT 4
	MOV R0, CStudent4
	SUB R1,R0,R10 ; THIS IS X-MEAN
	MUL R1,R1,R1  ; THIS MAKE (X-MEAN)^2
	ADD R6,R6,R1 
	NOP
	;STUDENT 5
	MOV R0, CStudent5
	SUB R1,R0,R10 ; THIS IS X-MEAN
	MUL R1,R1,R1  ; THIS MAKE (X-MEAN)^2
	ADD R6,R6,R1 
	NOP
	
; NEED TO DOUBLE CHECK TASK 2 !!!!!!!!!!




; ********************************* TASK 3 *********************************
; **************************************************************************
; Completed by Victoria Dehoyos
; SSR -> Regression Sum of Squares
	; R5 = (meanA - grandMean)^2 + (meanB - grandMean)^2 + (meanC - grandMean)^2 
	MOV  R5, #0 
	; (R12 - R9)^2 
	SUB  R0, R12, R9 
	MUL  R0, R0, R0 
	ADD  R5, R5, R0 
	; (R11 - R9)^2 
	SUB  R0, R11, R9 
	MUL  R0, R0, R0 
	ADD  R5, R5, R0 
	; (R10 - R9)^2 
	SUB  R0, R10, R9 
	MUL  R0, R0, R0 
	ADD  R5, R5, R0
		
	
	NOP
	
	

; ********************************* TASK 4 *********************************
; **************************************************************************
;Completed by Victoria Dehoyos
; SSE -> error sum of squares total
; SSE (R4) = SS1 (R8) + SS2 (R7) + SS3 (R6)


		
	ADD  R4, R8, R7 
	ADD  R4, R4, R6 
	ADD  R3, R5, R4 
	NOP






	NOP

    ALIGN      ; make sure the end of this section is aligned
    END        ; end of file

