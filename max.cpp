#include <iostream.h>

extern "C" short max(short *v, int n);

short a[] = {
	-16606, -32148,  13337,   5940, -18834,  31240, -29810, -10235,
	 24432,  -7915, -11262,  -8138, -12936,   8711,   2535,  516,
	 17074,   6314,   5626,  27479, -12552,  23563, -15377, -23253,
	 -1484,  26482, -30161,  14036,  28904,  -5585,   6392, -32169,
	-29973, -11657,  27983,  16077,  28425,  15324,  29323, -28953,
	-30534,  17895,   5000,   4296,   -398,  -1048,  -1353,  28139,
	 -9559,  -7402,   9863,  -7970, -23914,  30863,  -6640,  -8280,
	 10480,  -6956, -14409, -26183, -31572,  28315, -32155,  16442
};

int main(void) {
	short m;
	m = max(a, 64);
	cout << m << endl;
	return 0;
}