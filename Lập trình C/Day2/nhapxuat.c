#include<stdio.h>
#include<conio.h>
main(){
	char name[10];
	int tuoi;
	printf("Nhap ten cua ban:");
	scanf("%s",name);
	printf("Nhap tuoi cua ban : ");
	scanf("%d",&tuoi);
	
	printf("---- THONG TIN CA NHAN----\n");
	printf("Ten cua ban la %s \n",name);
	printf("Tuoi cua ban la %d ",tuoi);
}
