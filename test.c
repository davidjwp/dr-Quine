#include <unistd.h>
#include <stdio.h>
#define ok int main(){char s[] = "#include <unistd.h>%c#include <stdio.h>%c#define ok int main(){printf(%c%s%c,10,10,34,s,34);execve(%c./a.out%c,(char*const[]){},(char*const[]){});}"; printf(s,10,10,34,s,34,34,34);execve("./a.out",(char*const[]){},(char*const[]){});}

// ok

int	main()
{
	char *ar[] = {"./test", 0};
	char *ev[] = {"HOME=/", 0};
	printf("hey\n");
	execve("./test", ar, ev);
}