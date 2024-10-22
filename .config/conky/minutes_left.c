#include <stdio.h>
#include <time.h>

int main(void) {
    time_t current_time;

    current_time = time(NULL);

    struct tm *tm_local = localtime(&current_time);

    int hour = tm_local -> tm_hour;
    int minute = tm_local -> tm_min;

    int time_left = 1440 - ((hour * 60) + minute);

    printf("%d", time_left);

    return 0;
}
