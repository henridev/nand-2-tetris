 # 1. Boolean functions and gate logic 

## I.  Boolean values 

* boolean operations eg. and, not, or  ....
* boolean expressions eg. not(0 or (1 and 1)) 
* boolean functions eg. f(x,y,z) = (x and y) or not(z)

boolean identities 

- commutative 
  - (x and y) = (y and x)
  - (x or y) = (y or x)
- associative
  - (x and (y and z)) = ((x and y) and z)
  - (x or (y or z)) = ((x or y) or z)
- distributive
  - (x and (y and z)) = ((x and y) or (x and z)
  - (x or (y and z)) = ((x or y) and (x or z)
- Morgan laws
  - not(x and y) = not(x) or not(y)
  - not(x or y) = not(x) and not(y)

> Morgan Law
>
> <img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200802093653154.png" alt="image-20200802093653154" style="zoom:50%;" />
>
> it is clear the complement of the intersect aka not(a and b) cover the same area as the union of the complements
> aka not(a) or not(b) 
>
> <img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200802094040283.png" alt="image-20200802094040283" style="zoom:50%;" />
>
> it is clear that the complement of the union aka not(a or b) covers the same area as the intersect of the complements 
> aka not(a) and not(b)

## II.  Boolean function synthesis

<img src="C:\Users\henri\AppData\Roaming\Typora\typora-user-images\image-20200802095350772.png" alt="image-20200802095350772" style="zoom:70%;" />

we can quite easily arrive at a boolean function given this truth table if we take the functions for each output of 1 and or them together 

**any boolean function can be represented only via the operations AND / OR / NOT** 

> one step further 

**any boolean function can be represented only via the operations AND / NOT because we don't even need the or given Morgan Law not(x or y) = not(x) and not(y)  we can say that x or y is the same as not(not(x) and not(y))**

> one step further 

**any boolean function can be represented only via the operations NAND because not(x) = x nand x / x and y = (x nand y) nand (x nand y) = not(x and y)**

## III.  Logic gates 

elementary LG = elementary chip to deliver standard functionality 
composite LG = composition of elementary LG  

## IV.  Multi-bit buses

buses = bunch of bits manipulated together 

