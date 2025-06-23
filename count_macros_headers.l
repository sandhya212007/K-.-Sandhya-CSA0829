%{
#include <stdio.h>
int macro_count = 0;  // To count the number of macros defined
int include_count = 0; // To count the number of header files included
%}

%%

/\#define/ { macro_count++; }   // Whenever we encounter #define, we increment the macro count
/\#include/ { include_count++; } // Whenever we encounter #include, we increment the include count

%%

int main() {
    yylex();  // Start scanning the input
    printf("Number of macros defined: %d\n", macro_count);
    printf("Number of header files included: %d\n", include_count);
    return 0;
}
