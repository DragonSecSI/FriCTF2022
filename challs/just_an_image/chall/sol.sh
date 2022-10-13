#!/bin/sh

stegseek can_you_find_me.jpeg ./assets/rockyou.txt

chmod +x can_you_find_me.jpeg.out

./can_you_find_me.jpeg.out | base64 -d
