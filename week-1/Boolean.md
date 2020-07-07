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

## Boolean algebra

boolean algebra => focus on boolean values (labeled true/false, 1/0, yes/no, on/off)

**Boolean function** => function that operates on binary inputs and returns binary outputs.

> computer hardware is based on the representation and manipulation of binary values 
>
> Boolean functions play a central role in the specification, construction, and optimization of hardware architectures. 
>
> Hence, the ability to formulate and analyze Boolean functions is the first step toward constructing computer architectures.

**Truth Table** enumerates all the possible values of the function’s input variables, along with the function’s output for each set of inputs. 

**Boolean Expressions** In addition to the truth table specification, a Boolean function can also be specified using Boolean operations over its input variables. The basic Boolean operators that are typically used are ‘‘And’’ (x And y is 1 exactly when both x and y are 1) ‘‘Or’’ (x Or y is 1 exactly when either x or y or both are 1), and ‘‘Not’’ (Not x is 1 exactly when x is 0). 

- x  ° y  (other option xy) => x And y, 
- x + y => x Or y
-  x̄ => Not x.

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200707061018263.png" alt="image-20200707061018263" style="zoom:50%; margin:0 auto;" />
$$
f(x,y,z) = (x+y)*\tilde{z}
$$
**Canonical Representation** As it turns out, every Boolean function can be expressed using at least one Boolean expression called the canonical representation. Starting with the function’s truth table, we focus on all the rows in which the function has value 1. For each such row, we construct a term created by And-ing together literals (variables or their negations) that fix the values of all the row’s inputs. 

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
we get a Boolean expression that is equivalent to the given truth table. Thus the canonical representation of the Boolean function shown in figure 1.1 is f 

> important conclusion: Every Boolean function, no matter how complex, can be expressed using three Boolean operators only: And, Or, and Not.  

