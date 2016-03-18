#ifndef pff_stm32_h
#define pff_stm32_h

#include "stm32f3xx_hal.h"
#include "spi.h"
#include "integer.h"

//------------------------------------------------------------------------------
#define	FORWARD(d)	xmit(d)		/* Data forwarding function (console out) */
static void xmit(char d) {}  	// Dummy write console
//------------------------------------------------------------------------------


#define SELECT()  	HAL_GPIO_WritePin(SD_CS_GPIO_Port, SD_CS_Pin, GPIO_PIN_RESET)	 	/* CS = L */
#define	DESELECT()	HAL_GPIO_WritePin(SD_CS_GPIO_Port, SD_CS_Pin, GPIO_PIN_SET)			/* CS = H */
#define	SELECTING	(HAL_GPIO_ReadPin(SD_CS_GPIO_Port, SD_CS_Pin) == GPIO_PIN_RESET)	/* CS status (true:CS low) */

//------------------------------------------------------------------------------
#define F_CPU				48000000
#define CPU_NS_TICK			(1000 / (F_CPU / 1000000UL))	// CPU nanosecond tick
#define CPU_TICKS_NS(ns)	(ns / CPU_NS_TICK)				// CPU ticks for ns nanoseconds
#define CPU_TICKS_US(us)	CPU_TICKS_NS(us * 1000)			// CPU ticks for us microseconds
#define CPU_TICKS_100US		CPU_TICKS_US(100)				// CPU required ticks for 100 microseconds

void xmit (char);			/* Send a byte via software UART */
void dly_100us (void);		/* Delay 100 microseconds */
void xmit_spi (BYTE d);		/* Send a byte to the MMC */
BYTE rcv_spi (void);		/* Send a 0xFF to the MMC and get the received byte */

#endif
