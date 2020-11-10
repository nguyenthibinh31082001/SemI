#include <stdio.h>
#include <conio.h>
main(){
	int a,b,c,tb;
	printf("Nhap vao diem toan");
	scanf("%d",&a);
	printf("Nhap vao diem ly");
	scanf("%d",&b);
	printf("Nhap vao diem hoa");
	scanf("%d",&c);
	tb=(a+b+c)/3;
	if(tb<=5){
		printf("xep loai yeu can co gang");
	}else if(tb>5&&tb<=6){
		printf("xep loai trung binh");
	}else if(tb>6&&tb<=7){
		printf("xeploai kha");
	}else if(tb>7&&tb<=8){
		printf("xep loai gioi");
	}
	else{
		print("xep loai xuat sac");
	}
}
