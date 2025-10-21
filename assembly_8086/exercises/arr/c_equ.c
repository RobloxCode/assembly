#include <stddef.h>
#include <stdint.h>
#include <stdio.h>

void print_int_arr(const int* arr, const size_t size) {
    if (!arr) return;

    for (size_t i = 0; i < size; ++i) {
        printf("%d ", arr[i]);
    }

    printf("\n");
}

int sum_int_arr(const int* arr, const size_t size) {
    if (!arr) return INT16_MIN;

    int total = 0;
    for (size_t i = 0; i < size; ++i) {
        total += arr[i];
    }

    return total;
}

int main(void) {
    size_t size = 5;
    int arr[size];
    arr[0] = 1;
    arr[1] = 2;
    arr[2] = 3;
    arr[3] = 4;
    arr[4] = 5;

    print_int_arr(arr, size);
    printf("sum: %d\n", sum_int_arr(arr, size));

    return 0;
}
