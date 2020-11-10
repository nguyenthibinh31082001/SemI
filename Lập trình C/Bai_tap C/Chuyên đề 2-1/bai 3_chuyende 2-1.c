#include <stdio.h>
#include <conio.h>
main(){
	int th,n,x;
	printf("Nhap thang:");
	scanf("%d",&th);
	printf("Nhap nam:");
	scanf("%d",&n);
	x=n%4;
		switch(th){
			case1:
			case3:
			case5:
			case7:
			case8:
			case10:
			case12:{
				printf("Thang %2d/%4d co 31 ngay",th,n);
				break;
			}
			case4:
			case6:
			case9:
			case11:{
				printf("Thang %2d/%4d co 30 ngay",th,n);
				break;
			}
			if(th==2){
				if(x==0){
					printf("Thng 2 /%4d co 29 ngay",n);
				}
		        if(x!=0){
		        	printf("Thang 2/%4d co 28 ngay",n);
				}	
			}
		}
	}

