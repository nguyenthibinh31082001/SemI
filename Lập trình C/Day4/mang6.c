#include<stdio.h>
#include<conio.h>
main(){
	//khai bao mang
	int mang[5][4] = {{0,1,1,0},{0,1,1,0},{0,0,0,0},{0,1,1,0},{0,1,1,0}};
	int i=0,j;
	for(i;i<5;i++){
		for(j=0;j<4;j++){
			if(mang[i][j] == 1){
				printf("    ");
			}else{
				printf("%4d",mang[i][j]);
			}
			
		}
		printf("\n");
	}
}
