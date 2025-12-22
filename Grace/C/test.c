#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>

int	main(void)
{
	// int out = open("Grace_kid.c", O_RDWR | O_CREAT, 0644);
	int out = open((char[]){46,47,71,114,97,99,101,95,107,105,100,46,99,0},O_RDWR | O_CREAT, 0644);
	
	write(out,"hello",5);
	return (0);
}