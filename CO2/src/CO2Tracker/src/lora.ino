#if LORA
    #include <TinyLoRa.h>

    void tLORA_send(); bool tLORA_init();
    Task tLORA(TASK_MINUTE, TASK_FOREVER, &tLORA_send, &taskmgr, false, &tLORA_init);
    // Network Session Key (MSB)
    uint8_t NwkSkey[16] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
    // Application Session Key (MSB)
    uint8_t AppSkey[16] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
    // Device Address (MSB)
    uint8_t DevAddr[4] = { 0x00, 0x00, 0x00, 0x00 };
    TinyLoRa lora = TinyLoRa(15, 2, 16);
    unsigned char loraData[11] = {"hello LoRa"};

    void tLORA_send(){
        lora.sendData(loraData, sizeof(loraData), lora.frameCounter);
        lora.frameCounter++;
        __DBG__
    }

    bool tLORA_init(){
        __DBG__
        bool status= lora.begin();
        __DBG__
        if (status) {
            __DBG__
            lora.setChannel(MULTI);
            lora.setDatarate(SF7BW125);
        }
        __DBG__
        return status;
    }
#endif