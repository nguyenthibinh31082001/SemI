/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: Admin
 *
 * Created on September 22, 2019, 8:25 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdlib.h>
struct book{
    int Ma_sach;
    char Ten_sach[100];
    char Tac_gia[100];
}; 
struct book bk[100];
FILE *fp;
int main(int argc, char** argv) {
    int chon,n,i;
    luachon:
    printf("1.Khai bao so phan tu mang 1 chieuvanhap thongn tin cho tung phan tu\n");
    printf("2.In thong tin vua nhap\n");
    printf("3.Ghi thong tin vao file co ten book.txxt\n");
    printf("4.Thoat\n");
    printf("Lua chon cua ban:");
    scanf("%d",&chon);
    switch(chon){
        case 1:
            printf("Nhap so luong book:");
            scanf("%d",&n);
            for(i=0;i<n;i++){
                printf("Ma %d\n",i+1);
                printf("\tTen:");
                scanf("%s",&bk[i].Ten_sach);
                printf("\tTac gia:");
                scanf("%s",&bk[i].Tac_gia);
            }
            goto luachon;
            break;
        case 2:
            printf("THONG TIN CAC BOOK VUA NHAP\n");
            for(i=0;i<n;i++){
                printf("Book:%d\n",i+1);
                printf("\tMa:%d,Ten:%s,Tacgia:%s\n",i+1,bk[i].Ten_sach,bk[i].Tac_gia);
            }
            goto luachon;
            break;
        case 3:
            fp=fopen("book.txxt","w+");
            for(i=0;i<n;i++){
                fprintf(fp,"\tMa:%5d,Ten:%10s,Tacgia:%20s\n",i+1,bk[i].Ten_sach,bk[i].Tac_gia);
            }
            goto luachon;
            break;
        case 4:
            printf("Thoat");
            exit(0);
    }
    
}

