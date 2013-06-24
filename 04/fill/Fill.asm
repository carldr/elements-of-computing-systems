// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.


(POLLKEYBOARD)
	@0
	D=A
	@color
	M=D
	
	@KBD
	D=M
	@SKIPBLACK
	D;JGT
	
	//  Set @color to black (!0 = 65535)
	@0
	D=A
	@color
	M=!D
		
(SKIPBLACK)
	@FILLSCREEN
	D;JMP
	
(FILLSCREENEND)
	@POLLKEYBOARD
	D;JMP


(FILLSCREEN)
	@SCREEN
	D=A
	@count
	M=D
	
// 32 words x 256 rows = 8192 bytes + Base screen (16384) = 24576
(FILLSCREENLOOP)
	@count
	D=M
	@24576
	D=D-A
	@FILLSCREENEND
	D;JEQ
	
	@color
	D=M
	@count
	A=M
	M=!D
	
	@count
	M=M+1
	
	@FILLSCREENLOOP
	D;JMP