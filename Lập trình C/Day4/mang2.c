#include<stdio.h>
#include<conio.h>
main(){
	int i,max = 0,total=0,mang[10];	
	for(i=0;i<=9;i++){
		printf("\nNhap phan tu mang thu %d : ",i+1);
		scanf("%d",&mang[i]);
		if(max < mang[i]){
			max = mang[i];
		}
		total += mang[i];//total =  total + mang[i];
	}
	
	printf("\n max = %d",max);
	printf("\n Total = %d",total);
}
