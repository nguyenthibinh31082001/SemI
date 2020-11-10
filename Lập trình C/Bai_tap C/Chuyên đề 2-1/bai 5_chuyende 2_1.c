#include <stdio.h>
#include <conio.h>
#include <math.h>
main(){
	int a,b,c,chon,cv,p,s;
	printf("1.Thi nhap 3 canh cua tam giac\n");
	printf("2.In ra man hinh tam giac do la can,vuong,deu\n");
	printf("3.In ra man hinh chu vi, dien tich tam giac\n");
	printf("Lua chon cua ban:");
	scanf("%d",&chon);
	switch(chon){
	case 1:
	printf("Nhap canh a:");
	scanf("%d",&a);
	printf("Nhap canh b:");
	scanf("%d",&b);
	printf("Nhap canh c:");
	scanf("%d",&c);
	break;
	case 2:
		printf("Nhap canh a:");
	scanf("%d",&a);
	printf("Nhap canh b:");
	scanf("%d",&b);
	printf("Nhap canh c:");
	scanf("%d",&c);
		if(a==b&&b==c){
			printf("La tam giac deu");
		}else if(a==b||b==c||c==a){
			printf("la tam giac can");
		}else if(a*a+b*b==c*c||a*a+c*c==b*b||b*b+c*c==a*a){
			printf("la tam giac vuong");
		} else{
			printf("La tam giac thuong");
		}
    break;
    case 3:
    	printf("Nhap canh a:");
	scanf("%d",&a);
	printf("Nhap canh b:");
	scanf("%d",&b);
	printf("Nhap canh c:");
	scanf("%d",&c);
		if(a==b&&b==c){
			printf("La tam giac deu\n");
		}else if(a==b||b==c||c==a){
			printf("la tam giac can\n");
		}else if(a*a+b*b==c*c||a*a+c*c==b*b||b*b+c*c==a*a){
			printf("la tam giac vuong\n");
		} else{
			printf("La tam giac thuong\n");
		}
		cv=a+b+c;
		p=cv/2;
		s=sqrt(p*(p-a)*(p-b)*(p-c));
		printf("Chu vi bang:%d\n",cv);
		printf("Dien tich tam giac bang:%d\n",s);
	break;
}
	
}
