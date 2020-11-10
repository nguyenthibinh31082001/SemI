/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: Admin
 *
 * Created on September 17, 2019, 10:33 AM
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * 
 */
int main(int argc, char** argv) {
    int luachon,a,b,i,j;
    int mang[100][100],tong=0;
    book:
        printf("1.Nhap vao mang 2 chieu\n");
        printf("2.In ra danh sach mang vua nhap vao\n");
        printf("3.In ra ma tran vuong\n");
        printf("4.Tim so le trong mang\n");
        printf("5.In ra uong cheo chinh cua mang,tinh tong duong cheo chinh\n");
        printf("6.Thoat\n");
        printf("Nhap lua chon cua ban:");
        scanf("%d",&luachon);
    switch(luachon){
        case 1:
            printf("Nhap vao hang a:");
            scanf("%d",&a);
            printf("Nhap vao cot b:");
            scanf("%d",&b);
            for(i=0;i<a;i++){
                for(j=0;j<b;j++){
                    printf("nhap gia tri cua mang [%d][%d]= ",i,j);
                    scanf("%d",&mang[i][j]);
                }
            }
            goto book;
            break;
        case 2:       
           for(i=0;i<a;i++){
               for(j=0;j<b;j++){
           }
               printf("Danh sach vua nhap:[%d][%d]= %d",i,j,mang[i][j]);
               
    }
           goto book;
           break;
        case 3:
            for(i=0;i<a;i++){
                for(j=0;j<b;j++){
                        printf("%d\t",mang[i][j]);

                    }
                printf("\n");
            }
            goto book;
            break;
        case 4:
            for(i=0;i<a;i++){
                for(j=0;j<b;j++){
                    if(mang[i][j]%2!=0){
                        printf("Cac so le cua mang la:%d\n",mang[i][j]);
                    }
                }
            }
            goto book;
                break;
        case 5:
            for(i=0;i<a;i++){
                for(j=0;j<b;j++){
                    if(i==j){
                        printf("%d\t",mang[i][j]);
                        tong=tong+mang[i][j];
                    }
                }
            }
            printf("Tong duong cheo chinh bang=%d\n",tong);
            goto book;
            break;
        case 6:
            printf("Thoat chuong trinh");
            exit(0);
            break;
        default:
            printf("Chon lai so tu 1-6");
                    
}
}


