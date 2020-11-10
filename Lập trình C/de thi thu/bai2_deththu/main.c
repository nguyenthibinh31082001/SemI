/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: Admin
 *
 * Created on September 17, 2019, 9:34 AM
 */

#include <stdio.h>
#include <stdlib.h>


int main(int argc, char** argv) {
    
    int i,j,m,n;
    printf("Nhap so hang n=");    
    scanf("%d",&n);
    printf("Nhap so cot m=");    
    scanf("%d",&m);
    for(i=1;i<=n;i++){
        for(j=1;j<=m;j++){
            if(i==1||j==1||i==n||j==m){
                printf("*");
            }else{
                printf(" ");
            }
        }
        printf("\n");
    }

    
}

