/* 
 * File:   main.c
 * Author: LAB3
 *
 * Created on September 9, 2019, 2:59 PM
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * 
 */
int main(int argc, char** argv) {
    int s=0,b,i=1;
    do{
        printf("nhap so thu %d :",i);
        scanf("%d",&b);
        s+=b;
        i++;
    }while(b!=0);
    
    printf("Tong %d \n",s);

    return (EXIT_SUCCESS);
}

