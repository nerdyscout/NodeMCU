#include "main.h"
#include "gps.h"

TinyGPSPlus gps;

void tGPS_read(){
    #if DATE == GPS
        month = gps.date.month();
        day = gps.date.day();
        year = gps.date.year();
    #endif
    #if TIME == GPS
        hour = gps.time.hour();
        minute = gps.time.minute();
        second = gps.time.second();
    #endif
    #if LOCATION == GPS
        latitude = gps.location.lat();
        longitude = gps.location.lng();
        #if DEBUG
            Debug.print("GPS:LAT:");
            Debug.println(latitude);
            Debug.print("GPS:LON:");
            Debug.println(longitude);
        #endif
    #endif
    #if ALTITUDE == GPS
        altitude = gps.altitude.meters();
    #endif
}

bool tGPS_init(){
    sGPS.begin(9600);
    return true;
}
