// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.




// to fill the entire screen black
// let address / let i (count till end of screen)
// if i < end of screen assign address -1
// else jump out of loop and probe keyboard


(RESET)
    @SCREEN
    D=A

    @addr
    M=D

    @8191
    D=A
    @i
    M=D

    @color
    M=0

(PROBE)
    // blacken if keyboard not 0
    @KBD
    D=M

    @COLORBLACK
    D;JGT

    @COLORWHITE
    D;JEQ

    @PROBE
    0;JMP


(FILL)
    @color
    D=M

    @addr
    A=M //value in M used to go to right address
    M=D //RAM[addres set before]=1111 1111 1111 1111 

    @i
    M=M-1
    D=M

    @RESET
    D;JEQ

    @addr
    M=M+1

    @FILL
    0;JMP

(COLORBLACK)
    @color
    M=-1

    @FILL
    0;JMP

(COLORWHITE)
    @color
    M=0

    @FILL
    0;JMP