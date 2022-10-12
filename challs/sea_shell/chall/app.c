#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>

char* code;

void set_memory() {
    code = mmap(0, 30, PROT_READ | PROT_EXEC | PROT_WRITE, 0x22, -1, 0);
    if (code == MAP_FAILED) {
        perror("mmap");
        exit(1);
    }
}

void vuln() {
    puts("This is a simple x86 assembly interpreter.");
    puts("Please input your code:");
    fgets(code, 30, stdin);
    // this will execute the code
    (*(void  (*)()) code)();
}

int main() {
    set_memory();
    vuln();
    return 0;
}