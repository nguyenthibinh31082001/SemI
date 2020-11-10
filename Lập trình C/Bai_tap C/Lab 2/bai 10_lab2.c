#include <stdio.h>
#include <conio.h>
main(){
	int l,g,tl;
	printf("Nhap vao so luong co ban:");
	scanf("%d",&l);
	printf("Nhap vao so gio lam:");
	scanf("%d",&g);
	if(g>35){
		tl=1.5*l*g;
		printf("So tien luong la:%d",tl);
	} else{
		tl=l*g;
		printf("So tien luong la:%d",tl);
	}
}

