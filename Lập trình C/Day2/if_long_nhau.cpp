#include<stdio.h>
main(){
	int x;
	printf("Nhap vao so x:");
	scanf("%d",&x);
	if(x==1){
		printf("Nhap vao so tu 1-5");
		int y;
		scanf("%d",&y);
		if(y<=5){
			printf("Ban vua nhap vao so %d",y);
		}else{
			printf("Ban nhap sai cmnr");
		}
	}else{
		printf("Ban nhap khong phai so bang 1");
	}
}
