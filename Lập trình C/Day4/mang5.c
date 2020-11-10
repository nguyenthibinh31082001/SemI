#include<stdio.h>
#include<conio.h>
main(){
	char s1[5]="hello";	
	char s2[7]="VietNam";
	
	printf("Chuoi s1 : %s \n",s1);
	printf("Chuoi s2 : %s \n",s2);
	//copy gia tri s2 vao s1
	strcpy(s1,s2);
	printf("Chuoi s1 : %s \n",s1);
	
}
