#include <stdio.h>
#include <stdlib.h>

void win()
{
	puts("Here is a shell for you");
	system("/bin/sh");
}

void vuln()
{
	char buf[20];
	printf("Input: ");
	gets(buf);
	printf("%s\n", buf);
}

int main()
{
	vuln();
	return 0;
}

/* Stack layout (each line is 64 bits)
 *
 * +-----------+
 * |data       |<-- RSP
 * |...        |
 * |data       |
 * |saved RBP  |<-- RBP
 * |saved RIP  |
 * +-----------+
 *
 */
