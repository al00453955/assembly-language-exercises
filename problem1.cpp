#include <iostream.h>

extern "C" int *arrayptr, size, result;
extern "C" void oddcount(void);

int main(void){

	int array[]= {7,3,2,-1,4};
	arrayptr = array;
	size = 5;
	oddcount();
	cout << result << endl;
	return 0;
}
