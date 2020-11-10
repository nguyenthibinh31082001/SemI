#include<stdio.h>
#include<conio.h>
main(){
	int ngay;
	printf("Nhap vao ngay bat ky tu 1-6 : ");
	scanf("%d",&ngay);
	switch(ngay){
		case 1:
			printf("Hom nay la thu hight");
			break;
		case 2:
			printf("hom nay la thu Bar");
			break;
		case 3:
			printf("Hom nay la thu 4");
			break;
		case 4:
			printf("Hom nay la thu nam");
			break;
		case 5:
			printf("Hom nay la thu six");
			break;
		case 6:
			printf("Hom nay la thu seven");
			break;
		default:
			printf("Nhau thoi");
			break;
	}
}
