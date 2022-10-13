bof_3: main.c
	gcc -o chall/bof_3 -fno-stack-protector -no-pie chall/main.c

.PHONY: docker_build docker_run

docker_build:
	docker build -t pop_rdi .

docker_run:
	docker run -dit pop_rdi
