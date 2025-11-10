#include <stddef.h>
#include <stdio.h>

size_t get_str_len(char* s) {
    if (!s) {
        return -1;
    }

    size_t len = 0;
    size_t i = 0;
    for (;;) {
        if (s[i] == '\0') {
            return len;
        }
        len++;
        i++;
    }
}

int main(void) {
    char str[] = "Hello";
    size_t str_len = get_str_len(str);
    printf("%s len: %ld\n", str, str_len);
    return 0;
}
