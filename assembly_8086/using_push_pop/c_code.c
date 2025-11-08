#include <stdio.h>

void print_range_while(int top) {
    int i = 0;
    while (i < top) {
        printf("%d ", i);
        i++;
    }
    printf("\n");
}

void print_range_do_while(int top) {
    int i = 0;
    do {
        printf("%d ", i);
        i++;
    } while (i < top);
    printf("\n");
}

int main(void) {
    print_range_while(9);
    print_range_do_while(9);
    return 0;
}
