#include <avr/io.h>
#include <util/delay.h>

#define LED_PIN PB5

int main(void)
{
    DDRB |= (1 << LED_PIN);          // PB5 als Ausgang

    while (1) {
        PORTB ^= (1 << LED_PIN);     // LED umschalten
        _delay_ms(250);
    }
    return 0;
}
