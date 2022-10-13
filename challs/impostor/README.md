# Impostor 

## Description
You have a windows memory dump file, your job is to find the process that is suspicious, dump it and then use ghidra to decompile it.

## Solution

1. Install volatility3
    - `git clone https://github.com/volatilityfoundation/volatility3.git`
    - install venv support for python3
    - create venv with `python3 -m venv venv`
    - activate it `source venv/bin/activate`
    - install requirements `pip3 install -r volatility3/requirements.txt`
2. Get the process tree `python3 vol.py -f ../MEMORY.DMP windows.pstree > ../pstree.txt`
3. Lssas is the process we are looking for, the one spawned by the explorer.exe
4. Dump the process `python3 vol.py -f ../MEMORY.DMP -o ../proc windows.dumpfiles --pid 3804`
5. Get bunch of files, the one important is the `lsass.exe.dat` file
6. Use ghidra to decompile it and look in main function
7. You get a PowerShell system command line call
8. Decode base64 sring in command `echo aQBmACAAKAAkAHQAcgB1AGUAKQAgAHsADQAKACAAIAAgACAAVwByAGkAdABlAC0ATwB1AHQAcAB1AHQAIAAiAEcAbwBuAG4AYQAgAG4AZQBlAGQAIABtAG8AcgBlACAAZQBmAGYAbwByAHQAIAB0AGgAYQBuACAAdABoAGEAdAAiAA0ACgB9ACAAZQBsAHMAZQAgAHsADQAKACAAIAAgACAAVwByAGkAdABlAC0ATwB1AHQAcAB1AHQAIAAiAFoAbgBKAHAAWQAzAFIAbQBlADIANAB3AFgAegBWADAAYwBqAEYAdQBaAHoAVgBmAFoAagBCAHkAWAAzAGsAdwBkAFYAOQAwAE0ARwBRADAAZQBYADAAPQAiAA0ACgB9AA== | base64 -d`
9. Decode the next base64 string you get after decoding and you get the flag `echo ZnJpY3Rme24wXzV0cjFuZzVfZjByX3kwdV90MGQ0eX0= | base64 -d`
10. `frictf{n0_5tr1ng5_f0r_y0u_t0d4y}`
