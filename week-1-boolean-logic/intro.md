# Introduction

three learning objectives:

* how computers work
* how to break complex problems into manageable modules 
* how to develop large-scale hardware and software systems. 

simple hello world let's explore

```java
class Main {
    function void main() {
    do Output.printString("Hello World");
    do Output.println(); // New line.
    return;
    }
}
```

under the hood:

- program = characters in txt file. 
- task 1 compilation:
  - parse text
  - uncover its semantics
  - reexpress in some low-level language understood by our
    computer. **machine code**
- task 2 realize machine code via hardware architecture
- task 3 implement hardware architecture via a **chip set** (registers, memory units, ALU etc...)
- hardware devices = constructed from an integrated package of elementary logic gates. 
  - logic gates =  built from primitive gates like Nand and Nor. Of course
  - every one of these gates consists of several switching devices, typically implemented
    by transistors. 


## Abstractions

book works in separate modules where in each you need to understand and implement an abstraction.

* run high-level programs (chapters 9 and 12).

* hardware land, tracking the fascinating twists and curves of translating high-level programs into machine language (chapters 6, 7, 8, 10, 11). 

* Finally, we reach the low "grounds of our journey, describing how a typical hardware platform is actually constructed (chapters 1–5).

  

Starting with the construction of elementary logic gates (chapter 1), combinational and sequential chips (chapters 2–3).
design of a typical computer architecture (chapters 4–5).
a typical software hierarchy (chapters 6–8). 
Implementing a compiler (chapters 10–11) 
for a modern object-based language (chapter 9)
Ending with the design and implementation of a simple operating system (chapter 12).
