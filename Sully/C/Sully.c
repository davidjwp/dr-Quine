#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
//10 until X
char []itoa(int X){int len=0; while(X/10)len++;
    char s[len] = 0;
    while (len--) s[len] = (X - 48); 
return ((char[]){46,47,83,117,108,108,121,95,107,105,s})
}

#define MACRO(X) int main() {char *file= malloc(sizeof(char) * );int p=0;char *s = "#include <unistd.h>@\
#include <fcntl.h>@\
#define MACRO(X) int main() {int p=0;char *s = $;@\
int out = open((char[]){46,47,71,114,97,99,101,95,107,105,100,46,99,0},O_RDWR | O_CREAT, 0644);@\
for(char *cpy=s;*cpy;cpy++){/*comment*/@\
if (*cpy == 64 && p) {write(out,(char[]){64,92,10},3); cpy++;}@\
if (*cpy == 64 && !p) {(cpy-s)>65&&(cpy-s)<500?write(out,(char[]){92,10},2):write(out,(char[]){10},1); cpy++;}@\
if (*cpy == 36 && !p) {p = 1; write(out,(char[]){34},1); cpy = s;}@\
if (!(*(cpy+1)) && p) {p = 0; write(out,(char[]){*cpy,34},2); cpy = (s + 87);}write(out,(char[]){*cpy},1);}}@\
MACRO()";\
int out = open((char[]){46,47,83,117,108,108,121,95,107,105,itao(),46,99,0},O_RDWR | O_CREAT, 0644);\
for(char *cpy=s;*cpy;cpy++){/*comment*/\
if (*cpy == 64 && p) {write(out,(char[]){64,92,10},3); cpy++;}\
if (*cpy == 64 && !p) {(cpy-s)>65&&(cpy-s)<500?write(out,(char[]){92,10},2):write(out,(char[]){10},1); cpy++;}\
if (*cpy == 36 && !p) {p = 1; write(out,(char[]){34},1); cpy = s;}\
if (!(*(cpy+1)) && p) {p = 0; write(out,(char[]){*cpy,34},2); cpy = (s + 87);}write(out,(char[]){*cpy},1);}}
MACRO()