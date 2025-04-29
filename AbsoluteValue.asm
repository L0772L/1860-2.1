// AbsoluteValue.asm
// Program: Compute z = |x|
// Inputs: x is stored in R0
// Outputs: z is stored in R1, flags R2 and R3 are set
// Important: Do not modify R0

// Assume no sign and no overflow first
@R2
M=0        // R2 = 0 (x assumed positive)
@R3
M=0        // R3 = 0 (no overflow)

// Load x to check sign
@R0
D=M        // D = x
@NEGATIVE
D;JLT      // If x < 0, jump to NEGATIVE

// x >= 0, copy x directly
@R0
D=M
@R1
M=D        // R1 = x
@END
0;JMP      // End program

(NEGATIVE)
// Set R2 = 1 to mark that x was negative
@R2
M=1

// Check if x is -32768 (special overflow case)
@R0
D=M
@32768
D=D+A      // D = x + 32768
@OVERFLOW
D;JEQ      // If zero, x was -32768

// Normal negative number, compute absolute value
@R0
D=M
D=-D       // D = -x
@R1
M=D        // Store |x| in R1
@END
0;JMP

(OVERFLOW)
// Overflow: set R3 = 1 and store original x into R1
@R3
M=1
@R0
D=M
@R1
M=D

(END)
// Infinite loop to end program
@END
0;JMP
