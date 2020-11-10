#include <stdio.h>'
#include <conio.h>
main(){
	int a,b,c,d;
	printf("Nhap ngay sinh:");
	scanf("%d",&a);
	printf("Nhap thang sinh:");
	scanf("%d",&b);
	printf("Nhap nam sinh:");
	scanf("%d",&c);
	printf("toi sinh vao ngay: %2d/%2d/%4d",a,b,c);
	printf("Nhap nam hien tai:");
	scanf("%d",&d);
    printf("Nam nay ban %d tuoi",d-c);	
}





