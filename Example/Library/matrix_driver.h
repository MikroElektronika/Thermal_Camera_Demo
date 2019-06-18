
#include "demo_types.h"

#define MATRIXRGB_ERR 		uint8_t


#define _MATRIXRGB_FONT_HORIZONTAL        0
#define _MATRIXRGB_FONT_VERTICAL          1
#define _MATRIXRGB_FONT_VERTICAL_COLUMN   2

#define _MATRIXRGB_PATTERN_1_MAP_5MM      0x00
#define _MATRIXRGB_PATTERN_1_MAP_6MM      0x01
#define _MATRIXRGB_PATTERN_2H_MAP_5MM     0x02
#define _MATRIXRGB_PATTERN_2H_MAP_6MM     0x03
#define _MATRIXRGB_PATTERN_2V_MAP_5MM     0x04
#define _MATRIXRGB_PATTERN_2V_MAP_6MM     0x05
#define _MATRIXRGB_PATTERN_3H_MAP_5MM     0x06
#define _MATRIXRGB_PATTERN_3H_MAP_6MM     0x07
#define _MATRIXRGB_PATTERN_3V_MAP_5MM     0x08
#define _MATRIXRGB_PATTERN_3V_MAP_6MM     0x09
#define _MATRIXRGB_PATTERN_4H_MAP_5MM     0x0A
#define _MATRIXRGB_PATTERN_4H_MAP_6MM     0x0B
#define _MATRIXRGB_PATTERN_4V_MAP_5MM     0x0C
#define _MATRIXRGB_PATTERN_4V_MAP_6MM     0x0D
#define _MATRIXRGB_PATTERN_4S_MAP_5MM     0x0E
#define _MATRIXRGB_PATTERN_4S_MAP_6MM     0x0F

/**
 * @brief Firmware Initialization
 *
 * @param[in] rowmap Panel ROW LUT - more info inside firmware documentation
 * @param[in] pattern_id Panel Pattern ID - more info inside firmware documentation
 *
 * @note
 * This function mus be executed right after driver initialization.
 */
MATRIXRGB_ERR matrixrgb_deviceInit( const uint8_t pattern_id );

/**
 * @brief Hard reset of the Matrix RGB click
 *
 * @note
 * Function takes 300 ms.
 */
void matrixrgb_deviceReset();

/**
 * @brief Set Power
 *
 * @param[in] powerState Power State (0 - OFF / 1 - ON)
 */
void matrixrgb_setPower( uint8_t powerState );

/**
 * @brief Set Brightness
 *
 * @param[in] brightness Brightness intensity
 *
 * @warning
 * In case of high brightness level flickering may appears due to fact
 * that this is software brightness implementation.
 */
void matrixrgb_setBrightness( uint8_t brightness );

/**
 * @brief Fill Screen
 *
 * @param[in] color screen color
 */
void matrixrgb_fillScreen( uint16_t color );

/**
 * @brief Draw Image on Panel
 *
 * @param[in] img pointer to image array
 *
 * @note
 * Image must be in RGB565 format LSB first.
 */
void matrixrgb_drawImage( const uint8_t *img );

/**
 * @brief Set Font Function
 *
 * Must be called before write text function to adjust text related properties.
 */
void matrixrgb_setFont( uint8_t *font, uint16_t color, uint8_t orientation );

/**
 * @brief Write Pixel
 *
 * @param[in] x horizontal position
 * @param[in] y vertical position
 * @param[in] color pixel color
 *
 * @return
 * 0 OK / 1 Error
 *
 * @note
 * Error may appear in case of wrong X or Y positions.
 */
MATRIXRGB_ERR matrixrgb_writePixel( uint16_t x, uint16_t y, uint16_t color );

/**
 * @brief Writes Text
 *
 * @param[in] x - horizontal offset
 * @param[in] y - vertical offset
 *
 * @return
 * 0 OK / 1 Error
 *
 * Writing starts at provided offset
 *
 * @note
 * Error may appear in case of wrong X or Y positions.
 */
MATRIXRGB_ERR matrixrgb_writeText( char *text, uint16_t x, uint16_t y );