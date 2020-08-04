# Boolean Arithmetic

## 1.Binary 

**basics**
$$
x = x_nx_{n-1}\dots x_0 \text{ a string of digits }\\
\text{value of x in base b -- }(x)_b \\
(x_nx_{n-1}\dots x_0)=\sum{x_i*b^i} \\
\text{eg. } (0000000000001011)_{two} = 11
$$

**addition**

<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSBNKpJmqH4QsxLB_0ccWyp4k0BZOpweYpq4g&amp;usqp=CAU" alt="Binary Numbers" style="zoom:70%;margin: 0 auto" />

<div style="margin: 0 auto; text-align: center">table of addittion logic</div> 

|  a   |  b   |  c   |  sm  |  co  |
| :--: | :--: | :--: | :--: | :--: |
|  0   |  0   |  0   |  0   |  0   |
|  0   |  0   |  1   |  1   |  0   |
|  0   |  1   |  0   |  1   |  0   |
|  0   |  1   |  1   |  0   |  1   |
|  1   |  0   |  0   |  1   |  0   |
|  1   |  0   |  1   |  0   |  1   |
|  1   |  1   |  0   |  0   |  1   |
|  1   |  1   |  1   |  1   |  1   |

**negative numbers**

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200718105152622.png" alt="image-20200718105152622" style="zoom:50%;" />

you would think it's a good idea to have one bit represent the sign but this complicates hardware implementation instead we use **2nd complement method**

in a binary system with n digits the def of the 2nd complement is:
$$
\overline{x} = 
\begin{cases}
	 2^n-x \text{ if }x \neq{0}\\
	 0 \text{ otherwise }\\
\end{cases}
\\
\text{--- RULES ---} \\
\text{min number: } -2^{n-1}\\
\text{max number: } 2^{n-1}-1 \\
\dots \\ 
\text{+ num start with 0} \\
\text{- num start with 1} \\
\dots \\
\text{to flip from + to - } \\
\text{leave the MSB LSB 1 and 0 ´s intact while flipping the rest } \\
\dots \\
\text{addition of - is same as for postivie nums} \\
$$


> eg. what is 2nd complement of -10 for 5 bits? 
>
> * 2^5 - 10 = 22
> * 22 in 5 bits is 10110  
>
> eg. addition of -10 and -5 for 5 bits?
>
> *  10110 is -10
> *  11011 is -5 
> *  10001 is -16 in 2nd complement



## 2.Adder  specification 

- half-adder

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200718105816787.png" alt="image-20200718110007618" style="zoom:50%;" />

- full-adder

  <img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200718105858229.png" alt="image-20200718110007618" style="zoom:50%;" />

- adder

  <img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200718110007618.png" alt="image-20200718110007618" style="zoom:50%;" />

## 3. ALU

ALU computes a fixed set of functions out f(x,y) 

* x and y are the chip’s two 16-bit inputs
* out is the chip’s 16-bit output  
* f is an arithmetic or logical function selected from a fixed repertoire of eighteen possible functions.  

**control bits** determine which f to execute on x and y 

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200718110426578.png" alt="image-20200718110426578" style="zoom:50%;" />

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200718110518350.png" alt="image-20200718110518350" style="zoom:50%;" />

