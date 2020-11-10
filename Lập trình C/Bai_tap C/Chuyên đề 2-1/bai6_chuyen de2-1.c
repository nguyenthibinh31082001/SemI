#include <stdio.h>
#include <conio.h>
main() {
	int a,b,c,t,chon;
	printf("Nhap so thu 1:");
	scanf("%d",&a);
	printf("Nhap so thu 2:");
	scanf("%d",&b);
	printf("Nhap so thu 3:");
	scanf("%d",&c);
	printf("1.Tim so lon nhat nho nhat:\n");
	printf("2.Tinh tong 3 so va kiem tra xem tong do la chan hay le:\n");
	printf("3.Tim so chia het cho 3 va 5\n");
	printf("nhap vao lua chon cua ban:");
	scanf("%d",&chon);
	switch(chon){
case 1:
	if(a>b&&b>c){
		printf("So %d la so lon nhat\n",a);
	} else if(b>a&&a>c){
		printf("So %d la so nho nhat\n",b);
	} else {
		printf("So %d la so lon nhat\n",c);
}
break;
case 2:
t=a+b+c;
printf("Tong la:%d\n",t);
if(t%2==0){
	printf("Tong la so chan\n");
} else {
	printf("Tong la so le\n");
}
break;
default:
if(a%3==0||a%5==0){
	printf("a chia het cho 3 va 5\n",a);
} else{ printf("a khong chia het cho 3va 5\n");
}
if(b%3==0||b%5==0){
	printf("b chia het cho 3 va 5\n",b);
} else{ printf("b khong chia het cho 3va 5\n");
}
if(c%3==0||c%5==0){
	printf("c chia het cho 3 va 5\n",c);
} else{ printf("c khong chia het cho 3va 5\n");
}
break;
}
}
