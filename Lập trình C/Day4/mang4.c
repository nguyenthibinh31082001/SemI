#include<stdio.h>
#include<conio.h>
main(){
	char arr[5];
	int i = 0;
	printf("Nhap vao chuoi :");
	scanf("%s",arr);
	
	printf("\n Choi vua nhap %s \n",arr);
	
	for(i;i<5;i++){
		printf("%d \n",arr[i]);
	}
}
