#include <iostream.h>

extern "C" void map(float * array, int size, float (* func) (float));

float f(float x) {
    return x * x;
}

float g(float x) {
    return x - 1;
}

int main(void) {
    float a[] = {3.2f, 9.6f, -4.2f, 0.0f, -1.0f};
    int n = 5;
    int i;

    for (i = 0; i < n; i++) {
        cout << a[i] << "\t";
    }
    cout << endl;

    map(a, n, &f);

    for (i = 0; i < n; i++) {
        cout << a[i] << "\t";
    }
    cout << endl;

    map(a, n, &g);

    for (i = 0; i < n; i++) {
        cout << a[i] << "\t";
    }
    cout << endl;

    return 0;
}