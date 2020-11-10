/* 
 * File:   main.c
 * Author: LAB3
 *
 * Created on September 9, 2019, 3:07 PM
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * 
 */
int main(int argc, char** argv) {
    int i,j;
    for(i=1;i<=100;i++){
        for(j=1;j<=100;j++){
            if(i*5+j*3+(100-i-j)/3==100){
                printf("%d trau dung %d trau nam %d trau gia\n", i,j,(100-i-j));
            }
        }
    }
    return (EXIT_SUCCESS);
}

