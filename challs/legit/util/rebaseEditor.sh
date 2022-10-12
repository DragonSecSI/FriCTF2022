#!/bin/bash
filename="$1"
# Change first ocurance of pick to edit
sed -i '0,/pick/s//edit/' "$filename"
exit 0
