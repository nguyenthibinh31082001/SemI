/* 
 * File:   main.c
 * Author: LAB3
 *
 * Created on September 9, 2019, 3:53 PM
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * 
 */
int main(int argc, char** argv) {
    int array[10] = {1,2,3,4,5,6,7,8,9,10};
    int i=0;
    for(i;i<10;i++){
        printf("Gia tri phan tu mang %d dia chi o nho %X \n",array[i],&array[i]);
        printf("\t%d",*(array+i));
    }
}

