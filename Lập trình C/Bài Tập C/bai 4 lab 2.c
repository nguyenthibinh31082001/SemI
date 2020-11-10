#include <stdio.h>
#include <conio.h>
main(){
	int a,b,c,tt;
	printf("nhap chi so moi a:");
	scanf("%d",&a);
	printf("nhap chi so cu b:");
	scanf("%d",&b);
	printf("chi so moi:\n %d",a);
	printf("chi so cu:\n %d",b);
	c=a-b;

	if(c<=50) tt=c*1000;
	else if(c<=100) tt=50*1000+(c-50)*2000;
	else tt=50*1000+50*2000+(c-100)*3500;
	printf("so tien phai tra:%d",tt)
}
