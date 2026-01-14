#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

#define COMP (char[]){47,117,115,114,47,98,105,110,47,103,99,99,0}
#define EXE (char[]){46,47,83,117,108,108,121,0}

int main(int ac, char **av, char **env)
{
    execve(COMP, (char* const[]){"/home/djacobs/intra_djacobs/6_Projects/dr-Quine/Sully/C/test1.c","-o","HERE",NULL},env);
    printf("execute fail\n");
    return (0);
}