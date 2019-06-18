#ifndef _COLOR_SCALE_
#define _COLOR_SCALE_

#define _COLOR_BLACK        0x0000
#define _COLOR_WHITE        0xFFFF
#define _COLOR_BLUE         0x111B//0x38F1
#define _COLOR_RED          0xF100
#define _COLOR_YELLOW       0xEC80
#define _COLOR_GREEN_LOW    0x6761
#define _COLOR_BLUE_LOW     0x1739

#include <stdint.h>

typedef uint8_t T_rgb_color ;

extern const uint8_t B_COLOR;
extern const uint8_t G_COLOR;
extern const uint8_t R_COLOR;

/* ---------------------------------------------------------------- PUBLIC FUNCTIONS DECLARATIONS */

void color_scale_init(uint8_t Ta);

int color_scale_set_low_center(float low_center, uint8_t color);

int color_scale_set_med_center(float med_center, uint8_t color);

int color_scale_set_hig_center(float hig_center, uint8_t color);

uint16_t color_scale_rgb_conversion( float x );

#endif