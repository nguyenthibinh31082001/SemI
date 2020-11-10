/* 
 * File:   main.c
 * Author: LAB3
 *
 * Created on September 9, 2019, 4:03 PM
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * 
 */
int main(int argc, char** argv) {
    int a, *controA;
    a = 50;
    controA = &a;
    
    printf("Gia tri cua bien a %d\n",a);
    printf("Dia chi luu tru cua bien a %x",controA);
}

