# Machine languages 

> to build a computer system we need to design a **low-level machine language**, or **instruction set** with it the computer can be instructed to do various things. This instruction set can already be designed before we actually build a computer. (we could write a program which that emulates the yet-to-be-built computer and then emulate the execution of programs written in the new machine language.) 

> Taking a similar approach, in this module we assume that the Hack computer and machine language have been built, and write some low-level programs using the Hack machine language. We will then use a supplied CPU Emulator (a computer program) to test and execute our programs. This experience will give you a taste of low-level programming, as well as a solid hands-on overview of the Hack computer platform.

##  1. Overview 

<img src="https://res.cloudinary.com/dri8yyakb/image/upload/v1609219650/memory-Page-9_inqzip.png" />



## 2. Elements of machine language 


machine language specifies the interface between hardware and software 

- which operations does it support ?

- what data is operated on ?

- how is the program controlled ? 

I. **machine operations**  = what is implemented in hardware 

- arithmetic operations
- logical operations
- flow control (think about program control chip)

> operations and data-types can be different depending on the machine language. 

II. **addressing**

because what we will work on can be found in memory, it can often take some time and resources to
access these resources. 

- long addresses
- loading time of memory data into cpu

**memory hierarchy** to mitigate the problem above 

<img src="https://res.cloudinary.com/dri8yyakb/image/upload/v1609223318/memory-Page-10_1_jiqbf8.png" />


Input / output 

* cpu has protocols to interact with them - these are defined in **drivers**
* **memory mapping** = a method of interaction (eg. mem location 12 hold last direction of mouse movement, mem location 21 tells the printer which paper to use)

III. **flow control**

normally instructions are sequential

- but sometimes we unconditionally  need to jump to other locations in a loop for example
- but sometimes we conditionally need to jump to other locations in a if statement for example

## 3. the hack machine language


<img src="https://res.cloudinary.com/dri8yyakb/image/upload/v1609225089/memory-Page-11_q2ywa1.png" alt="image-20200803175006223" style="zoom:80%;" />


> busses allow us to move data from location x to location y

**syntax and semantics**

* **a-instruction** 
  * syntax: `@value` - value is non negative constant or symbol referring to a non negative constant 
  * semantics: 
    * register a becomes value
    * RAM[A] becomes selected RAM register => ​M value 
  * `@21` 
    * a register is now 21 
    * RAM[21] becomes our RAM / data-memory register M 

```
# example set ram[100] to -1 
@100
M=-1
```
* **c-instruction** 

  * syntax: `dest= comp;jump`- both dest and jump are optional

<img src="https://res.cloudinary.com/dri8yyakb/image/upload/v1609225837/memory-Page-12_a0tvvr.png">

  * semantics:

    * first we compute something
    * store the computation result in DEST 
    * if comp jump 0 === true => jump to other instruction stored at ROM[A] 

```
# register d to -1`
D=-1

# ram[300] to d register -1
@300
M=D-1

# `if D-1===0` jump to instruction in ROM[56]
@56
D-1; JEQ

# unconditional jump
0; JMP
```


## 4. the hack language specification 

two syntax variations for the same semantics:

- symbolic
- binary


a-instructions

* symbol syntax `@value`
* binary syntax `0value` - zero is an operation code which specifies that it is an a-instruction 

```
# set a register to 21
@21
0000 0000 0001 0101 
```

c-instructions

* symbol syntax `dest=comp;jump`
* binary syntax `1 1 1 a c1 c2 c3 c4 c5 c6 d1 d2 d3 j1 j2 j3` 
  * opcode 1 shows it is a c-instruction 
  * two one's not used 
  * a - c6 - which computation do i want ?
  * d - destination
  * j - jump condition 

<img src="https://res.cloudinary.com/dri8yyakb/image/upload/v1609226961/memory-Page-12_1_gggahr.png" alt="image-20200810070449968" style="zoom:87%;" />


 ## 5. Input / output devices 

<img src="https://res.cloudinary.com/dri8yyakb/image/upload/v1609230996/memory-Page-12_2_qu9bwo.png" alt="image-20200810070449968" style="zoom:87%;" />


## 6. Hack programming 


aspects of low level programming include :

- working with registers and memory
- branching
- variables 
- iteration
- pointers
- IO


### I. Registers and memory 

<img src="https://res.cloudinary.com/dri8yyakb/image/upload/v1609231619/memory-Page-13_phza2n.png" alt="image-20200810071753412" style="zoom:100%;" />



``` assembly
// --- examples of basic operations ---

// D=10
@10
D=A

// D++
D=D+1

// D=RAM[17]
@17
D=M

// RAM[17]=0
@17
M=0

// RAM[17]=10
@10
D=A
@17
M=D

// RAM[5] = RAM[3]
@3
D=A
@5
M=D

// --- examples of basic program --- the instructions load into the ROM

// Program: Add2.asm
// Computes: RAM[2] = RAM[0] + RAM[1]
// Usage: put values in RAM[0], RAM[1]

@0
D=M // D = RAM[0]
@1
D=D+M // D = D + RAM[0]
@2
M=D // RAM[2] = D

// --- virtual signals as better styling ---

// RAM[5] = 15 -- better way (use @R if you will be using a adress register)
@15
D=A

@R5
M=D

// RAM[5] = 15 -- worse way
@15
D=A

@5
M=D
```

**build in symbols for hack machine language**

- R's - virtual registers
- Screen and Kbd - base addresses of io memory maps
- remainder - used in implementing hack vm see part 2

### II. Branching / variables / iteration 

if then, while, do while ... in ML we only have goto  

**Branching**


```assembly
// Program: Signum.asm
// Computes: if R0>0 then R1=1 else R1=0

@R0
D=M

@8
D;JGT

@R1
M=0
@10
0;JMP

@R1 (8th line)
M=1

@10 (10th line)
0;JMP
```

```assembly
// better is to use @LABEL instead of using @(line number)
// it translates to @n 
// n being instruction number where we find the LABEL DECLARATION
// now we have syntaxtic sugar @R @LABEL instead of always using @NUMBER

@R0
D=M

// label
@POSITIVE 
D;JGT

@R1
M=0
@END
0;JMP

(POSITIVE) // Label declaration
@R1 
M=1

(END)
@END
0;JMP
```

Contract:

- label declarations don't get translated
- each ref to label is replaced with the ref number at which the label declaration is found



**Variables**

= take a register which is available (temp then refers to that particular register)

> ! make sure it has no corresponding label declaration

> variables are allocated to RAM starting from address 16
```assembly
// Program: flip.asm
// Computes: flips the values of RAM[0] and RAM[1]

// psuedo - code
// temp = R1
// R1 = R0
// RO = temp

@R1
D=M
@temp
M=D

@R0
D=M
@R1
M=D

@temp
D=M
@R0
M=D

(END)
@END
0;JMP

// @temp 
// find var memory register aka n
// use it as representation of var temp
// each occurence of @temp will translate into @n
```

**Iteration**

```assembly
// Program: Sum1toN.asm
// Computes: RAM[1] = 1 + 2 + ... + n 
// Usage: put a number (n) in RAM[0]

// pseudo-code
// computes RAM[1] = 1+2+ ...+RAM[0]
	
	n=R0
	i=1
	sum=0
LOOP: 
	if i > n goto stop
	sum = sum + i
	i = i + 1
	goto LOOP
STOP:
	R1 = sum
	
// program

@R0
D=M
@n
M=D
@i
M=1
@sum
M=0

(LOOP)
    @i
    D=M
    @n
    D=D-M
    @STOP
    D;JGT

    @sum
    D=M
    @i
    D=D+M
    @sum
    M=D
    @i
    M=M+1
    @LOOP
    0;JMP

(STOP)
	@sum
	D=M
	@R1
	M=D 

(END)
	@END
	0;JMP
```

### III. Pointers / IO

<img src="https://res.cloudinary.com/dri8yyakb/image/upload/v1609237725/memory-Page-14_ikv4p6.png"/>

```assembly
// for(i=0; i<n; i++){
//  arr[i] = -1
// }
// assume array starts on address 100 and has length of 10 

@16 
D=A
@ARR
M=D

@100
D=100
@n
M=0

@i
M=0

(LOOP)
// if i === 0 goto end
@i
D=M
@n
D=D-M
@END
D:JEQ


// RAM[arr+i] = -1
@ARR
D=M // save start of arr address
@i
A=D+M // take the current indexed address
M=-1

// increment A
@i
M=M+1

@LOOP
0;JMP

(END)
@END
0;JMP
```


**pointers** = variabels that store memory addresses (@ARR, @i above)

> when we access a location using a pointer it is in the form of `A=D+M`
> set adress register to something specific

**IO**

```asm
// Program: Rectangle.asm
// Draw's filled rectangle on top left corner of screen
// it has base width of 16 and height of RAM[0]
// init vars: height = RAM[0], i = 0, addr = SCREEN,  

@R0
D=M
@height
M=D

@SCREEN
D=A
@addr
M=D

@i
M=0

(LOOP)
@i
D=M
@height
D=D-M
@END
D;JGT

@addr
A=M //value in M used to go to right address
M=-1 //RAM[addres set before]=1111 1111 1111 1111 

@i
M=M+1
@32
	D=A
@addr
M=D+M // move to next row
@LOOP
0;JMP

(END)
@END
0;JMP
```


> multiplication means do a for loop in which you add the first number to itself

> probe keyboard if probe is not 0 then blacken screen | work with pointers (A register)