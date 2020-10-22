#if LED
    #include <Adafruit_NeoPixel.h>

    #define PIN 0 // GPIO0 / D3
    #define NUMPIXELS 3
    Adafruit_NeoPixel pixels(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);

    void tLED_write(); bool tLED_init();
    Task tLED(20 * TASK_MILLISECOND, TASK_FOREVER, &tLED_write, &taskmgr, false,&tLED_init);

    bool tLED_init() {
        pixels.begin();
        pixels.clear(); // Set all pixel colors to 'off'
        #if DEBUG
            dbg += "\nERR:LED:INIT";
        #endif
        return true;
    }

    void tLED_write(){
        pixels.setPixelColor(1, pixels.Color(0, 200, 0));
        pixels.setPixelColor(2, pixels.Color(200, 0, 0));
        pixels.setPixelColor(3, pixels.Color(0, 0, 200));
        pixels.show();
    }
#endif