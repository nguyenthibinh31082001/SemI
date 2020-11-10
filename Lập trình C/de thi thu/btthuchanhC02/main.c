/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: Admin
 *
 * Created on September 20, 2019, 9:06 AM
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * 
 */
int main(int argc, char** argv) {
    int chon,i,j,n=0,m=0,s=0;
    int a[50][50];
    book:
        printf("1.Khai bao so phan tu cuamang 2 chieu ma tran vuong va nhap so phan tu mang\n");
        printf("2.In ra cac gi tri ang vua nhap duoi dang ma tran vuong\n");
        printf("3.In cac phan tu mang tren duong cheo chinh\n");
        printf("4.Tinh tong cac phan tu chan tren duong cheo phu\n");
        printf("5.In ra cac phan tu mang chia het cho 3va6\n");
        printf("6.In mang voi tam giac tren va tam giac duoi\n");
        printf("7.Thoat\n");
        printf("Lua chon cua ban:");
        scanf("%d",&chon);
        switch(chon){
            case 1:
                printf("Nhap vao cot m:");
                scanf("%d",&m);
                printf("Nhap vao hang n:");
                scanf("%d",&n);
                for(i=0;i<m;i++){
                    for(j=0;j<n;j++){
                        printf("Nhap vao gia tri cua mang a[%d][%d]=",i,j);
                        scanf("%d",&a[i][j]);
                    }
                }
                        
                
                goto book;
                break;
            case 2:
                for(i=0;i<m;i++){
                    for(j=0;j<n;j++){
                        if(i==0||j==0||i==(n-1)||j==(n-1)){
                            printf("\t%4d",a[i][j]);
                        }
                    }
                    printf("\n");
                }
                goto book;
                break;
            case 3:
                for(i=0;i<m;i++){
                    for(j=0;j<n;j++){
                        if(i==j){
                            printf("Cac phan tu tren duong cheo chinh la:%d\n",a[i][j]);
                        }
                    }
                }
                goto book;
                break;
            case 4:
                for(i=0;i<m;i++){
                    for(j=0;j<n;j++){
                        if(a[i][j]%2==0&&(i+j)==(n-1)){
                            s+=a[i][j];
                        }
                    }
                }
                printf("Tong phan tu chan tren duong cheo phu:%d\n",s);
                goto book;
                break;
            case 5:
                for(i=0;i<m;i++){
                    for(j=0;j<n;j++){
                        if(a[i][j]%3==0&&a[i][j]%6==0){
                            printf("Cac phan tu chia het cho 3 va 6:%d\n",a[i][j]);
                        }
                    }
                }
            case 6:
                for(i=0;i<m;i++){
                    for(j=0;j<n;j++){
                        if(j==0||j==n||i==j||(i+j)==(n-1)){
                            printf("\t%d",a[i][j]);
                        }else{
                            printf(" ");
                        }
                        printf("\n");
                    }
                }
                goto book;
                break;
            case 7:
                printf("Thoat chuong trinh\n");
                break;
        }
    
}

