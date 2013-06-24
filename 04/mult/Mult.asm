// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[3], respectively.)

// Put your code here.

// Set the result to 0
	@R2
	M=0

// Is R0 already zero?
	@R0
	D=M
	@END
	D;JEQ 

// Store R1 in i (We decrement i in each loop, adding R0 to R2.)
	@R1
	D=M
	@i
	M=D

(LOOP)

// Is i zero?
	@i
	D=M
	@END
	D;JEQ 

	// R2 = R2 + R0
	@R2
	D=M
	@R0
	D=D+M
	@R2
	M=D
	
// Decrement R1, and loop back.
	@i
	M=M-1
	@LOOP
	0;JMP
	
(END)
	@END
	0;JMP