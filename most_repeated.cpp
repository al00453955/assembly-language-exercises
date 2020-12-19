#include <iostream.h>

extern "C" int* arrayptr;
extern "C" int size;
extern "C" int result;
extern "C" void most_repeated(void);

int main(void) {
    cout << "How many items do you want to input? ";
    cin >> size;
    arrayptr = new int[size];
    for (int i = 0; i < size; i++) {
        cout << "Input item #" << (i + 1) << ": ";
        cin >> arrayptr[i];
    }
    most_repeated();
    cout << "The most repeated item is: " << result << endl;
    delete[] arrayptr;
    return 0;
}
