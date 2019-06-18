#include "color_scale.h"

static const uint8_t RANGE_ABS_MIN = 0;
static const uint8_t RANGE_LOW_CENTER = 1;
static const uint8_t RANGE_HIGH_CENTER = 3;
static const uint8_t RANGE_MED_CENTER = 2;
static const uint8_t RANGE_ABS_MAX = 4;

static float _abs_min;
static float _abs_max;
static float _low_center;
static float _med_center;
static float _hig_center;

int8_t _min_value  = -4;
int8_t _low_value  = -2;
int8_t _med_value  = +1;
int8_t _high_value = +2;
int8_t _max_value  = +4;

static uint8_t _get_range( float val )
{
    if (val <= _abs_min)
        return RANGE_ABS_MIN;
    if (val <= _low_center)
        return RANGE_LOW_CENTER;
    if (val <= _med_center)
        return RANGE_MED_CENTER;
    if (val <= _hig_center)
        return RANGE_HIGH_CENTER;

    return RANGE_ABS_MAX;
}

void color_scale_init(uint8_t Ta)
{
    _abs_min    = (Ta + _min_value);   // TA - 4
    _low_center = (Ta + _low_value);   // TA - 2
    _med_center = (Ta + _med_value);   // TA + 1
    _hig_center = (Ta + _high_value);  // TA + 2
    _abs_max    = (Ta + _max_value);   // TA + 4
}

uint16_t color_scale_rgb_conversion( float x )
{  
    uint8_t         range;
    uint16_t        col;

    range = _get_range(x);

    switch (range)
    {
        case RANGE_ABS_MIN:
        {
              col = _COLOR_BLUE;
        break;
        }
        case RANGE_LOW_CENTER:
        {
              col = _COLOR_BLUE_LOW;
        break;
        }
        case RANGE_MED_CENTER:
        {
              col = _COLOR_GREEN_LOW;
        break;
        }
        case RANGE_HIGH_CENTER:
        {
              col = _COLOR_YELLOW;
        break;
        }
        case RANGE_ABS_MAX:
        {
              col = _COLOR_RED;
        break;
        }
    }
    return col;
}
