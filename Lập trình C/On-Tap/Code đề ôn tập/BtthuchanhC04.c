/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: Admin
 *
 * Created on September 22, 2019, 7:06 PM
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * 
 */
int main(int argc, char** argv) {
    FILE *f;
    int chon,i=0,j=0,m,n;
    int a[50][50];
    book:
        printf("1.Khaibao so phan tu mang 2 chieu ma tran vuong va nhap so phn tu mang\n");
        printf("2.In cac phan tu mang tren duong cheo chinh, cheo phu\n");
        printf("3.In cac phan tu mang chia het cho 3 va 4\n");
        printf("4.In cac phan tu tren bien duoi dang ma tran vuong\n");
        printf("5.Ghi mang voi cac phan tu tren bien duoi dang ma tran vuong vao file\n");
        printf("6.Thoat\n");
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
                          printf("Nhap so phan tu cua mang a[%d][%d]=",i,j);
                          scanf("%d",&a[i][j]);
                     }        
                 }
                 goto book;
                 break;
            case 2:
               for(i=0;i<m;i++){
                   for(j=0;j<n;j++){
                       if(i==j){
                            printf("Cac phan tu tren duong cheo chinh:%d\n",a[i][j]);
                       }
                   }
               }
                   for(i=0;i<m;i++){
                       for(j=0;j<n;j++){
                           if(i+j==n-1){
                                printf("Cac phan tu tren duong cheo phu:%d\n",a[i][j]);
                           }
                       }
                   }
               goto book;
               break;
            case 3:
                for(i=0;i<m;i++){
                    for(j=0;j<n;j++){
                        if(a[i][j]%3==0&&a[i][j]%4==0){
                             printf("Cac phan tu chia het cho 3 va 4:%d\n",a[i][j]);
                        }
                    }
                }
                goto book;
                break;
            case 4:
                for(i=0;i<m;i++){
                    for(j=0;j<n;j++){
                         printf("%4d",a[i][j]);
                    }
                     printf("\n");
                }              
                     goto book;
                     break;
            case 5:
                f=fopen("demo.txt","wt");
                fprintf(f,"%d",n);
                for(i=0;i<m;i++){
                    for(j=0;j<n;j++){
                        fprintf(f,"%4d",a[i][j]);
                        fclose(f);
                    }
                }
                     printf("Ket qua doc file:\n");
                     for(i=0;i<m;i++){
                         for(j=0;j<n;j++){
                             printf("%3d\n",a[i][j]);
                         }
                     }
                     goto book;
                     break;
        }
}

