// AddWithOverflowCheck.asm
// Program: Compute z = x + y and check for overflow
// Inputs: x in R0, y in R1
// Output: z in R2, overflow flag in R3
// Important: R0 and R1 must not be modified

// Sum x + y
@R0
D=M        // D = x
@R1
D=D+M      // D = x + y
@R2
M=D        // Store sum into R2

// Reload x to check sign
@R0
D=M        // D = x
@POS_X
D;JGE      // If x >= 0, go to POS_X

// x < 0
@R1
D=M
@NEG_X_NEG_Y
D;JLT      // If y < 0, go to NEG_X_NEG_Y

// x < 0 and y >= 0 => no overflow
@R3
M=0        // Overflow flag = 0
@END
0;JMP

(NEG_X_NEG_Y)
// Both x and y negative
@R2
D=M
@R3
M=1        // Assume overflow
@END
0;JMP

(POS_X)
// x >= 0
@R1
D=M
@POS_X_POS_Y
D;JGE      // If y >= 0, check positive overflow

// x >= 0 and y < 0 => no overflow
@R3
M=0
@END
0;JMP

(POS_X_POS_Y)
// Both x and y positive
@R2
D=M
@R3
M=1        // Assume overflow
@END
0;JMP

(END)
// Infinite loop to end program
@END
0;JMP
