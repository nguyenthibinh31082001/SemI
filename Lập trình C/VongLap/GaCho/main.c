/* 
 * File:   main.c
 * Author: LAB3
 *
 * Created on September 9, 2019, 2:45 PM
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * 
 */
int main(int argc, char** argv) {
    int i=1;
    for(i;i<=36;i++){
        if(i*2 + ((36-i)*4) == 100){
            printf("ga %d chan Ga %d -  cho %d chan Cho %d",i,i*2,36-i,(36-i)*4);
        }
    }
}

