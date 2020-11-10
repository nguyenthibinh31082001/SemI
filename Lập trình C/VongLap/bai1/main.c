/* 
 * File:   main.c
 * Author: LAB3
 *
 * Created on September 9, 2019, 1:52 PM
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * 
 */
int main(int argc, char** argv) {
    int i,n,s;
    s=0;
    printf("Nhap so nguyen n: ");
    scanf("%d",&n);
    for(i=1;i<n;i++){
        s +=i;
        if(s<100){
            printf("tong nhung so nho hon %d la %d : %d \n",n,i,s);
        }
//        if(0<i<n){
//            printf("So %d nho hon %d\n",i,n);
//            s +=i;
//        }
    }
    printf("tong cac so nho hon %d: %d",n,s);
}

