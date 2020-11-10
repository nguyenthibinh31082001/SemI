/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: Admin
 *
 * Created on September 17, 2019, 8:58 AM
 */

#include <stdio.h>
#include <stdlib.h>
void nhapmang(float a[],int n){
    int i;
    for(i=0;i<n;i++){
        printf("Nhap a[%d]:",i);
        scanf("%f",&a[i]);
    }
   
}
void xuatmang(float a[],int n){
    printf("Cac phan tu da nhap la:\n");
    int i;
    for(i=0;i<n;i++){
        printf("a[%d]= %f\n",i,a[i]);
    }
    
}


int main(int argc, char** argv) {
    float a[100];
    int n;
    int i;
    printf("Nhap n:");
    scanf("%d",&n);
    nhapmang(a,n);
    xuatmang(a,n);
    
    
}

