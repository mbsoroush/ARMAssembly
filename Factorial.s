	AREA Factorial,CODE,READONLY
	ENTRY
NUM EQU 10

	LDR R0,=NUM
	MOV R3,#1
	BL FACT
	LDR R5,=X
	STR R3,[R5]

HERE B HERE

FACT
	CMP R0,#1
	MULGT R3,R0,R3
	SUBGT R0,R0,#1
	BGT FACT
	BX LR

	AREA ANS,DATA,READWRITE
X DCD 0
	END
