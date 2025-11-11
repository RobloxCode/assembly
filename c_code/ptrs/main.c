#include <stdio.h>

int main(void) {
    int var = 1;
    int* var_ptr = &var;

    printf("%d\n", var);
    *var_ptr = 2;
    printf("%d\n", var);

    return 0;
}

