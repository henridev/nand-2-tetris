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

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200719054617922.png" alt="image-20200719054617922" style="zoom:50%;" />

we will combine remembering info with our dff and manipulating this with our combinatorial logic 

**💿 register** ➡️  🥅 remember input forever 🥅

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200719054906718.png" alt="image-20200719054906718" style="zoom:50%;" />

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200719055437503.png" alt="image-20200719055437503" style="zoom:50%;" />

➡️ we have an inputbit and loadbit coming in. if loadbit is 1 then we want to remember inputbit at that T time.
➡️ if loadbit becomes 0 we just remember the last inputbit it got for infinity

how can this be implemented?

naïve approach is: take the output we now have and feed it back as input 

good approach: we know the mux where we have load as our selector
in on T-1 gets selected if selector = 1 (load in new state)
out on T-1 gets selected if selector = 0 (keep state)

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200719055755101.png" alt="image-20200719055755101" style="zoom:50%;" />

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200719060422553.png" alt="image-20200719060422553" style="zoom:33%;" />

differences DFF and register

➡️ DFF always stores the “in” bit, while Bit only stores it if “load” is set to 1.
➡️ DFF can store information for one time unit only, while Bit can store it for many cycles.

## 3. Memory units

take a 1bit register and put them next to each other ➡️ 16 bit register 
**state** = value currently stored inside the register || value currently expressed by internal circuits of the register 

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200719080259659.png" alt="image-20200719080259659" style="zoom:50%;" />

* 👁️‍🗨️ Reading the state 
  * probing out
* ✍️ Writing the state 
  * set in = new Value()
  * set load = 1 
  * in next cycle the out will be = new Value()

**💿Ram** ➡️  **sequential chip** of n addressable registers with addresses from 0 to n-1

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200719081056811.png" alt="image-20200719081056811" style="zoom:50%;" />

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200719081809677.png" alt="image-20200719081809677" style="zoom:33%;" />

⚠️ see little triangle means clock dependent thus a sequential  chip 
⚠️at any T time only one register in ram is selected this is why we have to specify an **address** 
$$
\text{k width in bits of address input: } k = log_2n\text{ bits}\\
\text{eg ram with 8 registers require 4 bit addresses}
$$


* 👁️‍🗨️ Reading the RAM state

  * set address to desired register address i
  * probe out of the ram unit

* ✍️ Writing the RAM state 

  * set address to desired register address i
  * set in = new Value()
  * set load = 1 
  * in next cycle the state of register i will be = new Value() && out will emit this new Value() so just probe out

  

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

