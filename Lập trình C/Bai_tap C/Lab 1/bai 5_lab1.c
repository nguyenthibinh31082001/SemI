#include <stdio.h>
#include <conio.h>
main(){
	float r,s,v;
	printf("Nhap ban kinh r:");
	scanf("%f",&r);
	s=4*3.14*r*r;
	v=(4/3)*3.14*r*r*r;
	printf("Dien tich hinh cau la:%f\n",s);
	printf("The tichhinh cau la:%f",v);
	getch();
}
