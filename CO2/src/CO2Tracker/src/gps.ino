#if GPS
    #include <TinyGPS++.h>

    void tGPS_read(); bool tGPS_init();
    Task tGPS(30 * TASK_SECOND, TASK_FOREVER, &tGPS_read, &taskmgr, false, &tGPS_init);
    double latitude, longitude;
    uint8_t month, day, hour, minute;
    uint16_t year;

    #define gpsPin 1
    SoftwareSerial sGPS (gpsPin,gpsPin);
    TinyGPSPlus gps;

    void tGPS_read(){
        altitude = gps.altitude.meters();
        latitude = gps.location.lat();
        longitude = gps.location.lng();
        month = gps.date.month();
        day = gps.date.day();
        year = gps.date.year();
        hour = gps.time.hour();
        minute = gps.time.minute();
        __DBG__
    }

    bool tGPS_init(){
        __DBG__
//        pinMode(gpsPin, INPUT);
        __DBG__
        sGPS.begin(115200);
        __DBG__
        return true;
    }
#endif
