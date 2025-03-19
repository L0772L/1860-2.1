// AddWithOverflowCheck.asm
@R0
D=M       // D = x
@R1
D=D+M     // D = x + y
@R2
M=D       // R2 = x + y

// 检查溢出
@R0
D=M       // D = x
@POS_X
D;JGE     // 如果 x >= 0，跳转检查正数情况

// x < 0
@R1
D=M
@NEG_X_NEG_Y
D;JLT     // 如果 y < 0，跳转检查负数溢出

@R3
M=0       // R3 = 0（无溢出）
@END
0;JMP     // 结束

(NEG_X_NEG_Y)
@R2
D=M
@R3
M=1       // 负数溢出
@END
0;JMP

(POS_X)
@R1
D=M
@POS_X_POS_Y
D;JGE     // 如果 y >= 0，跳转检查正数溢出

@R3
M=0       // R3 = 0（无溢出）
@END
0;JMP

(POS_X_POS_Y)
@R2
D=M
@R3
M=1       // 正数溢出
@END
0;JMP

(END)
@END
0;JMP     // 无限循环
