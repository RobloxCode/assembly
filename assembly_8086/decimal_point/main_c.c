#include <stdio.h>

float _get_circle_area(int radius) {
    return radius * radius * 3.141592;
}

void _get_circle_area_no_fl(int radius, int* res_out, int* rem) {
    *res_out = radius * radius * 22;
    *res_out /= 7;
    *rem = (radius * radius * 22) % 7;
}

int main(void) {
    int radius = 12;

    printf("area: %.2f\n", _get_circle_area(radius));

    // without using float

    int area = 0;
    int rem = 0;

    _get_circle_area_no_fl(radius, &area, &rem);
    printf("area: %d.%d\n", area, rem);

    return 0;
}
