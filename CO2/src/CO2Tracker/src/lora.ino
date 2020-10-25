#if LORA
    #include <TinyLoRa.h>

    void tLORA_send(); bool tLORA_init();
    Task tLORA(TASK_MINUTE, TASK_FOREVER, &tLORA_send, &taskmgr, false, &tLORA_init);
    // Network Session Key (MSB)
    uint8_t NwkSkey[16] = { 0x39, 0xBF, 0x6F, 0x56, 0x47, 0x4E, 0xF6, 0xB5, 0x11, 0x17, 0x07, 0x4B, 0x5E, 0x1D, 0x39, 0x3A };
    // Application Session Key (MSB)
    uint8_t AppSkey[16] = { 0x0D, 0x0E, 0xAE, 0x0A, 0x0C, 0x6F, 0x80, 0xF3, 0xBE, 0x6A, 0x51, 0xB0, 0x67, 0xDD, 0x8E, 0xCD };
    // Device Address (MSB)
    uint8_t DevAddr[4] = { 0x26, 0x01, 0x1C, 0xE1 };
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