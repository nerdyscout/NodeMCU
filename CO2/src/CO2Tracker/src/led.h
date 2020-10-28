#include <Adafruit_NeoPixel.h>

void tLED_write(); bool tLED_init();

#if CO2 == SDC
    extern uint16_t co2;
#endif

#define PIN 0 // GPIO0 / D3
#define NUMPIXELS 3
Adafruit_NeoPixel pixels(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);