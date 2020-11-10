#include<stdio.h>
#include<conio.h>
int tinhtong(int a,int b){
	int t;
	t=a+b;
	return(t);
}
main(){
	int a,b;
	printf("Nhap so thu 1:");
	scanf("%d",&a);
	printf("Nhap so thu 2:");
	scanf("%d",&b);
	printf("Tong 2 so:%d\n",tinhtong(a,b));
}
