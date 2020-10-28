#include <LittleFS.h>
#include <ESP8266WiFi.h>          //https://github.com/esp8266/Arduino
#include <DNSServer.h>
#include <ESP8266WebServer.h>
#include <WiFiManager.h>          //https://github.com/tzapu/WiFiManager
#include <ArduinoJson.h>          //https://github.com/bblanchon/ArduinoJson

//#include <IPGeolocation.h>


#if DATE == GEOIP
    uint8_t month, day;
    uint16_t year;
#endif

#if TIME == GEOIP
    uint8_t hour, second, minute;
#endif

#if LOCATION == GEOIP
    double latitude, longitude;
#endif


void tWIFI_handle(); bool tWIFI_init();



//define your default values here, if there are different values in config.json, they are overwritten.
char mqtt_server[40];
char mqtt_port[6] = "8080";
char cfg_altitude [4];
#if ALTITUDE == CFG
    float altitude;
#endif

char static_ip[16] = "10.0.1.56";
char static_gw[16] = "10.0.1.1";
char static_sn[16] = "255.255.255.0";

//    float latitude, longitude;

ESP8266WebServer server(80);