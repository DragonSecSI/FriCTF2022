#include <stdio.h>
#include <signal.h>
#include <stdlib.h>

void win()
{
	puts("Here is a shell for you");
	system("/bin/sh");
}

void vuln()
{
	unsigned char buf[200];
	printf("Input: ");
	gets(buf);
	printf("%s\n", buf);
}

int main()
{
	signal(SIGSEGV, win);
	vuln();
	return 0;
}
