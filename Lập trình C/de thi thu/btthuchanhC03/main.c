/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: Admin
 *
 * Created on September 20, 2019, 10:37 AM
 */

#include <stdio.h>
#include <stdlib.h>

int songuyento(int x){
    int i,tg;
    int a[50];
    if(x<2){
        printf("Ban phai nhap solon hon %d",x);
    }else{
        for(i=2;i<x;i++){
            if(x%a[i]==0){
                printf("Phan tu %d la so nguyen to\n",a[i]);
            }else{
                printf("Phan tu %d khong la so nguyen to\n",a[i]);
            }
        }
    }
}
int main(int argc, char** argv){
    int chon,n,i,x;
    int a[50];
    book:
        printf("1.Khai bao so phan tu cua mang 1 chieu va nhap so phan tu mang\n");
        printf("2.In ra gia tri vua nhap \n");
        printf("3.In ra phan tu mang la so nguyen to\n");
        printf("4.In cac phan tu mang chia het cho 3 va 4\n");
        printf("5.Sap xeo mang tang dan\n");
        printf("6.Ghi mang dax sap xep vao file coten la demo.txt\n");
        printf("7.Thoat\n");
        printf("Lua chon cua ban:");
        scanf("%d",&chon);
        switch(chon){
            case 1:
                printf("Nhap vao so phan tu mang:");
                scanf("%d",&n);
                for(i=0;i<n;i++){
                    printf("So phan tu mang a[%d]:",i);
                    scanf("%d",&a[i]);
                }
                goto book;
                break;
            case 2:
                for(i=0;i<n;i++){
                    printf("\ta[%d]=%d\n",i,a[i]);
                }
                goto book;
                break;
            case 3:
                printf("\tCac phan tu la so nguyen to cua mang la:\n");
                songuyento(x);
                goto book;
                break;
            case 4:
                for(i=0;i<n;i++){
                    if(a[i]%3==0&&a[i]%4==0){
                        printf("\t%d la so chia het cho 3 va 4\n",a[i]);
                    }
                }
                goto book;
                break;
        }
}

