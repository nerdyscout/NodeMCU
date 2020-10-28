#include "main.h"
#include "bme.h"

void tBME_read(){
  if (bme.performReading()){
    #if TEMPERATURE == BME680
      temperature = (temperature+bme.temperature)/2;
    #endif
    #if PRESSURE == BME680
      pressure = (pressure+bme.pressure/100)/2; // mbar
    #endif
    #if HUMIDITY == BME680
      humidity = (humidity+bme.humidity)/2;
    #endif
    #if GAS == BME680
      gas = (gas+bme.gas_resistance/1000)/2;
    #endif
    #if ALTITUDE == BME680
      altitude = (altitude+bme.readAltitude(SEALEVELPRESSURE_HPA))/2;
    #endif
  }
  #if DEBUG
  #endif
}

bool tBME_init(){
  bool status = bme.begin();
  if (status) {
    // Set up oversampling and filter initialization
    bme.setTemperatureOversampling(BME680_OS_8X);
    bme.setHumidityOversampling(BME680_OS_2X);
    bme.setPressureOversampling(BME680_OS_4X);
    bme.setIIRFilterSize(BME680_FILTER_SIZE_3);
    bme.setGasHeater(320, 150); // 320*C for 150 ms

    #if TEMPERATURE == BME680
      temperature = bme.temperature;
    #endif
    #if PRESSURE == BME680
      pressure = bme.pressure/100; // mbar
    #endif
    #if HUMIDITY == BME680
      humidity = bme.humidity;
    #endif
    #if GAS == BME680
      gas = bme.gas_resistance/1000;
    #endif
    #if ALTITUDE == BME680
      altitude = bme.readAltitude(SEALEVELPRESSURE_HPA);
    #endif
  }
  return status;
}
