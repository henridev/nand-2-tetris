# Machine languages 

##  1. Overview 

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200802195327822.png" alt="image-20200802195327822" style="zoom:50%;" />

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200802195422469.png" alt="image-20200802195422469" style="zoom:50%;" />

<u>3 element necessary to get hardware to execute a program</u> 

1. **what** does each **instruction** mean? 

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200802195600447.png" alt="image-20200802195600447" style="zoom:33%;" />

2. **when** do perform the **instruction**?

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200802195707042.png" alt="image-20200802195707042" style="zoom:33%;" />

3. **where** do we operate on ? 

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200802195818210.png" alt="image-20200802195818210" style="zoom:33%;" />

in reality people normally write high level code which will be compiled into machine language 

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200802195918598.png" alt="image-20200802195918598" style="zoom:50%;" />

<u>Mnemonics</u>

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200802200211316.png" alt="image-20200802200211316" style="zoom:50%;" />

* instructions in ML are always bit sequences (hard to read)
* mnemonic form of the instruction would be easier in this case just say ADD 
* we can actually write in the mnemonic form if we use an Assembler language which is able to convert it to bit-form 

<u>Symbols</u>

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200802200824254.png" alt="image-20200802200824254" style="zoom:50%;" />

## 2. 	Elements of machine language 

### :one: **what** does each **instruction** mean? -- operations in ML

➡️ corresponding to what is implemented in hardware (arithmetic operations / logical operations / flow control)

differences between ML 

- richness of set of operations 
- data types 

### :two: **where** do we operate on ?  -- addressing 

accessing memory is expensive 

	- long address 
	- compared to operations in cpu getting info from memory takes quite ling 

:heavy_check_mark: solution - **memory hierarchy**   

![image-20200803172246312](C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200803172246312.png)

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
- address storage 

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200803172908267.png" alt="image-20200803172908267" style="zoom:50%; margin: 0 auto" />

### :four: Input / output 

* cpu has protocols to interact with them - these are defined in **drivers**
* **memory mapping** = a method of interaction (eg. mem location 12 hold last direction of mouse movement, mem location 21 tells the printer which paper to use)

### :five: Input / output

normally instructions happen in sequence 

- but sometimes we unconditionally  need to jump to other locations in a loop for example
-  but sometimes we conditionally need to jump to other locations in a if statement for example

## 3. the hack machine language

 <div style="margin:0 auto; text-align:center">
     <img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200803175006223.png" alt="image-20200803175006223" style="zoom:80%;" />
     <div>
         overview of our computer
     </div>
 </div>

:one: hardware:

* our atomic form of information will be 16bit 
* our data-memory / ram consists of 16bit registers 
* our instruction-memory / rom consist of 16bit registers 
* CPU - actually performs the 16bit instructions (mostly via an ALU)
* busses allow us to move data from location x to location y µ

:two: software: to actually control this hardware machine we use software aka our machine / assembly code :arrow_right: **hack program** sequence of instructions written in hack ML 

2 categories of instructions 

- 16bit A-instructions
- 16bit C-instructions 

 :three: control: 

* write set of 16bit number (hack program)
* load the program into the rom a register 

:four: registers: 

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200803175334941.png" alt="image-20200803175334941" style="zoom:37%;" />

**syntax :writing_hand: and semantics :book:**

* **a-instruction** 
  * syntax: `@value` - value is non negative constant or symbol referring to a non negative constant 
  * semantics: 
    * register a becomes value
    * RAM[A] becomes selected RAM register :arrow_right: ​M value 
  * `@21` - a register is now 21 and RAM[21] becomes our RAM register M 
  * set ram[100] to -1 
    * `@100`
    * `M=-1`

* **c-instruction** 

  * syntax: `dest= comp;jump`- both dest and jump are optional

    * possible computations <img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200803180453654.png" alt="image-20200803180453654" style="zoom:30%;" />

    * possible destinations <img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200803180606011.png" alt="image-20200803180606011" style="zoom:33%;" />

    * jump <img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200803180639666.png" alt="image-20200803180639666" style="zoom:33%;" />

      

  * semantics:

    * first we compute something
    * store the computation :vs: jump to other instruction in the program 

  * `@21` - a register is now 21 and RAM[21] becomes our RAM register M 

  * set  `register d to -1`  

    * `D=-1`

  * set `ram[300] to d register -1`

    * `@300` when i want to use the memory i must use an a instruction to select the register of interest selects as M ram[300]
    * `M=D-1`

  * if `if D-1===0` jump to instruction in ROM[56]

    * `@56` a is set to 56 this means M wil be at RAM[56]
    * `D-1; JEQ `

## 4. the hack language specification 

two syntax variations for the same semantics:  <img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200803182344457.png" alt="image-20200803182344457" style="zoom:67%;" />



<u>a-instructions</u>

* symbol syntax `@value`
* binary syntax `0value` - zero specifies that it is an a-instruction 

<u>c-instructions</u>

* symbol syntax `dest=comp;jump`
* binary syntax `1 1 1 a c1 c2 c3 c4 c5 c6 d1 d2 d3 j1 j2 j3` - zero specifies that it is an a-instruction 
  * opcode 1 shows it is a c-instruction 
  * two one's not used 
  * a - c6 - which computation do i want ?
  * d - destination
  * j - jump condition 

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200803183306960.png" alt="image-20200803183306960" style="zoom:70%;" />



 ## 5. Input / output devices 

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200803183910969.png" alt="image-20200803183910969" style="zoom:50%;" />

we either get data from or display data to the user 

<u>How to control a display via bits</u>

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200803184132476.png" alt="image-20200803184132476" style="zoom:70%;" />

* the **screen memory map** is the reference for our display every x ms the screen will refresh based upon values found in the screen memory map 

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200803185146553.png" alt="image-20200803185146553" style="zoom:67%;" />

* we have a total of 131072 pixels 
* and 8192 registers of 16bits also gives us 131072 values to work with 



* we can only access memory in busses of 16 bits not just one bit - read write will always be 16 bit operations
* busses 0 to 31 represent the top line of our display 

![image-20200803185247242](C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200803185247242.png)

![image-20200803185508640](C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200803185508640.png)

* 8k chip will represent our screen memory map and this is part of the larger data memory map 



