#include<stdio.h>
#include<conio.h>
main(){
	int i,j;
	for(i=0;i<=100;i++){
		for(j=0;j<=0;j++){
			if(i*5+j*3+(100-i-j)/3==100){
				printf("%d trau dung- %d trau nam- %d trau gia\n",i,j,(100-i-j));
			}
		}
	}
