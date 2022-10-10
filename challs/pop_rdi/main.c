// Check out ROPGadget
// ROPGadget --binary /path/to/bof_3

#include <stdio.h>
#include <stdlib.h>

void win(int a)
{
	if (a == 0xdeadbeef) {
		puts("Here is a shell for you");
		system("/bin/sh");
	} else {
		puts("No shell for you");
	}
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

/* my_function(a, b, c, d, e, f, ...);
 * a: RDI
 * b: RSI
 * c: RDX
 * d: RCX
 * e: R8
 * f: R9
 * ...: stack
 */
