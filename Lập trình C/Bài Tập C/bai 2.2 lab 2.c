#include <stdio.h>
#include <conio.h>
main(){
	int a,b,c,tb;
	printf("Nhap diem toan a:");
	scanf("%d",&a);
	printf("Nhap diem ly b:");
	scanf("%d",&b);
	printf("Nhap diem hoa c:");
	scanf("%d",&c);
	tb=(a+b+c)/3;
	if(tb<=5){
		printf("xep loai yeu can co gang");
	} else if(tb<=6){
		printf("xep loai trung binh");
	} else if(tb<=7){
		printf("xep loai kha");
	} else if(tb<=8){
		printf("xep loai gioi");
	} 
	else{
		printf("xep loai xuat sac");
	}
		
	}



