bof_1: main.c
	gcc -no-pie -fno-stack-protector -o chall/bof_1 chall/main.c

.PHONY: docker_build docker_run

docker_build:
	docker build -t segfault .

docker_run:
	docker run -dit segfault

