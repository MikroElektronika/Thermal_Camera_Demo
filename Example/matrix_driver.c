
#include "demo_types.h"
//#include "matrix_driver.h"


#define MAX_RAM_SIZE                4096

#define _MATRIXRGB_CMD_POWER                              0x01
#define _MATRIXRGB_CMD_BRIGHTNESS                         0x02
#define _MATRIXRGB_CMD_LOAD_IMG                           0x03
#define _MATRIXRGB_CMD_LOAD_PIX                           0x04
#define _MATRIXRGB_CMD_PAN_SETUP                          0x10



static uint8_t* _font;
static uint16_t _font_color;
static uint8_t  _font_orientation;
static uint16_t _font_first_char;
static uint16_t _font_last_char;
static uint16_t _font_height;
static uint16_t _font_x_cord;
static uint16_t _font_y_cord;

static uint16_t _pix_w;
static uint16_t _pix_h;
static uint16_t _ram_s;

static void hal_gpio_rstSet(uint8_t state)
{
    GPIOE_ODR.B12 = state;
}

static void hal_gpio_csSet(uint8_t state)
{
    GPIOB_ODR.B2  = state;
}

static uint8_t hal_gpio_intGet()
{
    return GPIOD_IDR.B4;
}

static void hal_spiWrite(uint8_t *pBuf, uint16_t nBytes)
{
    uint8_t *ptr = pBuf;
    while( nBytes-- )
        SPI1_Write( *( ptr++ ) );
}


static void _spi_cmd( const uint8_t cmd, uint8_t arg )
{
    uint8_t  tmp[2];

    tmp[0] = cmd;
    tmp[1] = arg;


    hal_gpio_csSet( 0 );
    hal_spiWrite( tmp, 2 );
    hal_gpio_csSet( 1 );
    Delay_1ms();
}


static void _char_wr( uint16_t ch )
{
    uint8_t     ch_width = 0;
    uint8_t     x_cnt;
    uint8_t     y_cnt;
    uint16_t    x = 0;
    uint16_t    y = 0;
    uint16_t    tmp;
    uint8_t     temp = 0;
    uint8_t     mask = 0;
    uint32_t    offset;
    uint8_t     *ch_table;
    uint8_t     *ch_bitmap;

    if (ch < _font_first_char)
    {
        return;
    }

    if (ch > _font_last_char)
    {
        return;
    }

    offset = 0;
    tmp = (ch - _font_first_char) << 2;
    ch_table = _font + 8 + tmp;
    ch_width = *ch_table;

    offset = (uint32_t)ch_table[1] + ((uint32_t)ch_table[2] << 8) + ((uint32_t)ch_table[3] << 16);
    ch_bitmap = _font + offset;

    if ((_font_orientation == _MATRIXRGB_FONT_HORIZONTAL) || (_font_orientation == _MATRIXRGB_FONT_VERTICAL_COLUMN))
    {
        y = _font_y_cord;

        for (y_cnt = 0; y_cnt < _font_height; y_cnt++)
        {
            x = _font_x_cord;
            mask = 0;
            for (x_cnt = 0; x_cnt < ch_width; x_cnt++)
            {
                if (!mask)
                {
                    temp = *ch_bitmap++;
                    mask = 0x01;
                }

                if (temp & mask)
                {
                    matrixrgb_writePixel( x, y, _font_color );
                    Delay_80us();
                }

                x++;
                mask <<= 1;
            }
            y++;
        }

        if (_font_orientation == _MATRIXRGB_FONT_HORIZONTAL)
        {
            _font_x_cord = x + 1;
        }
        else
        {
            _font_y_cord = y;
        }
    }
    else
    {
        y = _font_x_cord;

        for (y_cnt = 0; y_cnt < _font_height; y_cnt++)
        {
            x = _font_y_cord;
            mask = 0;

            for (x_cnt = 0; x_cnt < ch_width; x_cnt++)
            {
                if (mask == 0)
                {
                    temp = *ch_bitmap++;
                    mask = 0x01;
                }

                if (temp & mask)
                {
                    matrixrgb_writePixel( x, y, _font_color );
                    Delay_80us();
                }

                x--;
                mask <<= 1;
            }
            y++;
        }
        _font_y_cord = x - 1;
    }
}

void matrixrgb_deviceReset()
{
    hal_gpio_rstSet(1);
    Delay_100ms();
    hal_gpio_rstSet(0);
    Delay_100ms();
    hal_gpio_rstSet(1);
    Delay_100ms();
}

MATRIXRGB_ERR
matrixrgb_deviceInit( const uint8_t pattern_id )
{
    uint8_t tmp;

    switch (pattern_id)
    {
        case 0: case 1:
                _pix_w = 32;
                _pix_h = 32;
                _ram_s = 1024;
        break;
        case 2: case 3:
                _pix_w = 64;
                _pix_h = 32;
                _ram_s = 2048;
        break;
        case 4: case 5:
                _pix_w = 32;
                _pix_h = 64;
                _ram_s = 2048;
        break;
        case 6: case 7:
                _pix_w = 96;
                _pix_h = 32;
                _ram_s = 3072;
        break;
        case 8: case 9:
                _pix_w = 32;
                _pix_h = 96;
                _ram_s = 3072;
        break;
        case 10: case 11:
                _pix_w = 128;
                _pix_h = 32;
                _ram_s = 4096;
        break;
        case 12: case 13:
                _pix_w = 32;
                _pix_h = 128;
                _ram_s = 4096;
        break;
        case 14: case 15:
                _pix_w = 64;
                _pix_h = 64;
                _ram_s = 4096;
        break;
        default :
                return 1;
        break;
    }

    tmp = pattern_id;
    _spi_cmd( _MATRIXRGB_CMD_PAN_SETUP, tmp );

    return 0;
}

void matrixrgb_setPower( uint8_t powerState )
{
    uint8_t tmp;

    tmp = powerState;
    _spi_cmd( _MATRIXRGB_CMD_POWER, tmp );
}

void matrixrgb_setBrightness( uint8_t brightness )
{
    uint8_t tmp;

    tmp = brightness;
    _spi_cmd( _MATRIXRGB_CMD_BRIGHTNESS, tmp );
}

MATRIXRGB_ERR
matrixrgb_writePixel( uint16_t x, uint16_t y, uint16_t color )
{
    uint8_t         cmd;
    uint16_t        pos;
    uint8_t         tmp[ 4 ];

    if (( x >= _pix_w ) || ( y >= _pix_h ))
    {
        return 1;
    }

    cmd = _MATRIXRGB_CMD_LOAD_PIX;
    pos = ((y * _pix_w) + x);

    tmp[0] = color;
    tmp[1] = color >> 8;
    tmp[2] = pos;
    tmp[3] = pos >> 8;

    hal_gpio_csSet( 0 );
    hal_spiWrite( &cmd, 1 );
    hal_spiWrite( tmp, 4 );
    hal_gpio_csSet( 1 );
    Delay_ms(1);

    return 0;
}

void matrixrgb_fillScreen( uint16_t color )
{
    uint8_t         cmd;
    uint16_t        pos;
    uint8_t         tmp[2];

    cmd = _MATRIXRGB_CMD_LOAD_IMG;
    tmp[0] = color;
    tmp[1] = color >> 8;

    hal_gpio_csSet( 0 );
    hal_spiWrite( &cmd, 1 );

    for (pos = 0; pos < _ram_s; pos++)
    {
        hal_spiWrite( tmp, 2 );
        Delay_1ms();
    }

    hal_gpio_csSet( 1 );
    Delay_1ms();
}

void matrixrgb_drawImage( const uint8_t *img )
{
    uint8_t         cmd;
    uint16_t        pos;
    uint8_t         tmp[2];

    cmd = _MATRIXRGB_CMD_LOAD_IMG;


    hal_gpio_csSet( 0 );
    hal_spiWrite( &cmd, 1 );

    for (pos = 0; pos < _ram_s; pos++)
    {
        tmp[ 0 ] = img[ pos * 2 ];
        tmp[ 1 ] = img[ pos * 2 + 1 ];
        hal_spiWrite( tmp, 2 );
        Delay_us(100);
    }

    hal_gpio_csSet( 1 );
    Delay_1ms();
}

void matrixrgb_setFont( uint8_t *font, uint16_t color, uint8_t orientation )
{
    _font               = font;
    _font_first_char    = font[2] + (font[3] << 8);
    _font_last_char     = font[4] + (font[5] << 8);
    _font_height        = font[6];
    _font_color         = color;
    _font_orientation   = orientation ;
}

MATRIXRGB_ERR
matrixrgb_writeText( char *text, uint16_t x, uint16_t y )
{
    uint16_t i;

    if (( x >= _pix_w ) || ( y >= _pix_h ))
    {
        return 1;
    }

    i = 0;

    _font_x_cord = x;
    _font_y_cord = y;

    while( text[i] )
    {
        _char_wr( text[i] );
        i++;
    }

    return 0;
}

/* --------------------------------------------- PRIVATE FUNCTION DEFINITIONS */




/* -------------------------------------------------------------------------- */
/*
  __matrixrgb_driver.c

  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

3. All advertising materials mentioning features or use of this software
   must display the following acknowledgement:
   This product includes software developed by the MikroElektonika.

4. Neither the name of the MikroElektonika nor the
   names of its contributors may be used to endorse or promote products
   derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY MIKROELEKTRONIKA ''AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL MIKROELEKTRONIKA BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

----------------------------------------------------------------------------- */