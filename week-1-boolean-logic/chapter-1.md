# Boolean logic

digital device => set of chips designed to store and process information.

chip  => build from **Elementary logic gates**. 

we start with the **Nand primitive logic gate** and build all the other logic gates from it.  a rather standard set of gates, which will be later used to construct our computer’s processing and storage chips. The final goal is  to construct or integrate a certain family of chips.

Structure:

* focus a well-defined task to get a certain chip 
* the prerequisite knowledge needed to approach this in a brief Background section. 
* a complete Specification of the chips’ abstractions, namely, the various services that they should deliver, one way or another.
* Having presented the what, a subsequent Implementation section proposes guidelines and hints about how the chips can be actually
  implemented. 
* A Perspective section rounds up the chapter with concluding comments about important topics that were left out from the discussion. 
* Each chapter ends with a technical Project section. This section gives step-by-step instructions for actually building the chips on a personal computer, using the hardware simulator supplied with the book.

This chapter focuses on the construction of a family of simple chips called **Boolean gates**. Since Boolean gates are physical implementations of Boolean functions, we start with a brief treatment of **Boolean algebra**. We then show how Boolean gates implementing simple Boolean functions can be interconnected to deliver the functionality of more complex chips. We conclude the background section with a description of how hardware design is actually done in practice, using software simulation tools.  

# I. Background

## Boolean algebra

boolean algebra => focus on boolean values (labeled true/false, 1/0, yes/no, on/off)

**Boolean function** => function that operates on binary inputs and returns binary outputs.

> computer hardware is based on the representation and manipulation of binary values 
>
> Boolean functions play a central role in the specification, construction, and optimization of hardware architectures. 
>
> Hence, the ability to formulate and analyze Boolean functions is the first step toward constructing computer architectures.

**Truth Table** enumerates all the possible values of the function’s input variables, along with the function’s output for each set of inputs. 

**Boolean Expressions** In addition to the truth table specification, a Boolean function can also be specified using **Boolean operations** over its input variables. The basic Boolean operators that are typically used are ‘‘And’’ (x And y is 1 exactly when both x and y are 1) ‘‘Or’’ (x Or y is 1 exactly when either x or y or both are 1), and ‘‘Not’’ (Not x is 1 exactly when x is 0). 

- x  ° y  (other option xy) => x And y, 
- x + y => x Or y
- x̄ => Not x.

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200707061018263.png" alt="image-20200707061018263" style="zoom:50%; margin:0 auto;" />
$$
\text{example going from operation to expression } \\ 
f(x,y,z) = (x+y)*\tilde{z}
$$


> boolean identities
>
> - commutative
>   - (x and y) = (y and x)
>   - (x or y) = (y or x)
> - associative
>   - x and (y and z) = (x and y) and x
>   - x or(y or z) = (x or y) or x
> - distributive
>   - x and (y or z) = (x and y) or (x and z)
>   - x or(y and z) = (x or y) or (x or z)
> - Morgan laws
>   - Not (x and y) = Not(x) or Not(y) 
>   - Not (x or y) = Not(x) and Not(y)
>   - taking the not of an and is equivalent to taking an or of 2 nots
>   - taking the not of an or is equivalent to taking an and of 2 nots 
> - (not x) and (not x) = (not x)
> - double negation 
>   - (not(not(x))) = x

**Canonical Representation** 

 Every Boolean function can be expressed using at least one Boolean expression called the canonical representation. Starting with the function’s truth table, we focus on all the rows in which the function has value 1. For each such row, we construct a term created by And-ing together literals (variables or their negations) that fix the values of all the row’s inputs. 

example
$$
\text{row 3 where output 1 } \\
x=0 \\
y=1 \\
z=0 \\
\tilde{x}y\tilde{z}
\\
\text{repeat for every row where result 1 then or together all} \\
f(x,y,z) = \tilde{x}y\tilde{z} + x\tilde{y}\tilde{z} + xy\tilde{z}
$$
we get a Boolean expression that is equivalent to the given truth table. 

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200709190954728.png" alt="image-20200709190954728" style="zoom:50%; margin: 0 auto" />

> important conclusion: Every Boolean function, no matter how complex, can be expressed using three Boolean operators only: And, Or, and Not.  
>
> even more concise
>
> `any bool F can be reprsented using expressions with AND and NOT` 
>
> <u>proof</u>:  this is logical we now more his formula **(not (x or y)) = (not x) and (not y)**  so we can also say **(x or y) = (not (not x) and (not y))**
>
> even more concise
>
> `any bool F can be expressed using a nand`
>
> <table>
>     <th>x</th>
>     <th>y</th>
>     <th>NAND</th>
>     <tr>
>         <td>0</td>
>         <td>0</td>
>         <td>1</td>
>     </tr>
>      <tr>
>         <td>0</td>
>         <td>1</td>
>         <td>1</td>
>     </tr>
>      <tr>
>         <td>1</td>
>         <td>0</td>
>         <td>1</td>
>     </tr>
>      <tr>
>         <td>1</td>
>         <td>1</td>
>         <td>0</td>
>     </tr>
> </table>
>
> <u>proof</u>:  we can represent not / and / or all with a nand
>
> * (not x) = (x nand  x)
> * (x and y) = not(x nand y) = ((x nand  y) nand  (x nand y))
> * (x or y) =  (not (not x) and (not y)) 

**Two-Input Boolean Functions** An inspection of figure 1.1 reveals that <u>the number of Boolean functions that can be defined over n binary variables is 2^(2^n).</u> For example, the sixteen Boolean functions spanned by two variables. These functions were constructed systematically, by enumerating all the possible 4-wise combinations of binary values in the four right columns. Each function has a conventional  name that seeks to describe its underlying operation.  

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200708054818190.png" alt="image-20200708054818190" style="zoom:50%; margin:0 auto" />

Here are some examples: 

- Nor function is shorthand for Not-Or: Take the Or of x and y, then
  negate the result. 
- The Xor function—shorthand for ‘‘exclusive or’’—returns 1 when
  its two variables have opposing truth-values and 0 otherwise.
- Conversely, the Equivalence function returns 1 when the two variables have identical truth-values.
- The If-x-then-y function (also known as x ! y, or ‘‘x Implies y’’) returns 1 when x is 0 or when both x and y are 1. The other functions are self-explanatory.
  The
- Nand function (as well as the Nor function) has an interesting <u>theoretical property: Each one of the operations And, Or, and Not can be constructed from it, and it alone</u> (e.g., x Or y = (x Nand x) Nand (y Nand y). 

> And since every Boolean function can be constructed from And, Or, and Not operations using the canonical representation method,
>
> it follows that every Boolean function can be constructed from Nand operations alone.

This result has far-reaching practical implications: Once we have in our disposal a physical device that implements Nand, we can use many copies of this device (wired in a certain way) to implement in hardware any Boolean function.  

## Gate Logic 

= a technique to implement boolean function via logic gates

**gate** = physical device that implements a Boolean function. 

If a <u>Boolean function f</u> operates on <u>n variables</u> and returns <u>m binary results</u> (in all our examples so far, m was 1), the gate that implements f will have <u>n input pins</u> and <u>m output pins</u>. 

When we put some values v1 . . . vn in the gate’s input pins, the gate’s ‘‘logic’’—its internal structure—should compute and output f (v1 . . . vn). 

➡️ complex Boolean functions can be expressed in terms of simpler functions
➡️ complex gates are composed from more elementary gates. 

The simplest gates of all are made from tiny switching devices, called **transistors**, wired in a certain topology designed to effect the overall gate functionality. Although most digital computers today use electricity to represent and transmit binary data from one gate to another, any alternative technology permitting switching and conducting capabilities can be employed. Indeed, during the last fifty years, researchers have built many hardware implementations of Boolean functions, including magnetic, optical, biological, hydraulic, and pneumatic mechanisms. Today, most gates are implemented as transistors etched in silicon, packaged as chips. In this book we use the words chip and gate interchangeably, tending to use the term gates for simple chips. The availability of alternative switching technology options, on the one hand, and the observation that Boolean algebra can be used to abstract the behavior of any such technology, on the other, is extremely important. Basically, it implies that computer scientists don’t have to worry about physical things like electricity, circuits, switches, relays, and power supply. Instead, computer scientists can be content with the abstract notions of **Boolean algebra and gate logic,** trusting that someone else (the physicists and electrical engineers—bless their souls) will figure out how to actually realize them in hardware. Hence, a primitive gate (see figure 1.3) can be viewed as a black box device that implements an elementary logical operation in one way or another—we don’t care how. A hardware designer starts from such primitive gates and designs more complicated functionality by interconnecting them, leading to the construction of composite gates  

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200708061426483.png" alt="image-20200708061426483" style="zoom:50%; margin: 0 auto" />![image-20200708061625039](C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200708061625039.png)

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200708061635706.png" alt="image-20200708061635706" style="zoom:50%; margin: 0 auto" />

**Primitive and Composite Gates**: Since all logic gates have the same input and output semantics (0’s and 1’s), they can be chained together, creating **composite gates** of arbitrary complexity. 

For example, suppose we are asked to implement the 3-way Boolean function And(a, b, c). Using Boolean algebra, we can begin by observing
that a°b°c = (a °b)°c or using prefix notation And(a, b, c) = And(And a, b) c) (eg. fig 1.4) 

The construction described in figure 1.4 is a simple example of gate logic, also called logic design. Simply put, **logic design** is the art of interconnecting gates in
order to implement more complex functionality, leading to the notion of composite gates. Since composite gates are themselves realizations of (possibly complex) Boolean functions, their ‘‘outside appearance’’ (e.g., left side of figure 1.4) looks just like that of primitive gates. At the same time, their internal structure can be rather complex.

any given logic gate can be viewed from two different perspectives:

- internal The right-hand side of figure 1.4 gives the gate’s internal
  architecture, or implementation ➡️relevant only to the gate designer
- external The left side shows only the gate interface, namely, the input and output pins that it exposes to the outside world. ➡️ right level of detail for other designers who wish to use the gate as an abstract off-the-shelf component



**Xor gate** 

As discussed before **Xor(a, b)** is 1 exactly when either a is 1 and b is 0, or when a is 0 and b is 1 otherwise  **Xor(a, b) =  Or(And(a, Not(b)), And(Not(a), b))**

The logical design for this is illustrated in figure 1.5. 

! gate interface is unique ==> There is only one way to describe it, and this is normally done using a truth table / Boolean expression or a verbal specification.  

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200708063233553.png" alt="image-20200708063233553" style="zoom:50%; margin 0 auto" />

An **interface** however can be realized via different implementations.
some will have better cost, speed, and simplicity. 

eg. the Xor function can be implemented using four, rather than five, And, Or, and Not gates. 

- functional standpoint: the fundamental requirement of logic design is that the gate implementation will realize its stated interface, in one way or another. 
- efficiency standpoint: the general rule is to try to do more with less, that is, use as few gates as possible. 

To sum up, the art of logic design can be described as follows: Given a gate specification (interface), find an efficient way to implement it using other gates that were already implemented. This, in a nutshell, is what we will do in the rest of this chapter.  

```verilog
/** Xor gate: out = (a And Not(b) Or (Not(a) and b)) **/

    CHIP Xor {
        IN a, b;
        OUT out;
        
        PARTS:
        Not (in=a, out=nota);
        Not (in=b, out=notb);
        And (a=a b=notb out=aAndNotb);
        And (a=nota b=b out=notaAndb);
        Or  (a=aAndNotb b=notaAndb out=out)
    }
```

eg. OR via AND & NOT ➡️  (NOT ((NOT x) AND (NOT y)))

## Actual Hardware Construction

Having described the logic of composing complex gates from simpler ones let's now see example of how to build them

Our first contract is to build a hundred Xor gates. 

➡️  we purchase a soldering gun, a roll of copper wire, and three bins labeled ‘‘And gates,’’ ‘‘Or gates,’’ and ‘‘Not gates,’’ each containing many identical copies of these elementary logic gates. Each of these gates is sealed in a plastic casing that exposes some input and output pins, as well as a power supply plug. To get started, we pin figure 1.5 to our garage wall and proceed to realize it using our hardware. First, we take two And gates, two Not gates, and one Or gate, and mount them on a board according to the figure’s layout. 

Next, we connect the chips to one another by running copper wires among them and by soldering the wire ends to the respective input/output pins. Now, if we follow the gate diagram carefully, we will end up having three exposed wire ends. We then solder a pin to each one of these wire ends, seal the entire device
(except for the three pins) in a plastic casing, and label it ‘‘Xor.’’ We can repeat this assembly process many times over. At the end of the day, we can store all the
chips that we’ve built in a new bin and label it ‘‘Xor gates.’’ If we (or other people)
are asked to construct some other chips in the future, we’ll be able to use these Xor gates as elementary building blocks, just as we used the And, Or, and Not gates before. 

downsides to this approach: 

there is no guarantee that the given chip diagram is correct. Although we can prove correctness in simple cases like Xor, we cannot do so
in many realistically complex chips. Thus, we must settle for empirical testing: Build the chip, connect it to a power supply, activate and deactivate the input pins in various configurations, and hope that the chip outputs will agree with its specifications. 

If the chip fails to deliver the desired outputs, we will have to tinker with its physical structure—a rather messy affair. Further, even if we will come up with the right design

replicating the chip assembly process many times over will be a time-consuming
and error-prone affair. There must be a better way!

## Hardware Description Language (HDL)
Today we plan and optimize the chip architecture on a desktop, via structured modeling formalisms like HDL (also known as VHDL, where V stands for Virtual). 

1. specify structure via HDL program code
2. subjected to a rigorous battery of tests.  using a special software tool, called a **hardware simulator**, takes the HDL program as input and builds an image of the modeled chip in memory.
3.  the designer can instruct the simulator to test the virtual chip on various sets of inputs, generating simulated chip outputs. The outputs can then be compared to the desired results, as mandated by the client who ordered the chip built. 
4. On top of chip correctness, the hardware designer will typically be interested in a variety of parameters computation (speed, energy , and  cost implied by the chip design) All these parameters can be simulated and quantified by the hardware simulator, aiding the design until the simulated chip delivers desired cost/performance levels.

Thus, using HDL, one can completely plan, debug, and optimize the entire chip
before a single penny is spent on actual production. When the HDL program is
deemed complete, that is, when the performance of the simulated chip satisfies the client who ordered it, the HDL program can become the blueprint from which many copies of the physical chip can be stamped in silicon. This final step in the chip life cycle—from an optimized HDL program to mass production—is typically outsourced to companies that specialize in chip fabrication, using one switching technology or another.

Example: Building a Xor Gate (figures 1.2 and 1.5)

➡️one way to define exclusive or is **Xor(a, b) = Or(And(a, Not(b)), And(Not(a),b))**  

> This logic can be expressed either graphically, as a gate diagram, or textually, as an HDL program.

The latter program is written in the HDL variant used throughout this book, defined in appendix A. (See figure 1.6 for the details) 

<u>Explanation:</u>

An HDL definition of a chip consists of 2 sections

- header section = specifies the chip interface, namely the chip name and the names of its input and output pins
- parts section = describes the names and topology of all the lower-level parts (other chips) from which this chip is constructed. a part is represented by a statement that specifies the part name and the way it is connected to other parts in the design. Note that in order to write such statements legibly, the HDL programmer must have a complete documentation of the underlying parts’ interfaces. 

For example, figure 1.6 assumes that the input and output pins of the Not gate are labeled in and out, and those of And and Or are labeled a, b and out. This API-type information is not obvious, and one must have access to it before one can plug the chip parts into the present code. Inter-part connections are described by creating and connecting internal pins, as needed. 

> eg: consider the bottom of the gate diagram, where the output of a Not gate is piped into the input of a subsequent And gate. The HDL code
> describes this connection by the pair of statements Not(...,out=nota) and And(a=nota,...). The first statement creates an internal pin (outbound wire) named nota, feeding out into it. The second statement feeds the value of nota
> into the a input of an And gate. 
>
> Note that pins may have an unlimited fan out. For example, in figure 1.6, each input is simultaneously fed into two gates.  In gate diagrams, multiple connections are described using forks. In HDL, the existence of
> forks is implied by the code.  

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200708184401209.png" alt="image-20200708184401209" style="zoom:50%; margin: 0 auto" />

<u>Testing:</u>

Rigorous quality assurance mandates that chips be tested in a specific, replicable, and well-documented fashion. With that in mind, hardware simulators are
usually designed to run test scripts, written in some scripting language. For example, the test script in figure 1.6 is written in the scripting language understood by the hardware simulator supplied with the book. This scripting language is described fully in appendix B. Let us give a brief description of the test script from figure 1.6. 

The first two lines of the test script instruct the simulator to load the Xor.hdl program and get ready to print the values of selected variables. Next, the script lists a series of testing scenarios, designed to simulate the various contingencies under which the Xor chip will have to operate in ‘‘real-life’’ situations. In each scenario, the script instructs the simulator to bind the chip inputs to certain data values, compute the resulting output, and record the test results in a designated output file. In the case of simple gates like Xor, one can write an exhaustive test script that enumerates all the possible input values of the gate. The resulting output file (right side of figure 1.6) can then be viewed as a complete empirical proof that the chip is well designed. The luxury of such certitude is
not feasible in more complex chips, as we will see later.  

## Hardware Simulation
Since HDL is a hardware construction language, the process of writing and debugging HDL programs is quite similar to software development. The main difference is that instead of writing code in a language like Java, we write it in HDL, and instead of using a compiler to translate and test the code, we use a hardware simulator. The hardware simulator is a computer program that knows how to parse and interpret HDL code, turn it into an executable representation, and test it according to the specifications of a given test script. There exist many commercial hardware simulators on the market, and these vary greatly in terms of cost, complexity, and ease of use. Together with this book we provide a simple (and free!) hardware simulator that is sufficiently powerful to support sophisticated hardware design projects. In particular, the simulator provides all the necessary tools for building, testing, and integrating all the chips presented in the book, leading to the construction of a general-purpose computer. 



<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200709053153116.png" alt="image-20200709053153116" style="zoom:50%;margin:0 auto" />

# II. Specification

This section specifies a typical set of gates, each designed to carry out a common
Boolean operation. These gates will be used in the chapters that follow to construct the full architecture of a typical modern computer. Our starting point is a single primitive **Nand gate**, <u>from which all other gates will be derived recursively.</u> Note that we provide only the gates’ specifications, or interfaces, delaying implementation details until a subsequent section. Readers who wish to construct the specified gates in HDL are encouraged to do so, referring to appendix A as needed. All the gates can be built and simulated on a personal computer, using the hardware simulator supplied with the book.  

## Nand gate 

$$
\text{negated and = }\overline{(x+y)}
$$

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200709053931710.png" alt="image-20200709053931710" style="zoom:50%;margin: 0 auto" />

> **chip name**: Nand
> **Inputs**: a, b
> **Outputs**: out
> **Function**: if a=b=c then out=0 else out=1
> **Comment**: Gate is considered a **primitive** and thus no need to implement it

## Basic logic gates 

Some of the logic gates presented here are typically referred to as ‘‘elementary’’ or ‘‘basic.’’ At the same time, every one of them can be composed from Nand gates alone. Therefore, <u>they need not be viewed as primitive.</u> 

**Not** The single-input Not gate, also known as **‘‘converter’’**, converts its input from 0 to 1 and vice versa. 

> **chip name**: Not
> **Inputs**: in
> **Outputs**: out
> **Function**: if in=0 then out=1 else out=0

**And** function returns 1 when both its inputs are 1, and 0 otherwise.

> **Chip name**: And
> **Inputs:** a, b
> **Outputs**: out
> **Function**: If a=b=1 then out=1 else out=0.

**Or** The Or function returns 1 when at least one of its inputs is 1, and 0 otherwise.

>  **Chip name**: Or
> **Inputs**: a, b
> **Outputs**: out
> **Function**: If a=b=0 then out=0 else out=1.

**Xor** The Xor function, also known as ‘‘exclusive or,’’ returns 1 when its two inputs
have opposing values, and 0 otherwise.

> **Chip name**: Xor
> **Inputs**: a, b
> **Outputs**: out
> **Function**: If a=/b then out=1 else out=0.  

**Multiplexor** A multiplexor (figure 1.8) is a three-input gate that uses one of the
inputs, called **‘‘selection bit’’**, to select and output one of the other two inputs, called ‘‘data bits.’’ Thus, a better name for this device might have been selector. The name multiplexor was adopted from communications systems, where similar
devices are used to serialize (multiplex) several input signals over a single output
wire.  

> **Chip name**: Mux
> **Inputs**: a, b, sel
> **Outputs**: out
> **Function**: If sel=0 then out=a else out=b.  

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200709055022233.png" alt="image-20200709055022233" style="zoom:50%;margin: 0 auto" />

**Demultiplexor** A demultiplexor (figure 1.9) performs the opposite function of a
multiplexor: It takes a single input and channels it to one of two possible outputs
according to a selector bit that specifies which output to chose.  



<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200709055134172.png" alt="image-20200709055134172" style="zoom:50%; margin: 0 auto" />

> **Chip name**: DMux
> **Inputs**: in, sel
> **Outputs**: a, b 
> **Function**: If sel=0 then {a=in, b=0} else {a=0, b=in}  

## Multi-bit versions of basic gates

 ‘‘**buses**.’’ = <u>multi-bit arrays</u> (computers hardware is usually designed to operate on them)

eg. a basic requirement of a 32-bit computer is to be able to compute (bit-wise) an And function on two given 32-bit buses. 

To implement this operation, we can build an array of 32 binary And gates, each operating separately on a pair of bits. In order to enclose all this logic in one package, we can encapsulate the gates array in a single chip interface consisting of two 32-bit input buses and one 32-bit output bus.

This section describes a typical set of such multi-bit logic gates, as needed for the
construction of a typical 16-bit computer. We note in passing that the architecture of n-bit logic gates is basically the same irrespective of n’s value.
When referring to individual bits in a bus, it is common to use an array syntax.
For example, to refer to individual bits in a 16-bit bus named data, we use the notation data[0], data[1],. . ., data[15].

**Multi-Bit Not** An n-bit Not gate applies the Boolean operation Not to every one of the bits in its n-bit input bus:

> **Chip name**: Not16
> **Inputs**: in[16]
> **Outputs**: out[16] 
> **Function**: For i=0..15 out[i] =Not(in[i])

**Multi-Bit And** An n-bit And gate applies the Boolean operation And to every one
of the n bit-pairs arrayed in its two n-bit input buses:

> **Chip name**: And16
> **Inputs**: a[16], b[16]
> **Outputs**: out[16]
> **Function**: For i=0..15 out[i]=And(a[i],b[i]).

**Multi-Bit Or** An n-bit Or gate applies the Boolean operation Or to every one of the n bit-pairs arrayed in its two n-bit input buses:

> **Chip name**: Or16
> **Inputs**: a[16], b[16]
> **Outputs**: out[16]
> **Function**: For i=0..15 out[i]=Or(a[i],b[i]).

**Multi-Bit Multiplexor** An n-bit multiplexor is exactly the same as the binary multiplexor described in figure 1.8, except that the two inputs are each n-bit wide; the selector is a single bit.

> **Chip name**: Mux16
> **Inputs**: a[16], b[16], sel
> **Outputs**: out[16]
> **Function**: If sel=0 then for i=0..15 out[i]=a[i] else for i=0..15 out[i]=b[i].

## Multi-way version of basic gates

Many 2-way logic gates that accept two inputs have natural generalization to multiway variants that accept an arbitrary number of inputs. This section describes a set of multi-way gates that will be used subsequently in various chips in our computer architecture. Similar generalizations can be developed for other architectures, as needed.  

**Multi-Way Or** An n-way Or gate outputs 1 when at least one of its n bit inputs is 1, and 0 otherwise. Here is the 8-way variant of this gate:  

> **Chip name**: Or8way
> **Inputs**: in[8]
> **Outputs**: out
> **Function**: out=Or(in[0], in[1], ...., in[7])

**Multi-Way/Multi-Bit Multiplexor** 
$$
\text{m-way = m buses } \\
\text{n-bit = bits in bus} \\
\text{selects one of m nbit input buses and outputs it to a single n-bit output bus } \\
\text{selection is specified by a set of k control bits => } 
k = log_2 m
$$
Where below depicts a typical example. The computer platform that we develop in this book requires two variations of this

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200709062057179.png" alt="image-20200709062057179" style="zoom:50%;" />

> **Chip name**: Mux4Way16
> **Inputs**: a[16], b[16], c[16], d[16], sel[2]
> **Outputs**: out[16]
> **Function**: If sel=00 then out=a else if sel=01 then out=b else if sel=10 then out=c else if sel=11 then out=d 
> **Comment**: If sel=00 then out=a else if sel=01 then out=b else if sel=10 then out=c else if sel=11 then out=d 
>
> **Chip name**: Mux8Way16
> **Inputs**: a[16],b[16],c[16],d[16],e[16],f[16],g[16],h[16], sel[3]
> **Outputs**: out[16]
> **Function**: If sel=000 then out=a else if sel=001 then out=b else if sel=010 out=c ... else if sel=111 then out=h
> **Comment**: The assignment operations mentioned above are all 16-bit. For example, "out=a" means "for i=0..15 out[i]=a[i]". 

**Multi-Way/Multi-Bit Demultiplexor** 
$$
\text{m-way = m buses outup} \\
\text{n-bit = bits in bus} \\
\text{selections specified by  } k = log_2 m \text{ control bits} \\
$$
 The specific computer platform that we will build requires two variations of this chip: A 4-way 1-bit demultiplexor and an 8-way 1-bit multiplexor, as follows.  

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200709141523879.png" alt="image-20200709141523879" style="zoom:50%;" />

> **Chip name**: DMux4Way1
> **Inputs**: in, sel[2]
> **Outputs**: a,b,c,d
> **Function**: If sel=00 then   {a=in, b=c=d=0} 
> else if sel=01 then {b=in, a=c=d=0}
> else if sel=10 then {c=in, a=b=d=0}
> else if sel=11 then {d=in, a=b=c=0}

> **Chip name**: Mux8Way16
> **Inputs**: in, sel[3]
> **Outputs**: a,b,c,d,e,f,g,h
> **Function**: If sel=000 then {a=in, b=c=d=e=f=g=h=0}
> else if sel=001 then {b=in, a=c=d=e=f=g=h=0}
> else if sel=010...
> else if sel=111 then {h=in, a=b=c=d=e=f=g=0}.  

## Implementation

like math axioms, primitive gates provide basic building blocks from which everything else can be built. Operationally, primitive gates have an ‘‘off-the-shelf’’ implementation that is supplied externally. Thus, they can be used in the construction of other gates and chips without worrying about their internal design. 

In the computer architecture that we are now beginning to build, we have chosen to base all the hardware on one primitive gate only: **Nand**. We now turn to outlining the first stage of this bottom-up hardware construction project, one gate at a time.  Our implementation guidelines are intentionally partial, since we want you to discover the actual gate architectures yourself. We reiterate that each gate can be implemented in more than one way; the simpler the implementation, the better. 

![image-20200710092426961](C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200710092426961.png)

- **Not**: The implementation of a unary Not gate from a binary Nand gate is simple. Tip: Think positive.
- **And**: Once again, the gate implementation is simple. Tip: Think negative.
- **Or/Xor**: These functions can be defined in terms of some of the Boolean functions
  implemented previously, using some simple Boolean manipulations. Thus, the respective gates can be built using previously built gates.
- **Multiplexor/Demultiplexor**: Likewise, these gates can be built using previously built gates.
- **Multi-Bit Not/And/Or Gates**: Since we already know how to implement the elementary versions of these gates, the implementation of their n-ary versions is simply a matter of constructing arrays of n elementary gates, having each gate operate separately on its bit inputs. This implementation task is rather boring, but it will carry its weight when these multi-bit gates are used in more complex chips, as described in
  subsequent chapters.
- **Multi-Bit Multiplexor**: The implementation of an n-ary multiplexor is simply a matter of feeding the same selection bit to every one of n binary multiplexors. Again, a boring task resulting in a very useful chip.
- **Multi-Way Gates**: Implementation tip: Think forks.



## Project 1

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200714092134752.png" alt="image-20200714092134752" style="zoom:50%;" />



goal: Implement the following gates in HDL starting of with a Nand gate 



eg. mux gate (a and s) or (b and not(s))



eg. a XOR gate given information:

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200714092504295.png" alt="image-20200714092504295" style="zoom:50%;margin: 0 auto;"/>









#hdl



