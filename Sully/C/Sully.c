#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
int X = 5;
int p=0,FilLen=0;
char*MakeFileString(int x){int len=0,tmp=x;if(!x)len=1;while(tmp){len++;tmp/=10;};FilLen=len;
char *s=(char*)malloc(sizeof(char)*(9+len));if(!s){write(1,(char[]){101,114,114,32,97,108,108,111,99},9);exit(1);}
char *fil=(char[]){83,117,108,108,121,95,46,99,0};
for (int i=0;i<(len+9);i++){if(i==6)i+=len;s[i]=*fil;fil++;}
if (!x){s[6]=48;return (s);}while(x){s[6+(len-1)] = 48+(x%10);x/=10;len--;}return (s);}
int main(void){char *s = "#include <unistd.h>@\
#include <fcntl.h>@\
#include <stdlib.h>@\
int X = ^;@\
int p=0,FilLen=0;@\
char*MakeFileString(int x){int len=0,tmp=x;if(!x)len=1;while(tmp){len++;tmp/=10;};FilLen=len;@\
char *s=(char*)malloc(sizeof(char)*(9+len));if(!s){write(1,(char[]){101,114,114,32,97,108,108,111,99},9);exit(1);}@\
char *fil=(char[]){83,117,108,108,121,95,46,99,0};@\
for (int i=0;i<(len+9);i++){if(i==6)i+=len;s[i]=*fil;fil++;}@\
if (!x){s[6]=48;return (s);}while(x){s[6+(len-1)] = 48+(x%10);x/=10;len--;}return (s);}@\
int main(void){char *s = $;@\
while (X--){@\
char*fil=MakeFileString(X);@\
int out = open(fil,O_RDWR | O_CREAT, 0644);@\
for(char *cpy=s;*cpy;cpy++){@\
if (*cpy == 126 && !p) {write(out,(char[]){37,0},1);cpy++;}@\
if (*cpy == 94 && !p) {write(out,&(fil[6]),FilLen);free(fil); cpy++;}@\
if (*cpy == 64 && p) {write(out,(char[]){64,92,10},3); cpy++;}@\
if (*cpy == 64 && !p) {(cpy-s)>470&&(cpy-s)<480?write(out,(char[]){92,10},2):write(out,(char[]){10},1); cpy++;}@\
if (*cpy == 36 && !p) {p = 1; write(out,(char[]){34},1); cpy = s;}@\
if (!(*(cpy+1)) && p) {p = 0; write(out,(char[]){*cpy,34},2); cpy = (s+523);}@\
write(out,(char[]){*cpy},1);}}}";
while (X--){
char*fil=MakeFileString(X);
int out = open(fil,O_RDWR | O_CREAT, 0644);
for(char *cpy=s;*cpy;cpy++){
if (*cpy == 126 && !p) {write(out,(char[]){37,0},1);cpy++;}
if (*cpy == 94 && !p) {write(out,&(fil[6]),FilLen);free(fil); cpy++;}
if (*cpy == 64 && p) {write(out,(char[]){64,92,10},3); cpy++;}
if (*cpy == 64 && !p) {(cpy-s)>470&&(cpy-s)<480?write(out,(char[]){92,10},2):write(out,(char[]){10},1); cpy++;}
if (*cpy == 36 && !p) {p = 1; write(out,(char[]){34},1); cpy = s;}
if (!(*(cpy+1)) && p) {p = 0; write(out,(char[]){*cpy,34},2); cpy = (s+523);}
write(out,(char[]){*cpy},1);}}}