#include <stdio.h>
#include <conio.h>
main(){
	int ng,th,n,ngt,ngs;
	printf("Nhap ngay:");
	scanf("%d",ng);
	printf("Nhap thang:");
	scanf("%d",th);
	printf("Nhap nam:");
	scanf("%d",n);
	printf("Ngay thang nam la:%2d/%2d/%4d\n",ng,th,n);
	ngt=ng-1;
	ngs=ng=1;
	printf("Ngay ke tiep truoc la:%d\n",ngt);
	printf("Ngay ke tiep sau la:%d\n",ngs);
}
