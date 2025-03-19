// Xor.asm
@R0
D=M      // D = x
@R1
D=D&M    // D = x AND y
@temp
M=D      // temp = x AND y

@temp
D=!M     // D = NOT (x AND y)

@R0
D=D|M    // D = (NOT (x AND y)) OR x
@R1
D=D|M    // D = (NOT (x AND y)) OR x OR y

@R2
M=D      // R2 = x ⊕ y
(END)
@END
0;JMP    // 无限循环
