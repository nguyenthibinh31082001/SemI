#include<stdio.h>
#include<conio.h>
main(){
	int n,i;
	float s=0;
	do{
		printf("\nNhap n>0:");
		scanf("%d",&n);
	}
	while (n<=0);
	for(i=1;i<=n;i++){
		s+=1/(float)i;
	}
	printf("\n ket qua =%f",s);
	getch();
}
