#include<stdio.h>
#include<conio.h>
#include<math.h>
main(){
	int a,b,max,min;
	printf("Nhap so nguyen a:");
	scanf("%d",a);
	max=a%10;
	min=a%10;
	while(a>0){
		b=a%10;
		printf("%d\n",b);
		a=a/10;
		if(b>max){
			max=b;
		}
}
	printf("\nChu so lon nhat la:%d",max);
	while(a>0){
		b=a%10;
		a=a/10;
		if(b<min){
			min=b;
		}
		}
		printf("\nChu so be nhat la:%d",min);
		getch();
	}

