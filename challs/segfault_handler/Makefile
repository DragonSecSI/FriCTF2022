bof_1: main.c
	gcc -no-pie -fno-stack-protector -o app/bof_1 main.c

.PHONY: docker_build docker_run

docker_build:
	docker build -t segfault .

docker_run:
	docker run -dit segfault

