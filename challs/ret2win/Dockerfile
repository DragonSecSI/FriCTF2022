# docker build -t bof_1 .
# docker run

FROM ubuntu:20.04
RUN apt-get update && apt-get install -y make gcc socat

RUN groupadd pilot
RUN useradd pilot --gid pilot

COPY ./app /app
WORKDIR /app

EXPOSE 1337
ENTRYPOINT [ "bash", "/app/startService.sh" ]
