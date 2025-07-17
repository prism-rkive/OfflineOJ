#include<stdio.h>
#include<string.h>
int main()
{
    char string[101];
    gets(string);
    int x, count=0, i;
    x=strlen(string);
    for(i=0; i<x; i++)
    {
        if(string[i]=='H'||string[i]=='Q'||string[i]=='9')
            count++;
    }
    if(count>=1)
        printf("YES");
    else
        printf("NO");
}
