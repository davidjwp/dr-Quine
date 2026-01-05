#include <unistd.h>
#include <stdio.h>

int main()
{
    int X=123,tmp=X,len=0;
    if (!X) len++;
    while (tmp) {len++; tmp/=10;}
    char s1[13+len];for(int i=0;i<13+len;i++)s1[i]=(char[]){46,47,83,117,108,108,121,95,107,105}[i];
    s1[13+len]=0; char s[len+1]; s[len]=0;
    while (len--) {s[len]=(48+(X%10));X/=10;}
    for (int i=0;s[i];i++) s1[10+i]=s[i],len++;
    for (int i=0;i<13)
    &s1[10+len]=(char[]){46,99,0};
    return (1);
}