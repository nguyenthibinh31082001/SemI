#include <stdio.h>
#include <conio.h>
main(){
	int a,b,c;
	printf("So thu nhat");
	scanf("%d",&a);
	printf("So thu hai");
	scanf("%d",&b);
	printf("So thu ba");
	scanf("%d",&c);
	if(a>b&&a>c){
		printf("Thu tu giam dan la %d %d %d %d\n",a,b,c);
	} else if(c>b){
		printf("Thu tu giam dan la %d %d %d %d\n",a,c,b);
	} else{
		printf("Thu tu giam dan la %d %d %d %d\n",a,b,c);
	}
if(b>a&&b>c){
	if(a>c){
		printf("Thu tu giam dan la %d %d %d %d\n",b,a,c);
	} else if(c>a){
		printf("Thu tu giam dan la %d %d %d %d\n",b,c,a);
	} else{
		printf("Thu tu giam dan la %d %d %d %d\n",b,a,c);
	}
}
if(c>a&&c>b){
	if(a>b){
		printf("Thu tu giam dan la %d %d %d %d\n",c,a,b);
	} else if(b>a){
		printf("Thu tu giam dan la %d %d %d %d\n",c,b,a);
	} else{
		printf("Thu tu giam dan la %d %d %d %d\n",c,a,b);
	}
}
if(a<b&&a<c){
	if(b<c){
		printf("Thu tu tang dan la %d %d %d %d\n",a,b,c);
	} else if(c<b){
		printf("Thu tu tang dan la %d %d %d %d\n",a,c,b);
	} else{
		printf("Thu tu tang dan la %d %d %d %d\n",a,b,c);
	}
}
if(b<a&&c<b){
	if(a<c){
		printf("Thu tu tang dan la %d %d %d %d\n",b,a,c);
	} else if(c<a){
		printf("Thu tu tang dan la %d %d %d %d\n",b,c,a);
	} else{
		printf("Thu tu tang dan la %d %d %d %d\n",b,a,c);
	}
}
if(a<c&&c<b){
	if(a<b){
		printf("Thu tu tang dan la %d %d %d %d\n",c,a,b);
	}else if(b<a){
		printf("Thu tu tang dan la %d %d %d %d\n",c,b,a);
	}else{
		printf("Thu tu tang dan la %d %d %d %d\n",c,a,b);
	}
}
}











