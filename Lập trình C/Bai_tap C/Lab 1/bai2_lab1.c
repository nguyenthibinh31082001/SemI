#include <stdio.h>
#include <conio.h>
main(){
	int a,b,s,p;
	printf("Nhap chieu dai a=");
	scanf("%d",&a);
	printf("Nhap chieu rong b=");
	scanf("%d",&b);
	s=a*b;
	p=(a+b)*2;
	printf("Dien tich la:%d",s);
	printf("Chu vi la:%d\n",p);
	getch();
}
