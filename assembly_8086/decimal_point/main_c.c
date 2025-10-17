#include <stdio.h>

float div(int num1, int num2) {
    return (float)num1 / (float)num2;
}

void div_int(int num1, int num2, int* res, int* dec_part) {
    *res = num1 / num2;
    *dec_part = num1 % num2;
}

int main(void) {
    int num1 = 4;
    int num2 = 3;

    printf("%d / %d = %.2f\n", num1, num2, div(num1, num2));

    int res = 0;
    int dec_part = 0;
    div_int(num1, num2, &res, &dec_part);
    printf("%d / %d = %d.%d\n", num1, num2, res, dec_part);

    printf("%d", 4 % 3);

    return 0;
}
