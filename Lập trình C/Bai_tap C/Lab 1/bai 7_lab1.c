#include <stdio.h>
#include <conio.h>
main(){
	int a,b,c;
    printf("Nhap so nguyen a:");
	scanf("%d",&a);
	printf("Nhap so nguyen b:");
	scanf("%d",&b);
	printf("Hai so vua nhap la a=%d va b=%d\n",a,b);
	printf("Doi gia tri 2 so\n");
	c=a;
    b=a;
    b=c;
    printf("Hai so sau khi doi gia tri a=%d va b=%d",a,b);
    getch();
}
