#include <stdio.h>
#include <conio.h>
main(){
	int a;
	printf("Nhap vao so nguyen duong a:");
	scanf("%d",&a);
	if(a%2==0){
		printf("So %d la so chan\n",a);
	} else{
		printf("So %d la so le\n",a);
	}
	if(a%3==0&&5==0){
		printf("So %d chia het cho 3 va 5\n",a);
	} else{
		printf("So %d khong chia het cho 3 va 5\n",a);
	}	
}
