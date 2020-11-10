#include <stdio.h>
#include <conio.h>
main(){	
	int a,b,c,d;
	printf("Nhap so duong 3 chu so:");
	scanf("%d",&a);
	b=a/100;
	c=a%100/10;
	d=a%10;
    printf("Chu so hang tram:%d\n",b);
    printf("Chu so hang chuc:%d\n",c);
    printf("Chu so hang don vi:%d\n",d);
}
