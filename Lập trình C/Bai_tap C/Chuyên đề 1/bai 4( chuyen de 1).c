#include <stdio.h>
#include <conio.h>
main(){
	int a,b,c;
	printf("Nhap ngay a:");
	scanf("%d",&a);
	printf("Nhap thang b:");
	scanf("%d",&b);
	printf("Nhap nam c:");
	scanf("%d",c);
	printf("Ngay thang vua nhap la:%2d/%2d/%4d",a,b,c);
	printf("(Ngay %d thang %d nam %d)",a,b,c);
}
