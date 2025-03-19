// AbsoluteValue.asm
@R0
D=M      // D = x

@R2
M=0      // R2 = 0 (默认 x 是正数)
@R3
M=0      // R3 = 0 (默认无溢出)

// 检查 x 是否为负数 (检查最高位是否为 1)
@R0
D=M      // D = x
@NEGATIVE
D;JLT    // 如果 x < 0，跳转到 NEGATIVE 处理

// x 是正数，直接存到 R1
@R0
D=M
@R1
M=D      // R1 = x
@END
0;JMP    // 结束

(NEGATIVE)
// x 是负数，标记 R2 = 1
@R2
M=1

// 检查 x 是否是 -32768 (1000000000000000)
@R0
D=M
@32768
D=D+A    // D = x + 32768
@OVERFLOW
D;JEQ    // 如果 x == -32768，跳转到 OVERFLOW 处理

// 计算 |x| = -x = ~x + 1
@R0
D=M
D=-D     // D = -x
@R1
M=D      // R1 = |x|

@END
0;JMP    // 结束

(OVERFLOW)
// 溢出情况: R3 = 1, R1 直接存原值
@R3
M=1
@R0
D=M
@R1
M=D      // R1 = x (因为 -32768 不能转换为正数)

(END)
@END
0;JMP    // 无限循环
