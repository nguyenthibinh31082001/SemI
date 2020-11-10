/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: Admin
 *
 * Created on September 17, 2019, 10:53 AM
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * 
 */
void main(int argc, char** argv) {
    int i,j,n;
    printf("Nhap n:");
    scanf("%d",&n);
    for(i=0;i<=n;i++){
        for(j=0;j<=n,j++){
            if(j==0||i==j||i==n){
                printf("*");
            }else{
                printf(" ");
            }          
        }
        printf("\n");
    }
}
 


