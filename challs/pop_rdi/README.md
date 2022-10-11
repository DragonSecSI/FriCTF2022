# pop rdi

A simple ROP challenge made by VrumVrum showcasing a simple usage of ROP gadgets.

ROP stands for Return Oriented Programming. The basic premise is that after causing a buffer overflow, we overwrite the return address with little pieces of code that usually end with a `ret` instruction called gadgets. Those gadgets can be found with tools like `ROPgadget` and `pwntools` which search for them in the executable. By putting them together, we can create a ROP chain which can for example call any function we want, for example `win` or `system`. So far it's the same as in the `ret2win` challenge. The only difference is that here, we actually need to set the `rdi` register to `0xdeadbeef` in order so that `win` gets the right argument so that it can spawn shell. We need to to that **before** the `win` call, otherwise it will be too late and the call will already have been executed. 

Remember, arguments get passed over to functions using registers `rdi`, `rsi`, `rdx`, `rcx`, `r8` and `r9`. If the function we are calling wants more than 6 arguments, they should over to it using stack.

That was a solution where we set up the `win` function call with the correct argument. However, wa can also set up the ROP chain so that it returns straight to the `system("/bin/sh")` call in the `win` function, but in that case, we need to be more careful.
 
Solution in [sol.py](chall/sol.py)

Flag: `frictf{Do_you_gets_it_now?}`

Compile source with `gcc -o chall/bof_3 -fno-stack-protector -no-pie chall/main.c`