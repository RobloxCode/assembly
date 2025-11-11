#include <stddef.h>
#include <stdio.h>

void reverse_str(char* str, size_t len) {
    if (!str) {
        return;
    }

    int left_i = 0;
    int right_i = len - 1;
    int cur_i = 0;

    while (left_i < right_i) {
        char cur_val = str[cur_i];
        str[left_i] = str[right_i];
        str[right_i] = cur_val;
        left_i++;
        cur_i++;
        right_i--;
    }
}

void int_to_str(int num, char* out_str) {
    if (!out_str) {
        return;
    }

    int sign = num;
    if (num < 0) {
        num = -num;
    }

    int i = 0;
    if (sign < 0) {
        i = 1;
        out_str[0] = '-';
    }

    while (num > 0) {
        out_str[i] = num % 10 + '0';
        num /= 10;
        i++;
    }

    reverse_str(out_str, i);
}

int main(void) {
    int num = 1234;
    char num_str[10] = {'\0', '2'};
    int_to_str(num, num_str);
    printf("parsed: %s\n", num_str);
    return 0;
}
