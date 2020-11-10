#include <stdio.h>
#include <conio.h>
main(){
	int a,b,t;
	printf("Nhap so a:");
	scanf("%d",&a);
	printf("Nhap so b:");
	scanf("%d",&b);
	t=a+b;
	if(t%2==0){
		printf("So %d la so chan",t);
	}else{
		printf("so %d la so le",t);
	}
	getch();
}
