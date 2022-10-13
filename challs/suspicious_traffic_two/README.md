# Suspicious traffic 1 

## Description
There is at first user login to some page, then he goes to some page where private key is downloaded.
Then he starts to download whole filesystem from webserver.


## Solution

User should extract private key from the capture and then use identity to login to server.
On login there is a flag in `cwd`. You just need to `cat flag.txt`.
