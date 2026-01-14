#include <unistd.h>
void print() {int p=0;char *s = "#include <unistd.h>@\
void print() {int p=0;char *s = $;@\
for(char *cpy=s;*cpy;cpy++){@\
if (*cpy == 64 && p) {write(1,(char[]){64,92,10},3); cpy++;}@\
if (*cpy == 64 && !p) {(cpy-s)>25&&(cpy-s)<50?write(1,(char[]){92,10},2):write(1,(char[]){10},1); cpy++;}@\
if (*cpy == 36 && !p) {p = 1; write(1,(char[]){34},1); cpy = s;}@\
if (!(*(cpy+1)) && p) {p = 0; write(1,(char[]){*cpy,34},2); cpy = (s + 53);}write(1,(char[]){*cpy},1);}@\
}@\
/*@\
	Comment number 1@\
*/@\
int main() {@\
	/*@\
		Comment number 2@\
	*/@\
	return (print(), 0);@\
}";
for(char *cpy=s;*cpy;cpy++){
if (*cpy == 64 && p) {write(1,(char[]){64,92,10},3); cpy++;}
if (*cpy == 64 && !p) {(cpy-s)>25&&(cpy-s)<50?write(1,(char[]){92,10},2):write(1,(char[]){10},1); cpy++;}
if (*cpy == 36 && !p) {p = 1; write(1,(char[]){34},1); cpy = s;}
if (!(*(cpy+1)) && p) {p = 0; write(1,(char[]){*cpy,34},2); cpy = (s + 53);}write(1,(char[]){*cpy},1);}
}
/*
	Comment number 1
*/
int main() {
	/*
		Comment number 2
	*/
	return (print(), 0);
}