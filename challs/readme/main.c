#include <stdio.h>
#include <string.h>

#define FLAG "frictf{mY_ey3s_4Re_0peN_52653070654e}"

int main(int argc, char* argv) {
    puts("What is the flag?");
    char inp[64];
    fgets(inp, 64, stdin);
    inp[strcspn(inp, "\n")] = 0;

    if(!strcmp(inp, FLAG)) {
        puts("Correct");
    }
    else {
        puts("Try again");
    }
    return 0;
}
