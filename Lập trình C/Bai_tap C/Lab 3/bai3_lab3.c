#include<stdio.h>
#include<conio.h>
main(){
	int i=1;
	for(i;i<=36;i++){
		if(i*2+((36-i)*4)==100){
			printf("ga %d-cho %d",i,i*2,((37-i)*4));
		}
	}
}
