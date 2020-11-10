/* 
 * File:   main.c
 * Author: LAB3
 *
 * Created on September 13, 2019, 3:56 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include<string.h>
#include<ctype.h>
void chu_hoa( char a[]){
    int i;
    int n=strlen(a);
    for(i=0;i<n;i++){
        if(a[i]==' '&& a[i+1]){
            a[i+1]=toupper (a[i+1]);
            a[0]=toupper(a[i]);
        }
    }
    printf("%s\n",a);
}
int main(){
    char a[12];
    printf("Nhap vao chuoi ky tu:");
    gets(a);
    chu_hoa(a);
  
}

 


