#include<stdio.h>
#include<conio.h>
main(){
	int s=0,a,i=1;
	do{
		printf("Nhap so thu %d:",i);
		scanf("%d",&a);
		s+=a;
		i++;
	}while(a!=0);
	printf("\nTong la:%d",s);
}
