#include <stddef.h>
#include <stdio.h>
#include <string.h>
#define LEN_IN_BITS 8

int main(int argc, char** argv) {
    if (argc != 2) {
        printf("USAGE:\n./num_bytes some_datatype\nMAKE SURE TO USE LOWER CASE LETTERS\n");
        return 1;
    }

    size_t byte_count;
    size_t bit_count;
    char* datatype = argv[1];

    if (strcmp(datatype, "int") == 0) byte_count = sizeof(int);
    else if (strcmp(datatype, "short") == 0) byte_count = sizeof(short);
    else if (strcmp(datatype, "long") == 0) byte_count = sizeof(long);
    else if (strcmp(datatype, "float") == 0) byte_count = sizeof(float);
    else if (strcmp(datatype, "double") == 0) byte_count = sizeof(double);
    else if (strcmp(datatype, "char") == 0) byte_count = sizeof(char);
    else {
        printf("Unknown datatype: %s\n", datatype);
        return 1;
    }

    bit_count = byte_count * LEN_IN_BITS;
    printf("bytes: %zu, bits: %zu\n", byte_count, bit_count);

    return 0;
}

