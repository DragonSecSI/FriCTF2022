# Segfault

A simple pwn made by VrumVrum showcasing how important finding and triggering a bug is. We set up a signal handler for segfault, which upon triggering, calls function `win`.

So, how do we trigger a segfault? Inspecting the source/decompiled code, we can see that input is read by `gets`. Is that a problem? Well, yes. If we take a closer look at it by typing `man gets` in the Linux terminal, we can find that it has a bug where it will read as many bytes as it is given on stdin. That means we can read more bytes than our buffer we are reading into has, causing a buffer overflow. This means we can write where we shouldn't be able to, and when OS sees this, it will simply send a SIGSEGV signal to our program, triggering our signal handler. Consenquentially, `win` will spawn shell through which we can get the flag simply by doing `cat flag.txt`.

Solution in [sol.py](chall/sol.py)

Flag: `frictf{It_couldnt_gets_easier}`

Compile source with `gcc -no-pie -fno-stack-protector -o chall/bof_1 chall/main.c`