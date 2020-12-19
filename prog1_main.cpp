/*
 * File: prog1_main.cpp
 * (C) 2002 Ariel Ortiz, ITESM CEM
 * First Example on assembly language programming.
 * This is the C++ language module.
 */

#include <iostream.h>

extern "C" void test(void);

int main(void) {
    test();
    cout << "End of program" << endl;
    return 0;
}