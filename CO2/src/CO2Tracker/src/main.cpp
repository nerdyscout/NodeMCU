#include <Arduino.h>
#include <TaskScheduler.h>
#include <SoftwareSerial.h>
#include <Adafruit_Sensor.h>
#include <SPI.h>

//#define __VERSION__ '0.0.1'

#define DEBUG true
#define GPS true
#define LORA true
#define BME true
#define SDC true
#define LED true

#if DEBUG
  #define debugPin 1
  SoftwareSerial Debug (debugPin,debugPin);
  String dbg="";
#endif

//Tasks
Scheduler taskmgr;

#if BME || SDC
  float temperature;
  float humidity;
#endif

#include "bme.ino"
#include "gps.ino"
#include "led.ino"
#include "lora.ino"
#include "sdc.ino"

void setup() {
  #if DEBUG
    pinMode(debugPin, OUTPUT);
    Debug.begin(115200);
    Debug.print("V");
//    Debug.print(__VERSION__);
    Debug.print(" build ");
    Debug.println(__DATE__);
    dbg="";
  #endif

  Wire.begin();

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
