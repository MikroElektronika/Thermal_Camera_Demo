#ifndef _IRGRID2_T_
#define _IRGRID2_T_

#include "stdint.h"

#ifndef _IRGRID2_H_

typedef struct
{
    int16_t kVdd;
    int16_t vdd25;
    float KvPTAT;
    float KtPTAT;
    uint16_t vPTAT25;
    float alphaPTAT;
    int16_t gainEE;
    float tgc;
    float cpKv;
    float cpKta;
    uint8_t resolutionEE;
    uint8_t calibrationModeEE;
    float KsTa;
    float ksTo[4];
    int16_t ct[4];
    float alpha[768];
    int16_t offset[768];
    float kta[768];
    float kv[768];
    float cpAlpha[2];
    int16_t cpOffset[2];
    float ilChessC[3];
    uint16_t brokenPixels[5];
    uint16_t outlierPixels[5];
} paramsMLX90640;

#define T_IRGRID2_P const uint8_t* 
#define T_MATRIXRGB_P const uint8_t*
#define T_PROXFUSION2_P const uint8_t*
#define T_G2C_P const uint8_t*

#endif
#endif