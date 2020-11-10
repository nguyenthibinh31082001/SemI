/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: Admin
 *
 * Created on September 20, 2019, 8:38 AM
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * 
 */
int main(int argc, char** argv) {
    int chon,i,n;
    int a[50];
    int max=0,min=999,t=0;
    float tb=0,s=0;
    book:
    printf("1.Khai bao so phan tu cua mang 1 chieu va nhap so phan tu cua mang\n");
    printf("2.In cac gia tri mang vua nhap\n");
    printf("3.In cac phan tu mang la so le\n");
    printf("4.In cac phan tu mang tai vi tri chan\n");
    printf("5.In cac phn tu mang chia het cho 3 va 4\n");
    printf("6.Tim phan tu lon nhat nho nhat \n");
    printf("7.Tinh tong trung binh cac phan tu mang\n");
    printf("8.Thoat\n");
    printf("Lua chon cua ban la:");
    scanf("%d",&chon);
    switch(chon){
        case 1:
            printf("\nNhapvao gia tri cua mang:");
            scanf("%d",&n);
            for(i=0;i<n;i++){
                printf("\tNhap vao gia tri cua mang a[%d]:",i);
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
            for(i=0;i<n;i++){
                if(a[i]%2!=0){
                    printf("\tSo le la:%d\n",a[i]);
                }
            }
            goto book;
            break;
        case 4:
            for(i=0;i<n;i++){
                if(i%2==0){
                    printf("\tPhan tu mang o vi tri chan la:%d\n",a[i]);
                }
            }
            goto book;
            break;
        case 5:
            for(i=0;i<n;i++){
                if(a[i]%3==0||a[i]%4==0){
                    s+=a[i];
                }
            }
            printf("\tPhan tu chia het cho 3 va 4 la:%f\n",s);
            goto book;
            break;
        case 6:
            for(i=0;i<n;i++){
                if(max<a[i]){
                    max=a[i];
                }
            }
            printf("\tPhan tu lon nhat trong mang la:%d\n",max);
            for(i=0;i<n;i++){
                if(min>a[i]){
                    min=a[i];
                }
            }
            printf("\tPhan tu nho nhat trong mang la:%d\n",min);
            goto book;
            break;
        case 7:
            for(i=0;i<n;i++){
                t+=a[i];
            }
            tb=t/i;
            printf("\tTong rung binhcac phan tu cua mang la:%f\n",tb);
            goto book;
            break;
        case 8:
            printf("Thoat chuong trinh\n");
            break;
    }
}

