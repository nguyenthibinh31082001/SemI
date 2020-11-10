#include <stdio.h>
#include <conio.h>
main(){
	int a,b,t;
	printf("Nhap so nguyen duong thu 1:");
	scanf("%d",&a);
	printf("Nhap so nguyen duong thu 2:");
	scanf("%d",&b);
	t=a+b;
	if(t/2==0){
		printf("Tong la so chan",t);
	} else{
		printf("Tong la so le",t);
	}
}
