/*

Use mikroE Timer Calculator to generate proper timer configuration
and timer ISR.

https://www.mikroe.com/timer-calculator

*/
#include "demo_types.h"

#define __G2C_TIMER__
uint16_t taskTime;

static void g2c_configTimer()
{
RCC_APB1ENR.TIM2EN = 1;
  TIM2_CR1.CEN = 0;
  TIM2_PSC = 2;
  TIM2_ARR = 55999;
  NVIC_IntEnable(IVT_INT_TIM2);
  TIM2_DIER.UIE = 1;
  TIM2_CR1.CEN = 1;
  EnableInterrupts();
}

void Timer_interrupt() iv IVT_INT_TIM2
{
    g2c_tick();
    taskTime++;
    g2c_process();
    TIM2_SR.UIF = 0;
}