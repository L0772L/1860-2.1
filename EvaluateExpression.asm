// EvaluateExpression.asm
// Program: Compute z = 17 + x - 3y
// Inputs: x is stored in R0, y is stored in R1
// Output: z is stored in R2
// Important: R0 and R1 must not be modified

// Load constant 17 into D register
@17
D=A        // D = 17

// Add the value of x (R0) to D
@R0
D=D+M      // D = 17 + x

// Subtract y three times to achieve -3y
@R1
D=D-M      // D = 17 + x - y
D=D-M      // D = 17 + x - 2y
D=D-M      // D = 17 + x - 3y

// Store the result into R2
@R2
M=D        // R2 = 17 + x - 3y

// Infinite loop to end the program
(END)
@END
0;JMP