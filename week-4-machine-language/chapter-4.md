

# Machine languages 

##  1. Overview 

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200810063109653.png" alt="image-20200810063109653" style="zoom:70%;" />

<u>3 element necessary to get hardware to execute a program</u> 

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200810063155673.png" alt="image-20200810063155673" style="zoom:80%;" />

1. **what** does each **instruction** mean? (eg. 100100 means add)

2. **when** do perform the **instruction**? (eg. we are at instruction 99 next instruction is 100)

3. **where** do we operate on ? (eg. operate on memory location 200)

in reality people normally write high level code which will be compiled into machine language 

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200810063406464.png" alt="image-20200810063406464" style="zoom:67%;" />



<u>Mnemonics</u>

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200810063525064.png" alt="image-20200810063525064" style="zoom:80%;" />

* instructions in ML are always bit sequences (hard to read)
* mnemonic form of the instruction would be easier in this case just say ADD 
* we can actually write in the mnemonic form if we use an Assembler language which is able to convert it to bit-form 

<u>Symbols</u>

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200810063556821.png" alt="image-20200810063556821" style="zoom:80%;" />

## 2. 	Elements of machine language 

### :one: **what** does each **instruction** mean? -- operations in ML

➡️ corresponding to what is implemented in hardware (arithmetic operations / logical operations / flow control)

differences between ML 

- richness of set of operations 
- data types 

### :two: **where** do we operate on ?  -- addressing 

accessing memory is expensive 

	- long address 
	- compared to operations in cpu getting info from memory takes quite long 

:heavy_check_mark: solution - **memory hierarchy**   

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200810064007598.png" alt="image-20200810064007598" style="zoom:80%;" />

* smaller memory easier to access
  * smaller addresses
  * fewer of them = faster access 
* larger memory
  * memory gets bigger
  * accessing takes longer 

### :three: Registers

cpu's often have a few easily accessible registers, their number and functions being essential in machine language 

types of usages of registers in main memory

- data storage
- address storage  (which part of the bigger memory to access)

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200810064321913.png" alt="image-20200810064321913" style="zoom:75%;" />



### :four: Input / output 

* cpu has protocols to interact with them - these are defined in **drivers**
* **memory mapping** = a method of interaction (eg. mem location 12 hold last direction of mouse movement, mem location 21 tells the printer which paper to use)

### :five: flow control

normally instructions happen in sequence 

- but sometimes we unconditionally  need to jump to other locations in a loop for example
-  but sometimes we conditionally need to jump to other locations in a if statement for example

## 3. the hack machine language

 <div style="margin:0 auto; text-align:center">
     <img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200810064806858.png" alt="image-20200803175006223" style="zoom:80%;" />
     <div>
         overview of our computer
     </div>
 </div>


:one: hardware:

* our atomic form of information will be 16bit 
* our data-memory / ram consists of 16bit registers 
* our instruction-memory / rom consist of 16bit registers 
* CPU - actually performs the 16bit instructions (mostly via an ALU)
* busses allow us to move data from location x to location y

:two: software: to actually control this hardware machine we use software aka our machine / assembly code :arrow_right: **hack program** sequence of instructions written in hack ML 

2 categories of instructions 

- 16bit A-instructions
- 16bit C-instructions 

 :three: control: 

* write set of 16bit number (hack program)
* load the program into the rom a register 

:four: registers: 

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200810064947452.png" alt="image-20200810064947452" style="zoom:80%;" />

**syntax :writing_hand: and semantics :book:**

* **a-instruction** 
  * syntax: `@value` - value is non negative constant or symbol referring to a non negative constant 
  * semantics: 
    * register a becomes value
    * RAM[A] becomes selected RAM register :arrow_right: ​M value 
  * `@21` 
    * a register is now 21 
    * RAM[21] becomes our RAM / data-memory register M 
  * set ram[100] to -1 
  * `@100`
    * `M=-1`
  
* **c-instruction** 

  * syntax: `dest= comp;jump`- both dest and jump are optional

    * possible computations <img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200810065317585.png" alt="image-20200810065317585" style="zoom:80%;" />

    * possible destinations ![image-20200810065344582](C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200810065344582.png)

    * jump ![image-20200810065413462](C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200810065413462.png)

      

  * semantics:

    * first we compute something
    * store the computation :vs: jump to other instruction in the program 

  * `@21` - a register is now 21 and RAM[21] becomes our RAM register M 

  * set  `register d to -1`  

    * `D=-1`

  * set `ram[300] to d register -1`

    * `@300` when i want to use the memory i must use an a instruction to select the register of interest selects as M ram[300]
    * `M=D-1`

  *  `if D-1===0` jump to instruction in ROM[56]

    * `@56` a is set to 56 this means M wil be at RAM[56]
    * `D-1; JEQ `

## 4. the hack language specification 

two syntax variations for the same semantics:  ![image-20200810065920023](C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200810065920023.png)



<u>a-instructions</u>

* symbol syntax `@value`
* binary syntax `0value` - zero is an operation code which specifies that it is an a-instruction 

<u>c-instructions</u>

* symbol syntax `dest=comp;jump`
* binary syntax `1 1 1 a c1 c2 c3 c4 c5 c6 d1 d2 d3 j1 j2 j3` - zero specifies that it is an a-instruction 
  * opcode 1 shows it is a c-instruction 
  * two one's not used 
  * a - c6 - which computation do i want ?
  * d - destination
  * j - jump condition 

![image-20200810070406912](C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200810070406912.png)





 ## 5. Input / output devices 

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200810070449968.png" alt="image-20200810070449968" style="zoom:87%;" />

we either get data from or display data to the user 

<u>How to control a display via bits</u>

![image-20200810070526788](C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200810070526788.png)

* the **screen memory map** is the reference for our display every x ms the screen will refresh based upon values found in the screen memory map 

* we have a total of 131072 pixels 
* and 8192 registers of 16bits also gives us 131072 values to work with 

* we can only access memory in busses of 16 bits not just one bit - read write will always be 16 bit operations
* busses 0 to 31 represent the top line of our display 
* 8k chip will represent our screen memory map and this is part of the larger data memory map 

![image-20200810070621100](C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200810070621100.png)

## 6. Hack programming 

 <div style="margin:0 auto; text-align:center">
     <img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200810070905848.png" alt="image-20200803175006223" style="zoom:80%;" />
     <div>
         hack programming language
     </div>
 </div>
<ol>
    <li>registers and memory</li>
    <li>branching</li>
    <li>variabels</li>
    <li>iteration</li>
    <li>pointers</li>
    <li>input / output</li>
</ol>

### I. Registers and memory 

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200810071753412.png" alt="image-20200810071753412" style="zoom:100%;" />

DAM :arrow_right: data register / address - data register / selected memory register ​(A has side effect that it sets selected M)

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

![image-20200811075130130](C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200811075130130.png)

- R's - virtual registers
- Screen and Kbd - base addresses of io memory maps
- remainder - used in implementing hack vm see part 2

### II. Branching / variables / iteration 

:computer: ​ ​if then, while, do while ... in ML we only have goto  

<u>**Branching**</u>

![image-20200811080226318](C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200811080226318.png)

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

@R1 // 8th line
M=1

@10 // 10th line
0;JMP
```

```assembly
// better is to use @LABEL 
// it translates to @n 
// n being instruction number where we find the LABEL DECLARATION

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

**Contract:**

- label declarations don't get translated
- each ref to label is replaced with the ref number at which the label declaration is found



<u>**Variables**</u>

![image-20200811081113698](C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200811081113698.png)

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

**Contract:**

- a ref to a symbol without corresponding label declaration means it is a **reference variable**
- variables are allocated to RAM starting from address 16

**<u>Iteration</u>**

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







