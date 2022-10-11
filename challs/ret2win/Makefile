bof_2: main.c
	gcc -o chall/bof_2 -fno-stack-protector -no-pie chall/main.c

.PHONY: docker_build docker_run

docker_build:
	docker build -t ret2win .

docker_run:
	docker run -dit ret2win

