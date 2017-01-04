#ifndef __eev_H
#define __eev_H
#include "include.h"
extern uchar InterTimes;
const unsigned int STEP[] ={0x8,0xc,0x4,0x6,0x2,0x3,0x1,0x9};
//RC0123 A3B2C1D0
 int stepcount =0;
 int EEVSTEP=350;
extern void eevdriver(int);
void delay16ms(int time);
#endif