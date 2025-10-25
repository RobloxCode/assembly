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
    printf("%d, is prime: %d\n", 1, is_prime(1));
    printf("%d, is prime: %d\n", 2, is_prime(2));
    printf("%d, is prime: %d\n", 3, is_prime(3));
    printf("%d, is prime: %d\n", 4, is_prime(4));
    return 0;
}
