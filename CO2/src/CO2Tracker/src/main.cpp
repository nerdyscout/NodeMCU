#include <Arduino.h>
#include <TaskScheduler.h>
#include <SoftwareSerial.h>
#include <Adafruit_Sensor.h>
#include <SPI.h>

//#define __VERSION__ "0.0.1"

#define DEBUG true
#define GPS false
#define LORA true
#define BME false
#define SDC true
#define LED false

//Tasks
Scheduler taskmgr;

#if DEBUG
  #define debugPin 1
  SoftwareSerial Debug (debugPin,debugPin);
  String dbg="";
  #define __DBG__ {\
      Debug.print("DBG:"); \
      Debug.print(__FILE__); \
      Debug.print(":"); \
      Debug.println(__LINE__); \
  } 
#else
  #define __DBG__
#endif



#if BME || SDC
  float temperature;
  float humidity;
#endif
#if BME || GPS
  double altitude;
#endif

#include "bme.ino"
#include "gps.ino"
#include "led.ino"
#include "lora.ino"
#include "sdc.ino"

void setup() {
  #if DEBUG
    pinMode(debugPin, OUTPUT);
    Debug.begin(9600);
    delay(1000);
    Debug.print("V");
    Debug.print(__VERSION__);
    Debug.print(" build ");
    Debug.println(__DATE__);
    dbg="";
  #endif

  #if BME || SDC
    Wire.begin();
    Wire.setClock(100000L);            // 100 kHz SCD30 
    Wire.setClockStretchLimit(200000L);// CO2-SCD30
/*
  #if DEBUG
    if (Wire.status() != I2C_OK) Debug.print("ERR:I2C");
  #endif
*/
  #endif

  taskmgr.enableAll();  
}

void loop() {
  taskmgr.execute();
  #if DEBUG
    if (dbg!=""){
      Debug.print(dbg);
      dbg="";
    }
  #endif
}
