/* 
 * File:   main.c
 * Author: LAB3
 *
 * Created on September 13, 2019, 4:36 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include<string.h>

int main(int argc, char** argv) {
    char var[50],check;
    int count=0,i;
    printf("Nhap vao mot chuoi:");
    gets(var);
    printf("Nhap ky tu kiem tra:");
    scanf("%c",&check);
    for(i=0;i<strlen(var);i++){
        if(var[i]==check){
            count=count+1;
        }
    }
    if(count==0){
        printf("Ky tu %c khong co trong chuoi",check);
    }else if(count>0){
        printf("Ky tu %c xuat hien %d lan trong chuoi",check,count);
    }
    printf("\n");
}

