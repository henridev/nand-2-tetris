# Week 3 - memory

## 1. Sequential logic

why do we need ⌚

```python
# 👉 use same hardware over time
for x in range(1,100)
	a += 1
# 👉 keep state 
sum = 0 
for x in range(1,100)
	sum = sum + x
```

idea behind our ⌚

<img src="https://res.cloudinary.com/dri8yyakb/image/upload/v1609077615/memory_1_erbrgd.png" width=550/>





**Combinational logic**
👉 functions only dependent on combinations of their inputs 
👉 output is there immediately 
❌ they don't support maintaining state although their functionalities are  useful  

**Sequential logic**
👉 functions dependent on time
👉 output dependent on input provided earlier
✔️ can support state 
$$
\text{Combinatorial: }out[t]=fun(in[t])\\
\text{Sequential: }out[t]=fun(in[t-1])\\
\text{Sequential: }state[t]=fun(state[t-1])\\
$$
<img src="https://res.cloudinary.com/dri8yyakb/image/upload/v1609078600/memory-Page-2_diqiml.png" />

while for combinatorial logic the output at  T depends just on the input at time T  for sequential logic the output at at T depends on the input from previous clock cycle T-1


what if we want in and out to be same locations in hardware? we create a state as we go along never remembering and always moving based on previous result.



## 2. flip-flops chips implementing sequential logic 

💿 **remember state**

- we need something that can **move 1-bit info in T-1 to T**
- we need something that can **remember / 0** and **remember / 1** 
- thus we call this **flip-flops**

**💿 Data flip-flop**

at any point in time T a dff will output the value that was in at time T-1. Look also at the mini triangle which signifies that the chip depend on a clock and thus can remember.

<img src="https://res.cloudinary.com/dri8yyakb/image/upload/v1609079380/memory-Page-3_weume3.png" style="zoom:65%;" />



**💿 from remembering a bit to remembering everything**

<img src="https://res.cloudinary.com/dri8yyakb/image/upload/v1609080077/memory-Page-4_vomtfu.png" width=500 />

we will combine remembering info with our dff and manipulating this with our combinatorial logic 



**💿 register** ➡️ implementation with DFF that will remember input forever 

```
if(load === 1) out[t] = in[t-1]
else if(load === 0) out[t] = out[t-1]
```

<img src="https://res.cloudinary.com/dri8yyakb/image/upload/v1609083325/memory-Page-5_hyjyr7.png" width=600/>



differences DFF and register

➡️ DFF always stores the “in” bit, while Bit only stores it if “load” is set to 1.
➡️ DFF can store information for one time unit only, while Bit can store it for many cycles.

## 3. Memory units

what memory are we talking about ? 

>  types of memory : 
>
> - main 
> - secondary
> - volatile vs non-volatile
>
> ram => stores data on which program operates and also the instructions which are the blocks of the program itself

take a 1-bit register and put them next to each other ➡️ 16 bit register 

**state** = value currently stored inside the register || value currently expressed by internal circuits of the register (illusion of storage)

<img src="https://res.cloudinary.com/dri8yyakb/image/upload/v1609084344/memory-Page-7_iuycn1.png"  />

```
READ STATE = probe OUT of register
WRITE STATE = SET LOAD = 1 && SET IN = New Val()
```

**💿Ram** ➡️  **sequential chip** of n addressable registers with addresses from 0 to n-1



<img src="https://res.cloudinary.com/dri8yyakb/image/upload/v1609085287/memory-Page-6_cndyth.png" width=600 />

at any T time only one register in ram is selected this is why we have to specify an **address** 
$$
\text{k width in bits of address input: } k = log_2n\text{ bits}\\
\text{eg ram with 8 registers require 3 bit addresses}
$$



```
READ RAM STATE = SET address to register && address i && probe OUT of register
WRITE STATE = SET address to register && SET LOAD = 1 && SET IN = New Val()
```

we will build the following RAM units 

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200719082630938.png" alt="image-20200719082630938" style="zoom:44%;" />

## 4. Counter chips

i have robot and i want it to make brownies. 
i write a program for the robot to follow a recipe.
on the wall i put a counter

* which tells the robot which instruction of the recipe to follow.
* at the end of every instruction this counter+1  
* i can change the counter at will 

our three possible instructions are

* **Reset** ➡️ counter to 0 fetch the first instruction 
* **Next** ➡️ counter++ fetch the next instruction 
* **Goto** ➡️ fetch instruction n 

in order to realize this abstraction we build a **counter chip**

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200719083501895.png" alt="image-20200719083501895" style="zoom:50%;" />

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200719083603355.png" alt="image-20200719083603355" style="zoom:50%;" />

## 5. Implementation 

- 1 bit register 

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200802132425706.png" alt="image-20200802132425706" style="zoom:67%;" />

* 16-bit register 

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200802132520356.png" alt="image-20200802132520356" style="zoom:67%;" />



* 16-bit register 

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200802132520356.png" alt="image-20200802132520356" style="zoom:67%;" />

* ram 



<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200802132803651.png" alt="image-20200802132803651" style="zoom:67%;" />

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200802132936043.png" alt="image-20200802132936043" style="zoom:67%;" />



* counter 

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200802133044036.png" alt="image-20200802133044036" style="zoom:50%;" />

