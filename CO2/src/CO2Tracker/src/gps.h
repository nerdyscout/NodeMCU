#include <TinyGPS++.h>
#include <SoftwareSerial.h>
#include <SoftwareSerial.h>

void tGPS_read(); bool tGPS_init();

#define gpsPin 3 // GPIO3
SoftwareSerial sGPS (gpsPin,gpsPin);

#if DATE == GPS
    uint8_t month, day;
    uint16_t year;
#endif

#if TIME == GPS
    uint8_t hour, second, minute;
#endif

#if LOCATION == GPS
    double latitude, longitude;
#endif

#if ALTITUDE == GPS
    float altitude;
#endif
