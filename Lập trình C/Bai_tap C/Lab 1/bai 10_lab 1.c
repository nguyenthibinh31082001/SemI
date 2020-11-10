#include <stdio.h> 
#include <conio.h>
main(){
	int a,b,c,d;
	printf("Nhap so duong co 2 chu so:");
	scanf("%d",&a);
	b=a/10;
	c=a%10;
	d=c*10+b;
	printf("So dao nguoc la:%d",d);
	scanf("%d",&d);
}
