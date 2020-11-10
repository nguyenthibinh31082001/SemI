#include <stdio.h>
#include <conio.h>
main(){
	int a,b,t,h,n,ch;
	printf("Nhap vao so a:");
	scanf("%d",&a);
	printf("Nhap vao so b:");
	scanf("%d",&b);
	t=a+b;
	h=a-b;
	n=a*b;
	ch=a/b;
	printf("Tong bang:%d",t);
	printf("Hieu bang:%d",h);
	printf("Tich bang:%d",n);
	printf("Thuong bang:%d",ch);
	getch();
}
