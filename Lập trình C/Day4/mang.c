#include<stdio.h>
#include<conio.h>
main(){
	//khai bao mang co 10 phan tu;
	int mangA[5] ;
	int a;
	mangA[0] =  2;//1
	mangA[1] =  6;//2
	mangA[2] =  8;//3
	mangA[3] =  22;//4
	mangA[4] =  21;//5
	
	printf("Gia cua phan tu mang thu 3 la %d",mangA[0]);
	
	printf("\n Danh sach cac gia tri trong mang");
	for(a=0;a<5;a++){
		printf("Phan tu mang thu %d la %d \n",a,mangA[a]);
	}
}
