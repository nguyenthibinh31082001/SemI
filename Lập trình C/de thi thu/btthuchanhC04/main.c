/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: Admin
 *
 * Created on September 18, 2019, 10:20 AM
 */

#include <stdio.h>
#include <stdlib.h>


void main(int argc, char** argv) {
    int chon,i,j,m,n;
    int a[50][50];
    book:
        printf("1.Khai bao so phan tu cua mang 2 chieu ma tran vuong va nhap so phan tu mang\n");
        printf("2.In ra gia tri mang vua nhap duoi dang ma tran vuong\n");
        printf("3.In cac phan tu mang tren duong cheo chinh\n");
        printf("4.Tinh tong cac phan tu chan tren duong cheo phu\n");
        printf("5.In cac phan tu mang chia het cho 3 va 6\n");
        printf("6.In mang voi cac tamgiac tren, tam giac duoi\n");
        printf("7.Thoat\n");
        printf("Nhap lua chon cua ban:");
        scanf("%d",&chon);
    switch(chon){
        case 1:
            printf("Nhap vao cot n:");
            scanf("%d",&n);
            printf("Nhap vao hang m:");
            scanf("%d",&m);
            for(i=0;i<n;i++){
                for(j=0;j<m;j++){
                    printf("So phan tu da nhap la:[%d][%d]=",i,j);
                    scanf("%d",&a[i][j]);
                    }
                }
            printf("Mang vua nhap la:[%d][%d]",i,j);
            scanf("%d",&a[i][j]);
           goto book;
           break;
        case 2:
            for(i=0;i<n;i++){
                for(j=0;j<m;j++){
                    if(i==0||j==0||i==(n-1)||j==(n-1)){
                        printf("%4d\t",a[i][j]);
                    }else{
                        printf("   ");
                }
            }
                goto book;
                break;
    }
    
}
}

