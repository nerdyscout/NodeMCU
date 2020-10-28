#include "main.h"
#include "lora.h"

unsigned char loraData[11] = {"hello LoRa"};

void tLORA_send(){
    lora.sendData(loraData, sizeof(loraData), lora.frameCounter);
    lora.frameCounter++;
}

bool tLORA_init(){
    bool status= lora.begin();
    if (status) {
        lora.setChannel(MULTI);
        lora.setDatarate(SF7BW125);
    }
    return status;
}
