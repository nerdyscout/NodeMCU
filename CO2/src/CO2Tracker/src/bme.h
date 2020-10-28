#include <Adafruit_BME680.h>

void tBME_read(); bool tBME_init();

Adafruit_BME680 bme; // I2C
#define SEALEVELPRESSURE_HPA (1013.25)

#if TEMPERATURE == BME680
  float temperature;
#endif

#if PRESSURE == BME680
  uint16_t pressure;
#endif

#if HUMIDITY == BME680
  float humidity;
#endif

#if ALTITUDE == BME680
  float altitude;
#endif

#if GAS == BME680
  uint32_t gas;
#endif