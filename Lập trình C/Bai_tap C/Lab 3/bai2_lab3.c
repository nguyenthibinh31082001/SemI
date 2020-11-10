#include<stdio.h>
#include<conio.h>
#include<math.h>
main(){
	int a,b,c,t,tb,chon,max;
	printf("1.Nhap vao 3 so nguyen duong a,b,c\n");
	printf("2.Tinh tong 3 so vua nhap\n");
	printf("3.Tinh trung binh cong 3 so vua nhap\n");
	printf("4.Tim so lon nhat trong 3 so vua nhap\n");
	printf("5.Thoat khoi chuong trinh\n");
	printf("Lua chon cua ban:");
	scanf("%d",&chon);
	switch(chon){
		case 1:
			printf("Nhap so nguyen duong a");
			scanf("%d",&a);
			printf("Nhap so nguyen duong b");
			scanf("%d",&b);
			printf("Nhap so nguyen duong c");
			scanf("%d",&c);
			break;
		case 2:
			printf("Nhap so nguyen duong a");
			scanf("%d",&a);
			printf("Nhap so nguyen duong b");
			scanf("%d",&b);
			printf("Nhap so nguyen duong c");
			scanf("%d",&c);
			t=a+b+c;
			printf("Tong 3 so nguyen duong la:%d",t);
			break;
		case 3:
			printf("Nhap so nguyen duong a");
			scanf("%d",&a);
			printf("Nhap so nguyen duong b");
			scanf("%d",&b);
			printf("Nhap so nguyen duong c");
			scanf("%d",&c);
			tb=(a+b+c)/3;
			printf("Trung binh cong 3 so vua nhap la:%d",tb);
			break;
		case 4:
			printf("Nhap so nguyen duong a");
			scanf("%d",&a);
			printf("Nhap so nguyen duong b");
			scanf("%d",&b);
			printf("Nhap so nguyen duong c");
			scanf("%d",&c);
			a=max;
			if(max<b){
				max=b;
			}else if(max<c){
				max=c;
			}
			printf("\nSo lon nhat la:%d",max);
		default:
		printf("Thoat chuong trinh");
		break;	
	}
}














