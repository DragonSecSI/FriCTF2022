default := build

build: main.c gen_flag.py flag.txt
	chmod u+x gen_flag.py
	./gen_flag.py
	gcc main_compile.c -O1 -ochall

clean:
	-rm chall main_compile.c
