# Boolean Arithmetic

## 1. Binary 

### basics

$$
x = x_nx_{n-1}\dots x_0 \text{ a string of digits }\\
\text{value of x in base b -- }(x)_b \\
(x_nx_{n-1}\dots x_0)= \sum{x_i*b^i} \\
\text{eg. } (0000000000001011)_{two} = 11
$$

### addition

<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSBNKpJmqH4QsxLB_0ccWyp4k0BZOpweYpq4g&amp;usqp=CAU" alt="Binary Numbers" style="zoom:70%;margin: 0 auto" />

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

### signed numbers / 2nd complements / negative numbers

| Decimal value | Two's-complement representation |
| :-----------: | :-----------------------------: |
|       0       |               000               |
|       1       |               001               |
|       2       |               010               |
|       3       |               011               |
|      −4       |               100               |
|      −3       |               101               |
|      −2       |               110               |
|      −1       |               111               |


$$
\text{the sum of a number and it's second complement is } = 2^n th \\
\space\\
\text{A two's-complement number system encodes positive and negative numbers}\\
\text{in a binary number representation. The weight of each bit is a power of two, except for }\\
\text{the most significant bit, whose weight is the negative of the corresponding power of two.}\\
\space\\
\text{we now only have a range of}
\dots \\
\text{for postivie nums } [0...2^{n-1}-1]\\
\text{for negative nums } [-1..-2^{n-1}]\\
$$
**2nd complement method** makes implementing subtraction easier in hardware
$$
\text{--- RULES ---} \\
\text{min number: } -2^{n-1}\\
\text{max number: } 2^{n-1}-1 \\
\dots \\ 
\text{+ num start with 0} \\
\text{- num start with 1} \\
\dots \\
\text{to flip from + to - } \\
\text{flip all bits and add 1} \\
$$

$$
\text{example}\\
-5-10=? \\
\text{5 in binary is 00101 so -5 is 11011}\\
\text{10 in binary is 01010 so -10 is 10110}\\
\begin{matrix}
carry & 1 & 1 & 1 & 0 & -\\
-5 : & 1 & 1 & 0 & 1 & 1\\
-10 : & 1 & 0 & 1 & 1 & 0\\
sum & 1 & 0 & 0 & 0 & 1\\
\end{matrix}
$$

## 2. ALU



<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Von_Neumann_Architecture.svg/1200px-Von_Neumann_Architecture.svg.png" width=500/>



<img src="https://res.cloudinary.com/dri8yyakb/image/upload/v1607925889/Untitled_Diagram_knhwhs.png"/>



