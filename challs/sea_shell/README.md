# Sea Shell

A shellcode challenge made by AlwaysGuilty.

Input a shellcode from [shellstorm](https://www.shellstorm.org) that is at most 29 Bytes long (`fgets` reads 1 byte less than the limit it is given). Make sure it is for x86-64 Linux. In my solution, I used this [one](https://shell-storm.org/shellcode/files/shellcode-806.php).

Flag: `frictf{d1d_y0u_w34th3r_th3_sh3llst0rm?}`

Solution in [sol.py](chall/sol.py)

Compile source with `gcc -o chall/app chall/app.c`