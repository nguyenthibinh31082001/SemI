#include<stdio.h>
#include<conio.h>
int sohoanhao(int a){
	int i,t=0;
	printf("Cac uoc cua so %d: ",a);
	for(i=1;i<a;i++){
		if(a%i==0){
			t+=i;
		}
	}
	if(t==a){
		printf("La so hoan hao");
	}else{
		printf("Khong la so hoan hao");
	}
}
main(){
	int i,b,t;
	printf("Nhap so a:");
	scanf("%d",&b);
	sohoanhao(b);
     getch();
}
