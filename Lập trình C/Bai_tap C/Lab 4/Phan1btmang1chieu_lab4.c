/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: Admin
 *
 * Created on September 14, 2019, 7:08 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include<math.h>
int max_size=100;
int nhapmang(int a[],int n){
    int i;
    printf("Nhap so phan tu cua mang:\n");
    scanf("%d",&n);
    
    for(i=0;i<n;i++){
        printf("Nhap a[%d]= ",i);
        scanf("%d",&a[i]);
    }
}
    int xuatmang(int a[  ],int n){
        int i;
    printf("1.Mang da nhap:\n");
    for(i=0;i<n;i++){
        printf("%d\t",a[i]);
    }
    }
    int sumeven(int a[],int n){
        int sum=0;
    for( int i=0;i<n;i++){
        if(a[i]%2!=0){
            continue;
        }
        sum+=a[i];
    }
     return sum;   
    }
    int sole(int a[],int n){
        int i;
        for(i=0;i<n;i++){
            if(a[i]%2!=0){ 
                printf("Cac so le:%d\n",a[i]);
        }
           
    }
        
    }
    int max(int a[],int n){
        int i;
        int max=a[0];
        for(i=1;i<n;i++){
            if(max<a[i]){
                max=a[i];
            }
        }
        return max;
    }
    float TBC(int a[],int n){
        int tong=0; int i,tb;
        float s=0;
        for(i=0;i<n;i++){
            s+=a[i];
        }
        tb=s/n;
        return tb;
    }
    int binhphuong(int a[],int n){
        int i,s=0;
        for(int i=0;i<n;i++){
            s+=a[i]*a[i];
        }
        return s;
    }
    int chiahet(int a[],int n){
        int i;
        for(i=0;i<n;i++){
            if(a[i]%3==0&&a[i]%4==0){
                printf("Cac so chia het cho 3 va 4:%d",a[i]);
            }
        }
    }
int main(int argc, char** argv) {
    int arr[max_size];
    int n,i;
    
    do{
        printf("So phan tu cua mang n=");
        scanf("%d",&n);
    }while(n<=0||n>max_size);
    nhapmang(arr,n);
    xuatmang(arr,n);
    printf("\nTong so chan=%d\n",sumeven(arr,n));
    printf("\nCac so le trong mang:%d,%d,%d\n",sole(arr,n));
    printf("So lon nhat trong mang la:%d\n",max(arr,n));
    printf("Trung binh cong cua mang=%f\n",TBC(arr,n));
    printf("Tong binh phuong=%d\n",binhphuong(arr,n));
    printf("so %d chia het cho 3 va 4 la:%d\n",chiahet(arr,n));
}
