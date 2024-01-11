/******************************
 * main.c
 * rev 1.0 Jan 2021 shabaz
 * ****************************/

#include "pico/stdlib.h"
#include "extrafunc.h"

int
main(void)
{
    led_setup();    // initialize LED pin to be an output

    while (1) {
        led_ctrl(1);    // turn LED on
        sleep_ms(250);
        led_ctrl(0);    // turn LED off
        sleep_ms(250);
    }
}
