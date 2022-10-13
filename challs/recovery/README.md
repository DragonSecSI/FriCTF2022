# Impostor 

## Description
You have a windows memory dump file, your job is to find the flag.txt file and dump it then find the base64 string which is an encoded flag.

## Solution

1. Install volatility3
    - `git clone https://github.com/volatilityfoundation/volatility3.git`
    - install venv support for python3
    - create venv with `python3 -m venv venv`
    - activate it `source venv/bin/activate`
    - install requirements `pip3 install -r volatility3/requirements.txt`
2. Get the file list `python3 vol.py -f ../MEMORY.DMP windows.filescan > ../files.txt`
3. Find `flag.txt` and its address
4. Dump the file `python3 vol.py -f ../MEMORY.DMP -o ../proc windows.dumpfiles --virtaddr 0xe68f63c07960`
5. Open file, find flag function
6. decode base64: `echo ZnJpY3Rme3doNHRfMTVfdGgxNV9wcjBncjRtfQ== | base64 -d`
7. flag: `frictf{wh4t_15_th15_pr0gr4m}`
