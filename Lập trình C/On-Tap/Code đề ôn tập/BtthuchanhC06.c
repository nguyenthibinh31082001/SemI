#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdlib.h>
struct Student{
    char Ma_sv[10];
    char Ten_sv[100];
    char Dien_thoai[20];
};
struct Student sv[100];
int menu=0,n,i;
FILE *fp;
int main(int argc, char** argv) {
    do{
        printf("1.Khai bao so phan tu mng 1 chieu va nhap thong tin cho phan tu\n");
        printf("2.In thong tin vua nhap\n");
        printf("3.Ghi thong tin vao file Student.txxt\n");
        printf("4.Thoat\n");
        if(menu==0){
            printf("Moi ban chon:");
            scanf("%d",&menu);
            while(menu!=1){
                printf("Moi ban chon 1 de bat dau:");
                scanf("%d",&menu);
            }
        }else{
            printf("Lua chon tiep theo cua ban la:");
            scanf("%d",&menu);
        }
        switch(menu){
            case 1:
               printf("Nhap so luong sv:");
               scanf("%d",&n);
               for(i=0;i<n;i++){
                   printf("Student %d:\n",i+1);
                   printf("\tMa:");
                   scanf("%s",&sv[i].Ma_sv);
                   printf("\tTen:");
                   scanf("%s",&sv[i].Ten_sv);
                   printf("\tDien thoai:");
                   scanf("%s",&sv[i].Dien_thoai);
               }
               break;
            case 2:
                printf("THONG TIN SV DA NHAP:\n");
                for(i=0;i<n;i++){
                printf("Student %d:\n",i+1);
                printf("\tMa:%s,Ten:%s,Dien thoai:%s\n",sv[i].Ma_sv,sv[i].Ten_sv,sv[i].Dien_thoai);               
        }
                break;
            case 3:
               fp=fopen("Student.txxt","w+");
               for(i=0;i<n;i++){
                   fprintf(fp,"Ma:%5s,Ten:%10s,Dien thoai:%15s",sv[i].Ma_sv,sv[i].Ten_sv,sv[i].Dien_thoai);
               }
               break;
            case 4:
                exit(0);
            default:
                printf("Moi ban chon tu 1 den 4:");
    }       
}while(1==1);
getch();
}

 
    


