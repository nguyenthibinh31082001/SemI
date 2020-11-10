/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: Admin
 *
 * Created on September 18, 2019, 8:54 AM
 */

#include <stdio.h>
#include <stdlib.h>
int hinhvuongrong(int a[50][50],int m,int n){
    int i,j;
    printf("m %d n %d",m,n);
    printf("\n");
    for(i=0;i<n;i++){
        for(j=0;j<m;j++){
            if(i==0||j==0||i==(n-1)||j==(n-1)){
                printf("%4d\t",a[i][j]);
            }else{
                printf("        ");
            }
        }
        printf("\n");
    }
}
void main(){
    int m,n,i,j;
    int a[50][50];
    printf("Nhap vao cot n:");
    scanf("%d",&n);
    printf("Nhap vao hang m:");
    scanf("%d",&m);
    for(i=0;i<n;i++){
        for(j=0;j<m;j++){
            printf("Mang vua nhap la:[%d][%d]=",i,j);
            scanf("%d",&a[i][j]);
        }
    }
    hinhvuongrong(a,m,n);
}

