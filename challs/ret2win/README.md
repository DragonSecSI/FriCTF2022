# ret2win

A simple ret2win challenge showcasing once again how unsafe `gets` is, where by overflowing the buffer we can also overwrite the return address in the current stackframe. This will make the function we are currently in (`vuln`) return to an arbitrary function of our choice. For example, we can overwrite it with the address of `win`, which will get us the shell.

Solution is in [sol.py](chall/sol.py).

Flag: `frictf{It_gets_harder}`

Compile source with `gcc -o chall/bof_2 -fno-stack-protector -no-pie chall/main.c`