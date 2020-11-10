#include<stdio.h>
#include<conio.h>
int chanle(int n){
	return(n);
}
main(){
	int n;
	printf("Nhap vao so n:");
	scanf("%d",&n);
	if(n%2==0){
		printf("La so chan\n",chanle(n));
	}else{
		printf("La so le\n",chanle(n));
	}
}
