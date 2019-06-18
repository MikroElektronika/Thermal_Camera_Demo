#line 1 "D:/Projects_git/demo_app/ThermalCamera/Library/color_scale.c"
#line 1 "d:/projects_git/demo_app/thermalcamera/library/color_scale.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 14 "d:/projects_git/demo_app/thermalcamera/library/color_scale.h"
typedef uint8_t T_rgb_color ;

extern const uint8_t B_COLOR;
extern const uint8_t G_COLOR;
extern const uint8_t R_COLOR;



void color_scale_init(uint8_t Ta);

int color_scale_set_low_center(float low_center, uint8_t color);

int color_scale_set_med_center(float med_center, uint8_t color);

int color_scale_set_hig_center(float hig_center, uint8_t color);

uint16_t color_scale_rgb_conversion( float x );
#line 3 "D:/Projects_git/demo_app/ThermalCamera/Library/color_scale.c"
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

int8_t _min_value = -4;
int8_t _low_value = -2;
int8_t _med_value = +1;
int8_t _high_value = +2;
int8_t _max_value = +4;

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
 _abs_min = (Ta + _min_value);
 _low_center = (Ta + _low_value);
 _med_center = (Ta + _med_value);
 _hig_center = (Ta + _high_value);
 _abs_max = (Ta + _max_value);
}

uint16_t color_scale_rgb_conversion( float x )
{
 uint8_t range;
 uint16_t col;

 range = _get_range(x);

 switch (range)
 {
 case RANGE_ABS_MIN:
 {
 col =  0x111B ;
 break;
 }
 case RANGE_LOW_CENTER:
 {
 col =  0x1739 ;
 break;
 }
 case RANGE_MED_CENTER:
 {
 col =  0x6761 ;
 break;
 }
 case RANGE_HIGH_CENTER:
 {
 col =  0xEC80 ;
 break;
 }
 case RANGE_ABS_MAX:
 {
 col =  0xF100 ;
 break;
 }
 }
 return col;
}
