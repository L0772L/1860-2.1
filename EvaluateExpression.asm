// EvaluateExpression.asm

@17
D=A      // D = 17

@R0
D=D+M    // D = 17 + x

@R1
D=D-M    // D = 17 + x - y
D=D-M    // D = 17 + x - 2y
D=D-M    // D = 17 + x - 3y

@R2
M=D      // R2 = 17 + x - 3y

(END)
@END
0;JMP    // 无限循环
