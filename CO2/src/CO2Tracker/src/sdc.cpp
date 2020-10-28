#include "main.h"
#include "sdc.h"

void tSDC_read(){
    #ifdef ALTITUDE
        airSensor.setAltitudeCompensation((uint16_t)altitude);
    #endif
    #if PRESSURE
        airSensor.setAmbientPressure(pressure); // mbar
    #endif

    airSensor.setForcedRecalibrationFactor(400);

    #if SDC == CO2
        co2 = (co2+airSensor.getCO2())/2;
    #endif
    #if SDC == TEMPERATURE
        temperature = (temperature+airSensor.getTemperature())/2;
    #endif
    #if SDC == HUMIDITY
        humidity = (humidity+airSensor.getHumidity())/2;
    #endif
}

bool tSDC_init() {
    bool status= airSensor.begin();
    if (status)
    {
        airSensor.setAutoSelfCalibration(true);
        airSensor.setMeasurementInterval(3);

        #if SDC == CO2
            co2 = airSensor.getCO2();
        #endif
        #if SDC == TEMPERATURE
            temperature = airSensor.getTemperature();
        #endif
        #if SDC == HUMIDITY
            humidity = airSensor.getHumidity();
        #endif
    }
    return status;
}
