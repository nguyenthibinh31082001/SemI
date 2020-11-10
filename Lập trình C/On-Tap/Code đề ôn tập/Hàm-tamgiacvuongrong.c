/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: Admin
 *
 * Created on September 18, 2019, 9:52 AM
 */

#include <stdio.h>
#include <stdlib.h>

int tamgiacrong(int a[50][50],int n){
    int i,j;
    for(i=0;i<n;i++){
        for(j=0;j<n;j++){
            if(j==0||i==(n-1)||i==j){
                printf("%4d\t",a[i][j]);
            }else{
                printf("        ");
            }
        }
        printf("\n");
    }
}
int main(int argc, char** argv) {
    int i,j,n;
    int a[50][50];
    printf("Nhap vao n:");
    scanf("%d",&n);
    for(i=0;i<n;i++){
        for(j=0;j<n;j++){
            printf("mang vua nhap la:[%d][%d]=",i,j);
            scanf("%d",&a[i][j]);
    } 
}
    tamgiacrong(a,n);
}

