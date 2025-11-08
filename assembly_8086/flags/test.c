#include <stdio.h>

int main(void) {
    int x = 13;                 // 00001101
    int y = 20;                 // 00010100

    int and_x_y = x & y;        // 00000100
    printf("%d\n", and_x_y);

    int or_x_y = x | y;         // 00011101
    printf("%d\n", or_x_y);

    int xor_x_y = x ^ y;        // 00011001
    printf("%d\n", xor_x_y);

                                // 00001101
    int xor_x_x = x ^ x;        // 00001101
                                // 00000000

    printf("%d\n", xor_x_x);

    int not_x = ~x;             // 11110010

    int z = 13;
    printf("~x = %d\n", ~z);   // flips bits only
    printf("-x = %d\n", -z);   // two’s complement (invert + 1)

    return 0;
}

