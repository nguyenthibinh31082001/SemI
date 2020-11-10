#include<stdio.h>
#include<conio.h>
int amduong(int a){
	return(a);
}
main(){
	int a;
	printf("Nhap so a:");
	scanf("%d",&a);
	if(a>0){
		printf("La so duong\n",amduong(a));
	}else{
		printf("La so le\n",amduong(a));
	}
}
