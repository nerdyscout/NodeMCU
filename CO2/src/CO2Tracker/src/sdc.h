#include <SparkFun_SCD30_Arduino_Library.h>

void tSDC_read(); bool tSDC_init();

SCD30 airSensor;

#if TEMPERATURE == SDC
  float temperature;
#endif

#if HUMIDITY == SDC
  float humidity;
#endif

#if CO2 == SDC
  uint16_t co2;
#endif

extern float altitude;
extern uint16_t pressure;