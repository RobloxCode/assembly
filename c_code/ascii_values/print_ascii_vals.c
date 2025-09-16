#include <stdio.h>

int ascii_to_int(char val) {
    return (int)val;
}

int _exit_program(int status) {
    return status;
}

int main(void) {
    printf("%d\n", ascii_to_int('a'));
    printf("%d\n", ascii_to_int('1'));
    printf("%d\n", ascii_to_int('1') + 1);
    printf("%d\n", '1' + 1);

    return 0;
}

