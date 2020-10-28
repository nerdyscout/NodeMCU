#include <Arduino.h>
#include <SoftwareSerial.h>

// DEBUG
#define DEBUG 1 // 1 - not TRUE !
#if DEBUG
    #ifndef __DBG__
        extern SoftwareSerial Debug;
        extern String dbg;
        #define __DBG__ {\
            Debug.print("DBG:"); \
            Debug.print(__FILE__); \
            Debug.print(":"); \
            Debug.println(__LINE__); \
        }
    #endif
#endif

#define CFG 000     // config
// ambience
#define SDC 100     // temperature, humidity, co2
#define BME680 101  // temperature, humidity, altitude, gas
#define BME280 102  // temperature, humidity
// location
#define GPS 200     // location, altitude, date, time
#define GEOIP 201   // location
// LED
#define LED 300
#define WS2812B 301
// radio
#define WLAN 400
#define LORA 401
// date, time
#define RTC 500     // date, time
#define NTP 501     // date, time
// logging
#define SD 600
#define ROM 601


// mapping
#define CO2 SDC
//#define GAS BME680
#define TEMPERATURE SDC
#define HUMIDITY SDC
//#define PRESSURE BME680
#define ALTITUDE CFG
#define LOCATION GEOIP
#define DATE GEOIP
#define TIME GEOIP
//#define RFM95 LORA
//#define WIFI WLAN

extern void tBME_read(); extern bool tBME_init();
extern void tSDC_read(); extern bool tSDC_init();
extern void tGPS_read(); extern bool tGPS_init();
extern void tLED_write(); extern bool tLED_init();
extern void tLORA_send(); extern bool tLORA_init();
extern void tWIFI_handle(); extern bool tWIFI_init();

extern uint8_t month, day, hour, minute;
extern uint16_t year;
extern double latitude, longitude;
extern float altitude;
extern uint16_t co2;
extern float temperature;
extern uint16_t pressure;
extern float humidity;
extern uint32_t gas;
