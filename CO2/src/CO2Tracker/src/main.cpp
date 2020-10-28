#include <TaskScheduler.h>
#include <SPI.h>
#include <Wire.h>

//#define __VERSION__ "0.0.1"

#include <SoftwareSerial.h>
#define debugPin 1
String dbg="";
SoftwareSerial Debug (debugPin,debugPin);
#include "main.h"

//Tasks
Scheduler taskmgr;
Task tBME(10 * TASK_SECOND, TASK_FOREVER, &tBME_read, &taskmgr, false, &tBME_init);
Task tSDC(30 * TASK_SECOND, TASK_FOREVER, &tSDC_read, &taskmgr, false, &tSDC_init);
Task tGPS(TASK_MINUTE, TASK_FOREVER, &tGPS_read, &taskmgr, false, &tGPS_init);
Task tLED(TASK_SECOND, TASK_FOREVER, &tLED_write, &taskmgr, false,&tLED_init);
Task tLORA(TASK_MINUTE, TASK_FOREVER, &tLORA_send, &taskmgr, false, &tLORA_init);
Task tWIFI(TASK_IMMEDIATE , TASK_FOREVER, &tWIFI_handle, &taskmgr, false, &tWIFI_init);

void setup() {
  #if DEBUG
    pinMode(debugPin, OUTPUT);
    Debug.begin(9600);
    delay(1000);
    Debug.print("V");
    Debug.print(__VERSION__);
    Debug.print(" build ");
    Debug.println(__DATE__);
  #endif

  Wire.begin();
  Wire.setClock(100000L);            // 100 kHz SCD30 
  Wire.setClockStretchLimit(200000L);// CO2-SCD30
  #if DEBUG
    if (Wire.status() != I2C_OK) Debug.print("ERR:I2C");
  #endif

  taskmgr.enableAll();
}

void loop() {
  taskmgr.execute();
}
