#include <iostream.h>

extern "C" int value, result;
extern "C" void bitcount(void);


int main(void) {
	value = 2647;
    bitcount();
    cout << result << endl;
    return 0;
}