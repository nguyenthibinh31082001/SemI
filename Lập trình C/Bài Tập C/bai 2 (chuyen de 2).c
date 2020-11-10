#include <stdio.h>
#include <conio.h>
main(){
	int a,b,c,tb;
	printf("Nhap diem toan a=");
	scanf("%d",&a);
	printf("Nhaap diem ly b=");
	scanf("%d",&b);
	printf("Nhap diem hoa c=");
	scanf("%d",&c);
	tb=(3*a+2*b+c)/6;
	if(tb>8){
		printf("Xep loai GIOI");
}
        else if(tb<8, tb>=6.5){
        	printf("Xep loai KHA");
		}
		else if(tb<6.5,tb>=5){
			printf("Xep loai TB");
		}
else{
	printf("Xep loai YEU");
}
}
