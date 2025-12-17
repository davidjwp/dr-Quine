#include <unistd.h>
void print() {
	int p = 0;
	char *s = "#include <unistd.h>@\
void print() {@\
	int p = 0;@\
	char *s = $;@\
	for (char *cpy = s; *cpy; cpy++) {@\
		if (*cpy == 64 && p) {write(1,(char[]){64,92,10},3); cpy++;}@\
		if (*cpy == 64 && !p) {write(1,(char[]){10},1); cpy++;}@\
		if (*cpy == 36 && !p) {p = 1; write(1,(char[]){34},1); cpy = s;}@\
		if (!(*(cpy+1)) && p) {p = 0; write(1,(char[]){125,34},2); cpy = (s + 59);}@\
		write(1,(char[]){*cpy},1);@\
	}@\
}@\
//comment 2@\
int	main(void) { //comment 1@\
	print();@\
}";
	for (char *cpy = s; *cpy; cpy++) {
		if (*cpy == 64 && p) {write(1,(char[]){64,92,10},3); cpy++;}
		if (*cpy == 64 && !p) {write(1,(char[]){10},1); cpy++;}
		if (*cpy == 36 && !p) {p = 1; write(1,(char[]){34},1); cpy = s;}
		if (!(*(cpy+1)) && p) {p = 0; write(1,(char[]){125,34},2); cpy = (s + 59);}
		write(1,(char[]){*cpy},1);
	}
}
//comment 2
int	main(void) { //comment 1
	print();
}