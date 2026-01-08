#include <stdio.h>
#include <stdlib.h>

char *itoa(int it)
{
	int tmp = it, len = 0;
	if (!tmp) len++;
	while (tmp) {
		len++;
		tmp /=10;
	}
	char* s = (char*)malloc(sizeof(char) * (len+1));
	if (!s) return ("error");
	s[len] = 0;
	for (int i = len-1;it;i--) {
		s[i] = 48+(it%10);
		it/=10;
	}
	return (s);
}

int	main(void)
{
	char *s ="12345";
	int it = 0;

	while (*s) {
		it += *s-48;
		s++;
		if (*s) it*=10;
	}
	
	printf("%i\n",it);
	char *st = itoa(it);
	printf("%s\n",st);
	if (st) free(st);
	return (0);
}
