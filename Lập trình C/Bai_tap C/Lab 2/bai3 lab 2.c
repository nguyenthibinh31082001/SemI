#include <stdio.h>

main(){
	int a,b,c;
	printf("Nhap canh a:");
	scanf("%d",&a);
	printf("Nhap canh b:");
	scanf("%d",&b);
	printf("Nhap canh c:");
	scanf("%d",&c);
	if(a==b&&b==c){
		printf("La tam giac deu");
	} else if(a==b||b==c||c==a){
		printf("La tam giac can");
	} else if(a*a+b*b==c*c||a*a+c*c==b*b||b*b+c*c==a*a){
		printf("La tam giac vuong");
	} else {
		printf("La tam giac thuong");
	}
}
