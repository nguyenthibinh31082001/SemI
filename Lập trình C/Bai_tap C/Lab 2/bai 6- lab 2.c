#include <stdio.h>
#include <conio.h>
main(){
	int a,b,c;
	printf("Nhap vao ngay a:");
	scanf("%d",&a);
	printf("Nhap vao thang b:");
	scanf("%d",&b);
	printf("Nhapvao namc:");
	scanf("%d",&c);
	if(a>0&&a<=31){
		printf("Ngay %d hop le\n",a);
	} else{
		printf("Ngay %d khong hop le\n",a);
	}
	if(b>0&&b<=12){
		printf("Thang %d hop le\n",b);
	} else{
		printf("Thang %d khong hop le\n",b);
	}
}
