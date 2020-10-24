#if SDC
#include "SparkFun_SCD30_Arduino_Library.h"

    void tSDC_read(); bool tSDC_init();
    Task tSDC(5 * TASK_SECOND, TASK_FOREVER, &tSDC_read, &taskmgr, false, &tSDC_init);
    SCD30 airSensor;
    uint16_t co2;

    void tSDC_read(){
        #if GPS || BME
        airSensor.setAltitudeCompensation((uint16_t)altitude);
        #endif
        #if BME
        airSensor.setAmbientPressure(pressure); // mbar
        #endif

        airSensor.setForcedRecalibrationFactor(400);

        co2 = (co2+airSensor.getCO2())/2;
        temperature = (temperature+airSensor.getTemperature())/2;
        humidity = (humidity+airSensor.getHumidity())/2;

        __DBG__
    }

    bool tSDC_init() {
        __DBG__
        bool status= airSensor.begin();
        __DBG__
        if (status)
        {
            __DBG__
            airSensor.setAutoSelfCalibration(true);
            airSensor.setMeasurementInterval(3);

            co2 = airSensor.getCO2();
            temperature = airSensor.getTemperature();
            humidity = airSensor.getHumidity();
        }
        #if DEBUG
        else
        {
            dbg += "\nERR:SDC:INIT";
        }
        #endif
        __DBG__
        return status;
    }
#endif