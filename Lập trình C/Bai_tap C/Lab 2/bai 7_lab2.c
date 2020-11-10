#include <stdio.h>
#include <conio.h>
main(){
	int a,b,c;
	printf("Nhap gio a:");
	scanf("%d",&a);
	printf("Nhap phut b:");
	scanf("%d",&b);
	printf("Nhap giay c:");
	scanf("%d",&c); 
	if(a>=0&&a<=23){
		printf("Gio %d hop le\n",a);
	} else{
		printf("Gio %d khong hop le\n",a);
	}
	if(b>0&&b<=60){
		printf("Phut %d hop le\n",b);
	} else{
		printf("Phut %d khong hop le\n",b);
	}
	if(c>0&&c<=60){
		printf("Giay %d hop le\n",c);
	} else{
		printf("Giay %d khong hop le\n",c);
	}
}
