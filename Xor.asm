// Xor.asm
// Program: Compute z = x XOR y
// Inputs: x is stored in R0, y is stored in R1
// Output: z is stored in R2
// Important: R0 and R1 must not be modified

// Copy x into D
@R0
D=M        // D = x

// Compute NOT x and store into R3
@R3
M=D        // R3 = x
@R3
M=!M       // R3 = NOT x

// Copy y into D
@R1
D=M        // D = y

// Compute NOT y and store into R4
@R4
M=D        // R4 = y
@R4
M=!M       // R4 = NOT y

// Compute (x AND NOT y)
@R0
D=M        // D = x
@R4
D=D&M      // D = x AND (NOT y)
@R5
M=D        // Store in R5

// Compute (NOT x AND y)
@R3
D=M        // D = NOT x
@R1
D=D&M      // D = (NOT x) AND y
@R6
M=D        // Store in R6

// Combine the two parts with OR to get XOR result
@R5
D=M        // D = first part
@R6
D=D|M      // D = (x AND NOT y) OR (NOT x AND y)
@R2
M=D        // Store result into R2

// Infinite loop to end program
(END)
@END
0;JMP
