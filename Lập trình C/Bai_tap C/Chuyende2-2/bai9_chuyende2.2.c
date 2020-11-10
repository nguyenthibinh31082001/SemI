#include<stdio.h>
#include<conio.h>
main(){
	int i;
	printf("In ra so le nho hon 100:");
	for(i=1;i<100;i+=2){
		if((i==5)||(i==7)||(i==93))
		continue;
		printf("%5d",i);
	}
	getch();
}
