#include "main.h"
#include "led.h"


bool tLED_init() {
    pixels.begin();
    pixels.clear(); // Set all pixel colors to 'off'
    return true;
}

void tLED_write(){
    #ifdef CO2
        if (co2>100) {
            pixels.setPixelColor(0, pixels.Color(0, 250, 0));
            pixels.setPixelColor(1, pixels.Color(0, 0, 0));
            pixels.setPixelColor(2, pixels.Color(0, 0, 0));
        }
        if (co2>500){
            pixels.setPixelColor(0, pixels.Color(250, 250, 0));
            pixels.setPixelColor(1, pixels.Color(250, 250, 0));
            pixels.setPixelColor(2, pixels.Color(0, 0, 0));
        }
        if (co2>1000){
            pixels.setPixelColor(0, pixels.Color(250, 0, 0));
            pixels.setPixelColor(1, pixels.Color(250, 0, 0));
            pixels.setPixelColor(2, pixels.Color(250, 0, 0));
        }
    #endif
    pixels.setBrightness(50);
    pixels.show();
}