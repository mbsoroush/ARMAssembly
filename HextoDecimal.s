	AREA htod,CODE,READONLY
	ENTRY
NUM EQU 0XFFF	;Take Hex number
	MOV R2,#0  ;for answer 
	MOV R3,#0 
	MOV R4,#0 
	LDR R1,=NUM		;take the number
LOOP
	CMP R1,#1000
	BLT NEXT
	SUB R1,R1,#1000
	ADD R2,R2,#1
	B LOOP		;repeat till num < 1000
NEXT
	CMP R1,#100
	BLT NEXT1
	SUB R1,R1,#100
	ADD R3,R3,#1
	B NEXT		;repeat till num < 100
NEXT1			
	CMP R1,#10
	BLT NEXT2
	SUB R1,R1,#10
	ADD R4,R4,#1
	B NEXT1		;repeat till num < 10
NEXT2
	LDR R5,=RESULT		;R2 = 4,R3 = 0, R4 = 9, R1 = 5 
	ADD R1,R4,LSL#4		;R1 = 5 + (9<<4) = 5 + 90 = 95
	ADD R3,R2,LSL#4		;R3 = 0 + (4<<4) = 0 + 40 = 40
	STRB R1,[R5],#1
	STRB R3,[R5]
HERE B HERE
		AREA DATA2,DATA,READWRITE
RESULT DCB 0X0, 0X0
	END		;Mark end of file