#include <stddef.h>
#include <stdio.h>
#include <string.h>
#define LEN_IN_BITS 8

void init_byte_and_bit_size(const size_t data_size, size_t* byte_count, size_t* bit_count);
void display_size_info(const char* datatype, size_t byte_count, size_t bit_count);

int main(int argc, char** argv) {
    if (argc != 2) {
        printf("USAGE:\n./num_bytes some_datatype\nMAKE SURE TO USE LOWER CASE LETTERS\n");
        return 1;
    }

    size_t byte_count = 0;
    size_t bit_count = 0;
    char* datatype = argv[1];

    if (strcmp(datatype, "all") == 0) {
        init_byte_and_bit_size(sizeof(int), &byte_count, &bit_count);
        display_size_info("int", byte_count, bit_count);

        init_byte_and_bit_size(sizeof(short), &byte_count, &bit_count);
        display_size_info("short", byte_count, bit_count);

        init_byte_and_bit_size(sizeof(float), &byte_count, &bit_count);
        display_size_info("float", byte_count, bit_count);

        init_byte_and_bit_size(sizeof(double), &byte_count, &bit_count);
        display_size_info("double", byte_count, bit_count);

        init_byte_and_bit_size(sizeof(char), &byte_count, &bit_count);
        display_size_info("char", byte_count, bit_count);
    }
    else if(strcmp(datatype, "int") == 0) byte_count = sizeof(int);
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

void init_byte_and_bit_size(const size_t data_size, size_t* byte_count, size_t* bit_count) {
    *byte_count = data_size;
    *bit_count = (*byte_count) * LEN_IN_BITS;
}

void display_size_info(const char* datatype, size_t byte_count, size_t bit_count) {
    if (datatype == NULL) return;
    printf("%s\nbytes: %zu, bits: %zu\n\n",datatype, byte_count, bit_count);
}

