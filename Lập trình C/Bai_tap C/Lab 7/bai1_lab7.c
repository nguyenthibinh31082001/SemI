/* 
 * File:   main.c
 * Author: LAB3
 *
 * Created on September 13, 2019, 2:57 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include<string.h>
#define max 100
void doisangchuhoa(char s[]){
    int i;
    int n=strlen(s);
    for(i=0;i<n;i++){
        if((s[i]>='a')&&(s[i]<='z')){
            s[i]=s[i]-32;
        }
    }
    printf("%s",s);
}

int main(int argc, char** argv) {
    char s[max];
    printf("Nhap chuoi:");
    gets(s);
    doisangchuhoa(s);
    getch();
    
}

