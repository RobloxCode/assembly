#include <stdio.h>

int is_prime(int num) {
    if (num <= 1) {
        return 0;
    }

    for (int i = 2; i * i <= num; ++i) {
        if (num % i == 0) {
            return 0;
        }
    }

    return 1;
}

int main(void) {
    int top_range_num = 0;

    printf("Type a 3 digit number: ");
    scanf("%d", &top_range_num);

    printf("[ ");
    for (int i = 2; i <= top_range_num; ++i) {
        if (is_prime(i)) {
            printf("%d ", i);
        }
    }
    printf("]\n");

    return 0;
}

