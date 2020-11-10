#include <stdio.h>
#include <conio.h>
main(){
	int x,t,n;
	printf("Nhap thang:");
	scanf("%d",&t);
	printf("Nhap nam:");
	scanf("%d",&n);
	x=n%4;
	switch(t){
		case1:
		case3:
		case5:
		case7:
		case8:
		case10:
		case12:{
			printf("Thang %2d/%4d co 31 ngay",t,n);
			break;
		}
		case4:
		case6:
		case9:
		case11:{
			printf("Thang %2d/%4d co 30 ngay",t,n);
			break;
		}
	}
}
