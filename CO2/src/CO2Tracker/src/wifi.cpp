#include "main.h"
#include "wifi.h"

//flag for saving data
bool shouldSaveConfig = false;

//callback notifying us of the need to save config
void saveConfigCallback () {
    #if DEBUG
        Debug.println("DBG:WIFI:SAVE"); 
    #endif
    shouldSaveConfig = true;
}

void handleRoot() {
// Allocate JsonBuffer
// Use arduinojson.org/assistant to compute the capacity.
StaticJsonBuffer<500> jsonBuffer;
JsonArray& array = jsonBuffer.createArray();

    #ifdef LOCATION 
        JsonObject& position = array.createNestedObject();
        position["latitude"] = latitude;
        position["longitude"] = longitude;
        #ifdef ALTITUDE
            position["altitude"] = cfg_altitude;
        #endif
    #endif

    JsonObject& ambience = array.createNestedObject();
    #ifdef TEMPERATURE
        ambience["temperature"] = temperature;
    #endif
    #ifdef HUMIDITY
        ambience["humidity"] = humidity;
    #endif
    #ifdef CO2
        ambience["co2"] = co2;
    #endif

// Write JSON document  
String var;
array.prettyPrintTo(var);
server.send(200, "application/json", var);

}
/*
// GEOLOCATION via WIFI
#if LOCATION == GEOIP
    #include <TaskScheduler.h>
//    #include <IPGeolocation.h>

    extern Scheduler taskmgr; 
    String GeoLocAPIKey = "****";

    void tWIFIGEO_handle(); 
    Task tWIFIGEO(TASK_HOUR, TASK_FOREVER, &tWIFIGEO_handle, &taskmgr, false);

    void tWIFIGEO_handle() {
        IPGeolocation location(GeoLocAPIKey);
        IPGeo IPG;
        location.updateStatus(&IPG);
        latitude = IPG.latitude;
        longitude = IPG.longitude;
    }

#endif
*/

void tWIFI_handle() {
    server.handleClient();
}

bool tWIFI_init() {
    //clean FS, for testing
    LittleFS.format();

    #if DEBUG
        Debug.println("DBG:WIFI:FS:MNT"); 
    #endif

    if (LittleFS.begin()) {
        if (LittleFS.exists("/config.json")) {
        #if DEBUG
            Debug.println("DBG:WIFI:MNT:READ"); 
        #endif
        File configFile = LittleFS.open("/config.json", "r");
        if (configFile) {
            size_t size = configFile.size();
            // Allocate a buffer to store contents of the file.
            std::unique_ptr<char[]> buf(new char[size]);

            configFile.readBytes(buf.get(), size);
            DynamicJsonBuffer jsonBuffer;
            JsonObject& json = jsonBuffer.parseObject(buf.get());

            #if DEBUG
                Debug.print("DBG:WIFI:CFG:READ"); 
                json.printTo(Debug);
                Debug.println(""); 
            #endif

            if (json.success()) {
                strcpy(mqtt_server, json["mqtt_server"]);
                strcpy(mqtt_port, json["mqtt_port"]);
                strcpy(cfg_altitude, json["altitude"]);
                altitude=(int)cfg_altitude;
                if(json["ip"]) {
                    strcpy(static_ip, json["ip"]);
                    strcpy(static_gw, json["gateway"]);
                    strcpy(static_sn, json["subnet"]);
                }
            } else {
                #if DEBUG
                    Debug.println("DBG:WIFI:CFG:failed to load"); 
                #endif
            }
            configFile.close();
        }
    }
} 
else {
    #if DEBUG
        Debug.println("DBG:WIFI:MNT:FAIL"); 
    #endif
}

    // The extra parameters to be configured (can be either global or just in the setup)
    // After connecting, parameter.getValue() will get you the configured value
    // id/name placeholder/prompt default length
    WiFiManagerParameter custom_mqtt_server("server", "mqtt server", mqtt_server, 40);
    WiFiManagerParameter custom_mqtt_port("port", "mqtt port", mqtt_port, 6);
    WiFiManagerParameter custom_altitude("altitude", "altitude", cfg_altitude, 32);

    //WiFiManager
    //Local intialization. Once its business is done, there is no need to keep it around
    WiFiManager wifiManager;

    //set config save notify callback
    wifiManager.setSaveConfigCallback(saveConfigCallback);

    //set static ip
    // IPAddress _ip,_gw,_sn;
    //  _ip.fromString(static_ip);
//    _gw.fromString(static_gw);
//      _sn.fromString(static_sn);
    //set static ip
//        wifiManager.setSTAStaticIPConfig(_ip, _gw, _sn);
    //add all your parameters here
    wifiManager.addParameter(&custom_mqtt_server);
    wifiManager.addParameter(&custom_mqtt_port);
    wifiManager.addParameter(&custom_altitude);

    //reset settings - for testing
    //wifiManager.resetSettings();

    //set minimu quality of signal so it ignores AP's under that quality
    //defaults to 8%
    //wifiManager.setMinimumSignalQuality();
    
    //sets timeout until configuration portal gets turned off
    //useful to make it all retry or go to sleep
    //in seconds
    wifiManager.setTimeout(120);

    //fetches ssid and pass and tries to connect
    //if it does not connect it starts an access point with the specified name
    //and goes into a blocking loop awaiting configuration
    if (!wifiManager.autoConnect()) {
//            Serial.println("failed to connect and hit timeout");
        delay(3000);
        //reset and try again, or maybe put it to deep sleep
        ESP.reset();
        delay(5000);
    }

    //if you get here you have connected to the WiFi
    #if DEBUG
        Debug.println("DBG:WIFI:CONNECTED"); 
    #endif

    //read updated parameters
    strcpy(mqtt_server, custom_mqtt_server.getValue());
    strcpy(mqtt_port, custom_mqtt_port.getValue());
    strcpy(cfg_altitude, custom_altitude.getValue());

    //save the custom parameters to FS
    if (shouldSaveConfig) {
        #if DEBUG
            Debug.println("DBG:WIFI:CFG:SAVED"); 
        #endif
        DynamicJsonBuffer jsonBuffer;
        JsonObject& json = jsonBuffer.createObject();
        json["mqtt_server"] = mqtt_server;
        json["mqtt_port"] = mqtt_port;
        json["altitude"] = cfg_altitude;
        json["ip"] = WiFi.localIP().toString();
        json["gateway"] = WiFi.gatewayIP().toString();
        json["subnet"] = WiFi.subnetMask().toString();

        File configFile = LittleFS.open("/config.json", "w");
        if (!configFile) {
            #if DEBUG
                Debug.println("DBG:WIFI:CFG:FAIL"); 
            #endif
        }
        #if DEBUG
            Debug.print("DBG:WIFI:CFG:"); 
            json.printTo(Debug);
            Debug.println("");
        #endif

        json.printTo(configFile);
        configFile.close();
    }
    #if DEBUG
        Debug.print("DBG:WIFI:IP:"); 
        Debug.println(WiFi.localIP());
        Debug.print("DBG:WIFI:GATEWAY:"); 
        Debug.println(WiFi.gatewayIP());        
        Debug.print("DBG:WIFI:MASK:"); 
        Debug.println(WiFi.subnetMask());        
    #endif


    server.on("/", handleRoot);
    server.begin();
    return true;
}