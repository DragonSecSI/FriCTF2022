bof_2: main.c
	gcc -o app/bof_2 -fno-stack-protector -no-pie main.c

.PHONY: docker_build docker_run

docker_build:
	docker build -t ret2win .

docker_run:
	docker run -dit ret2win

