#!/bin/bash
chown pilot:pilot /app/bof_2
chmod +x /app/bof_2
while true; do
	su pilot -c 'timeout -k 30s 1d socat TCP-LISTEN:1337,nodelay,reuseaddr,fork EXEC:"stdbuf -i0 -o0 -e0 ./bof_2"'
done
