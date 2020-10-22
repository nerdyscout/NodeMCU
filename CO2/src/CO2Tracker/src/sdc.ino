#if SDC
#include "SparkFun_SCD30_Arduino_Library.h"

    void tSDC_read(); bool tSDC_init();
    Task tSDC(5 * TASK_SECOND, TASK_FOREVER, &tSDC_read, &taskmgr, false, &tSDC_init);
    SCD30 airSensor;
    uint16_t co2;

    void tSDC_read(){
        co2 = (co2+airSensor.getCO2())/2;
        temperature = (temperature+airSensor.getTemperature())/2;
        humidity = (humidity+airSensor.getHumidity())/2;
    }

    bool tSDC_init() {
        bool status= airSensor.begin();
        if (status)
        {
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
    return status;
    }
#endif