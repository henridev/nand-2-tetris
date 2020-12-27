 # 1. Boolean functions and gate logic 

## I.  HDL program

$$
\text{conversion of the following boolean function to a chip} \\
\overline{(a\neq b)\vee(a\neq b)}\\
\text{are all three inputs equal?} \\
$$

```vhdl
CHIP CheckForEquality{
    IN a,b,c;
    OUT out
    PARTS:
    Xor(a=a, b=b, out=xor1)
    Xor(a=b, b=c, out=xor2)  
    Or(a=xor1, b=xor2, out=or1)
    Not(in=or1, out=out)
}
```

### bussess

```vhdl
CHIP Not8 {
	IN in[8];
    OUT out[8]; 
    ...
}

CHIP Foo {
    ...
    PARTS:
    ...
    // sixInBin = 110 
    // in 1011 0011
    // out1 01001
	Not8(in[0..1]=true, in[3..5]=sixInBin, in[7]=true, in[3..7]=out1)
    ...
}
```



## II.  Boolean logic 

$$
\text{boolean operations: } and \space not \space or\\
\text{boolean expressions: } \overline{0 + (1 * 1)}=0\\
\text{boolean functions: } f(x,y,z) = (x * y) + \overline{z}\\\\
$$

### boolean identities 

$$
\text{commutative -- } [x+y=x+y], \space [x*y=y*x] \\
\text{distibutive -- } [x+(y*z)=(x+y)*(x+z)], \space [x*(y+z)=(x*y)+(x*z)] \\
\text{associative -- } [x+(y+z)=(x+y)+z], \space [x*(y*z)=(x*y)*z] \\
\text{morgan laws -- } [\overline{x+y}=\overline{x}*\overline{y}], \space 	                         [\overline{x*y}=\overline{x}+\overline{y}] \\
$$

> simplify an expression via identities
> $$
> \overline{(\overline{x}*(\overline{x+y}))}\\
> \overline{\overline{x+(x+y)}} \text{ => morgan law}\ \\
> x+(x+y) \text{ => involution law}\\
> (x+x)+y \text{ => associative law} \\ 
> x+y \text{ => indempotence law} \\
> $$

### Morgan Law

​									  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Demorganlaws.svg/1200px-Demorganlaws.svg.png" width=600>



it is clear the complement of the intersect aka not(a and b) cover the same area as the union of the complements
aka not(a) or not(b) 

it is clear that the complement of the union aka not(a or b) covers the same area as the intersect of the complements 
aka not(a) and not(b)



## III.  Boolean function synthesis

any boolean function can be represented using only NAND gates
$$
\oplus \text{ <== NAND symbol}\\
\overline{x} = x \oplus x \\
x * y =  ((x \oplus y) \oplus (x \oplus y)) = \overline{x \oplus y}\\
x + y =  \overline{\overline{x} * \overline{y}}
$$


<img src="https://res.cloudinary.com/dri8yyakb/image/upload/v1607675394/Screenshot_from_2020-12-11_09-29-37_ii0gtn.png" width=300/>



we can quite easily arrive at a boolean function given this truth table if we take the functions for each output of 1 and or them together 

**any boolean function can be represented only via the operations AND / OR / NOT** 

> one step further 

**any boolean function can be represented only via the operations AND / NOT because we don't even need the or given Morgan Law not(x or y) = not(x) and not(y)  we can say that x or y is the same as not(not(x) and not(y))**

> one step further 

**any boolean function can be represented only via the operations NAND because not(x) = x nand x / x and y = (x nand y) nand (x nand y) = not(x and y)**

 

## V.  Multi-bit buses

buses = bunch of bits manipulated together 

