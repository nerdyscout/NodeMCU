#if BME
#include "Adafruit_BME680.h"

  void tBME_read(); bool tBME_init();
  Task tBME(5 * TASK_SECOND, TASK_FOREVER, &tBME_read, &taskmgr, false, &tBME_init);
  Adafruit_BME680 bme; // I2C
  #define SEALEVELPRESSURE_HPA (1013.25)
  uint32_t pressure;
  uint32_t gas;

void tBME_read(){
  if (bme.performReading()){
    temperature = (temperature+bme.temperature)/2;
    pressure = (pressure+bme.pressure/100)/2; // mbar
    humidity = (humidity+bme.humidity)/2;
    gas = (gas+bme.gas_resistance/1000)/2;
    altitude = (altitude+bme.readAltitude(SEALEVELPRESSURE_HPA))/2;
  }
  #if DEBUG
  else
  {
      dbg+="\nERR:BME:READ";
  }
  #endif
}

bool tBME_init(){
  __DBG__
  bool status = bme.begin();
  __DBG__
  if (status) {
  __DBG__
    // Set up oversampling and filter initialization
    bme.setTemperatureOversampling(BME680_OS_8X);
    bme.setHumidityOversampling(BME680_OS_2X);
    bme.setPressureOversampling(BME680_OS_4X);
    bme.setIIRFilterSize(BME680_FILTER_SIZE_3);
    bme.setGasHeater(320, 150); // 320*C for 150 ms

    temperature = bme.temperature;
    pressure = bme.pressure/100; // mbar
    humidity = bme.humidity;
    gas = bme.gas_resistance/1000;
    altitude = bme.readAltitude(SEALEVELPRESSURE_HPA);
  }
  #if DEBUG
  else
  {
    dbg += "\nERR:BME:INIT";
  }
  #endif
  return status;
}
#endif