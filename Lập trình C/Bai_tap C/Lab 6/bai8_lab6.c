#include <stdio.h>
#include <stdlib.h>
int nhapso(int n){
	switch(n){
		case 1:
			printf("So mot\n");
			break;
		case 2:
			printf("So hai\n");
			break;
		case 3:
			printf("So ba\n");
			break;
	    case 4:
			printf("So bon\n");
			break;
	    case 5:
			printf("So nam\n");
			break;
		case 6:
			printf("So sau\n");
			break;
		case 7:
			printf("So bay\n");
			break;
		case 8:
			printf("So tam\n");
			break;
		case 9:
			printf("So chin\n");
			break;
		default:
		printf("Nhap sai nhap lai\n");		
	}
	return n;
}
/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
    int n;
	printf("Nhap so n:");
	scanf("%d",&n);
	printf("So %d doc la:%s",n,nhapso(n));
}
