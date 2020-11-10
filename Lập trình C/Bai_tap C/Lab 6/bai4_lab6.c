#include<stdio.h>
#include<conio.h>
int chiahet(int a){
	return(a);
}
main(){
	int a;
	printf("Nhap so a:");
	scanf("%d",&a);
	if(a%3==0&&a%5==0){
		printf("La so chia het cho 3 va 5\n",chiahet(a));
	}else{
		printf("Khong la so chia het cho 3 va 5",chiahet(a));
	}
}
