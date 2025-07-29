#include <stdio.h>

char msg[] = "Hello from assembly!\n";
int len = sizeof("Hello from assembly!\n") - 1;

int main() {
    __asm__ volatile (
        "mov $1, %%rax\n\t"        
        "mov $1, %%rdi\n\t"        
        "mov %[m], %%rsi\n\t"      
        "mov %[l], %%rdx\n\t"      
        "syscall\n\t"
        :
        : [m] "r"(msg), [l] "r"((long)len)
        : "rax", "rdi", "rsi", "rdx"
    );
    return 0;
}
