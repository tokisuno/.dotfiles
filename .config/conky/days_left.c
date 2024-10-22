#include <stdio.h>
#include <time.h>
#include <math.h>

int leap(int year);
int main(void) {
    time_t current_time;
    current_time = time(NULL);
    struct tm *tm_local = localtime(&current_time);

    // Years since 1900 + 1900
    int year = tm_local -> tm_year + 1900;
    int days_left = tm_local -> tm_yday;
    int days_in_year = 0;
    int months[12] = {31,28+leap(year),31,30,31,30,31,31,30,31,30,31};
    for (int i = 0; i < 12; i++)
        days_in_year += months[i];

    printf("%d/%d\n", days_left, days_in_year);

    return 0;
}

int leap(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
}
