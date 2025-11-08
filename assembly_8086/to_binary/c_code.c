#include <stddef.h>
#include <stdio.h>

/* PARAMS
 * src: number to convert to binary
 * out_buffer: buffer for result
 * out_size: size of the char* out
 *
 * RETURN
 * 0: success
 * 1: wrong pointer
 * 2: wrong out_buff size
 */
int to_binary(int src, char* out_buff, size_t out_size) {
    if (!out_buff) {
        return 1;
    }

    if (out_size % 8 != 0) {
        return 2;
    }

    for (int i = 16; i >= 0; --i) {
        out_buff[i] = (src % 2) + '0';
        src /= 2;
    }

    return 0;
}

void display_ascii_vals(char* s, size_t s_len) {
    if (!s) {
        return;
    }

    for (size_t i = 0; i < s_len; ++i) {
        printf("%d ", s[i]);
    }
}

int main(void) {
    const size_t BITS = 16;
    char buffer[BITS];
    int src = 10;

    if ((to_binary(src, buffer, BITS)) != 0) {
        return 1;
    }

    puts(buffer);
    display_ascii_vals("abc", 3);

    return 0;
}

