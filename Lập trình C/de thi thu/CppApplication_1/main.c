/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: Admin
 *
 * Created on September 19, 2019, 6:53 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdlib.h>
struct Student{
    int ID;
    char name[50];
    char phone[20];
};
int main(){
    int chon,n=0,i=0;
    struct Student st1, infoStudent[100];
    book:
        printf("\n=====MENU CHUONGTRINH======\n");
        printf("1.Nhap so luong sv va thong tin sv\n");
        printf("2.Hien thi thong tin cac sv vua nhap\n");
        printf("3.Ghithong tin sinh vien vao file\n");
        printf("4.Thoat\n");
        printf("Moi ban chon:");
        scanf("%d",&chon);
        switch(chon){
            case 1:
                printf("Nhap so luong sv:");
                scanf("%d",&n);
                printf("THONG TIN SV\n");
                for(i=0;i<n;i++){
                #define st infoStudent[i]
                    printf("\tNhap thong tin sv:%d\n",i+1);
                    printf("\tID %d\n",i+1);
                    printf("\tname:\n");
                    gets(infoStudent[i].name);
                    printf("\tphone:\n");
                    gets(infoStudent[i].phone);
                    fflush(stdin);
                }
                goto book;
                break;
//            case 2:
//                printf("THONG TIN DA NHAP LA");
                
        }
}

