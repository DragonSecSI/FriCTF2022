#include <stdlib.h>
#include <stdio.h>
#include <string.h>

char FLAG[] = { 0x6b, 0x2c, 0x9b, 0x3b, 0x4c, 0x6b, 0xbc, 0xcb, 0x4c, 0x2a, 0x1b, 0x3b, 0x38, 0xfa, 0xdb, 0x9c, 0xfa, 0x29, 0x5b, 0xcb, 0x08, 0x6a, 0x5b, 0x4b, 0xfa, 0x1b, 0x3b, 0x1b, 0x48, 0x28, 0x48, 0x18, 0x18, 0x08, 0x58, 0x5b, 0x48, 0xdc };

const int SHIFT = 4;
const int MAGIC = 5;

void decrypt(char* pt) {
    int l = strlen(pt);
    for (int i = 0; i < l; i++) {
        pt[i] = (( ( (pt[i] - MAGIC) & 0x0F ) << SHIFT )) | ((( (pt[i] - MAGIC) & 0xF0 ) >> SHIFT ));
    }
}

int main(int argc, char* argv) {
    printf("Please enter the flag: ");
    char inp[64];
    fgets(inp, 64, stdin);
    inp[strcspn(inp, "\n")] = 0;
    decrypt(FLAG);
    if (strcmp(FLAG, inp)) {
        puts("Sorry, that's not quite right");
    }
    else {
        puts("Correct!");
    }
}
