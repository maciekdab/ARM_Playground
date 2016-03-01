/**
 ******************************************************************************
 * File Name          : main.c
 * Description        : Main program body
 ******************************************************************************
 *
 * COPYRIGHT(c) 2016 STMicroelectronics
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *   1. Redistributions of source code must retain the above copyright notice,
 *      this list of conditions and the following disclaimer.
 *   2. Redistributions in binary form must reproduce the above copyright notice,
 *      this list of conditions and the following disclaimer in the documentation
 *      and/or other materials provided with the distribution.
 *   3. Neither the name of STMicroelectronics nor the names of its contributors
 *      may be used to endorse or promote products derived from this software
 *      without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 ******************************************************************************
 */
/* Includes ------------------------------------------------------------------*/
#include "stm32f0xx_hal.h"
#include "rtc.h"
#include "spi.h"
#include "gpio.h"

#define FALSE 	0
#define TRUE 	1
typedef uint8_t bool;

#define LOW		0
#define HIGH	1

/** System Clock Configuration
 */
void SystemClock_Config(void) {

	RCC_OscInitTypeDef RCC_OscInitStruct;
	RCC_ClkInitTypeDef RCC_ClkInitStruct;
	RCC_PeriphCLKInitTypeDef PeriphClkInit;

	RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI|RCC_OSCILLATORTYPE_LSI;
	RCC_OscInitStruct.HSIState = RCC_HSI_ON;
	RCC_OscInitStruct.HSICalibrationValue = 16;
	RCC_OscInitStruct.LSIState = RCC_LSI_ON;
	RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
	RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
	RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL12;
	RCC_OscInitStruct.PLL.PREDIV = RCC_PREDIV_DIV1;
	HAL_RCC_OscConfig(&RCC_OscInitStruct);

	RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
			|RCC_CLOCKTYPE_PCLK1;
	RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
	RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
	RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
	HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_1);

	PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_RTC;
	PeriphClkInit.RTCClockSelection = RCC_RTCCLKSOURCE_LSI;
	HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit);

	HAL_SYSTICK_Config(HAL_RCC_GetHCLKFreq()/1000);

	HAL_SYSTICK_CLKSourceConfig(SYSTICK_CLKSOURCE_HCLK);

	/* SysTick_IRQn interrupt configuration */
	HAL_NVIC_SetPriority(SysTick_IRQn, 0, 0);
}

// ------------------------------ Time vars ------------------------------------
static bool minutesBlink = FALSE;
static bool hoursBlink = FALSE;
static volatile bool secondsTick = FALSE;
// -----------------------------------------------------------------------------

// -------------------------- Display vars -------------------------------------
static const uint32_t DIGITS_SETUP_MODE_BLINK_INTERVAL_MS = 300;
#define MINUTES_UNITS_ANODE     0
#define MINUTES_DECIMALS_ANODE  1
#define HOURS_UNITS_ANODE       2
#define HOURS_DECIMALS_ANODE    3
#define DISPLAY_DOT_INDEX       10
#define DISPLAY_BLANK_INDEX     11

static const uint8_t ANODE_DATA[] = {
		0b00000001,
		0b00000010,
		0b00000100,
		0b00001000
};

//PGFEDCBA
static const uint8_t SEGMENT_DATA[] = {
		0b11000000,  // 0
		0b11111001,  // 1
		0b10100100,  // 2
		0b10110000,  // 3
		0b10011001,  // 4
		0b10010010,  // 5
		0b10000010,  // 6
		0b11111000,  // 7
		0b10000000,  // 8
		0b10010000,  // 9
		0b01111111,  //dot
		0b11111111   //blank
};
// -----------------------------------------------------------------------------

// ------------------------------ Keys vars ------------------------------------
static const uint32_t SHORT_KEYPRESS_MIN_THRESHOLD_MS = 20;
static const uint32_t SHORT_KEYPRESS_MAX_THRESHOLD_MS = 800;
static const uint32_t LONG_KEYPRESS_MAX_THRESHOLD_MS = 1000;
typedef enum {
	PRESSED,
	RELEASED
} KeyState;

typedef enum {
	NO_KEYPRESS_EVENT,
	SHORT_KEYPRESS_EVENT,
	LONG_KEYPRESS_EVENT
} KeyEvent;

typedef struct {
	KeyState state;
	KeyEvent event;
	uint32_t timestamp;
} key_event_t;

static key_event_t keyEvent = { RELEASED, NO_KEYPRESS_EVENT, 0 };
static KeyEvent lastKeyEvent = NO_KEYPRESS_EVENT;
// -----------------------------------------------------------------------------

// --------------------------- Sleep vars --------------------------------------
static bool wakeUpFlag = FALSE;
static const uint32_t INACTIVITY_SLEEP_INTERVAL_MS = 4000;
// -----------------------------------------------------------------------------

// --------------------------- FSM vars ----------------------------------------
enum ClockState {
	DISPLAY_STATE,
	MINUTES_SETUP_STATE,
	HOURS_SETUP_STATE,
};
static uint8_t nextState = DISPLAY_STATE;
// -----------------------------------------------------------------------------

// -------------------------- Time handling ------------------------------------
#define MINUTES_MAX_ALLOWED_VALUE	59
#define HOURS_MAX_ALLOWED_VALUE		23
RTC_TimeTypeDef currentTime;
RTC_DateTypeDef currentDate;

void getCurrentDateTime(RTC_DateTypeDef* date, RTC_TimeTypeDef* time) {
	HAL_RTC_GetTime(&hrtc, time, RTC_FORMAT_BIN);
	HAL_RTC_GetDate(&hrtc, date, RTC_FORMAT_BIN); // need to get date also to unlock time
}

// -----------------------------------------------------------------------------

// ---------------------- Display handling -------------------------------------
static void displaySegmentData(uint8_t data, uint8_t digit) {
	HAL_GPIO_WritePin(DISPLAY_LATCH_GPIO_Port, DISPLAY_LATCH_Pin, GPIO_PIN_RESET);
	HAL_SPI_Transmit(&hspi1, &data, sizeof(uint8_t), HAL_MAX_DELAY);
	HAL_SPI_Transmit(&hspi1, &digit, sizeof(uint8_t), HAL_MAX_DELAY);
	HAL_GPIO_WritePin(DISPLAY_LATCH_GPIO_Port, DISPLAY_LATCH_Pin, GPIO_PIN_SET);
}

static void blankDisplay() {
	displaySegmentData(0, 0);
}

static void displayTime(RTC_TimeTypeDef* time, bool blinkMinutes, bool blinkHours) {
	static uint32_t lastBlinkTime = 0;
	static bool blinkTicker = FALSE;

	if(HAL_GetTick() - lastBlinkTime >= DIGITS_SETUP_MODE_BLINK_INTERVAL_MS) {
		blinkTicker = !blinkTicker;
		lastBlinkTime = HAL_GetTick();
	}

	// extract minutes/hours digit values for indexing the segment data arrays
	uint8_t minutesUnitsDigitIndex = time->Minutes % 10;
	uint8_t minutesDecimalsDigitIndex = time->Minutes / 10;
	uint8_t hoursUnitsDigitIndex = time->Hours % 10;
	uint8_t hoursDecimalsDigitIndex = time->Hours / 10;

	// minutes units display
	displaySegmentData(
			SEGMENT_DATA[minutesUnitsDigitIndex],
			(blinkMinutes && blinkTicker) ?
					(ANODE_DATA[MINUTES_UNITS_ANODE] & ~ANODE_DATA[MINUTES_UNITS_ANODE]) :
					ANODE_DATA[MINUTES_UNITS_ANODE]
	);

	// minutes decimals display
	displaySegmentData(
			SEGMENT_DATA[minutesDecimalsDigitIndex],
			(blinkMinutes && blinkTicker) ?
					(ANODE_DATA[MINUTES_DECIMALS_ANODE] & ~ANODE_DATA[MINUTES_DECIMALS_ANODE]) :
					ANODE_DATA[MINUTES_DECIMALS_ANODE]
	);

	// hours units display
	displaySegmentData(
			secondsTick ?
					(SEGMENT_DATA[hoursUnitsDigitIndex] & SEGMENT_DATA[DISPLAY_DOT_INDEX]) :
					(SEGMENT_DATA[hoursUnitsDigitIndex] | ~SEGMENT_DATA[DISPLAY_DOT_INDEX]),
					(blinkHours && blinkTicker) ?
							(ANODE_DATA[HOURS_UNITS_ANODE] & ~ANODE_DATA[HOURS_UNITS_ANODE]) :
							ANODE_DATA[HOURS_UNITS_ANODE]
	);

	// hours decimals display
	displaySegmentData(
			SEGMENT_DATA[(hoursDecimalsDigitIndex != 0) ? hoursDecimalsDigitIndex : DISPLAY_BLANK_INDEX],
			(blinkHours && blinkTicker) ?
					(ANODE_DATA[HOURS_DECIMALS_ANODE] & ~ANODE_DATA[HOURS_DECIMALS_ANODE]) :
					ANODE_DATA[HOURS_DECIMALS_ANODE]
	);
}
// -----------------------------------------------------------------------------

// ------------------------- Sleep handling ------------------------------------
static void checkSleep(uint32_t sleepIntervalMs) {
	static uint32_t lastSleepTime;

	if(wakeUpFlag) {
		lastSleepTime = HAL_GetTick();
		wakeUpFlag = FALSE;
	}

	if((HAL_GetTick() - lastSleepTime) >= sleepIntervalMs) {
		blankDisplay();
		// HAL enter sleep
		HAL_SuspendTick();
		HAL_PWR_EnterSTOPMode(PWR_LOWPOWERREGULATOR_ON, PWR_STOPENTRY_WFI);
		SystemClock_Config();
		HAL_ResumeTick();
		lastSleepTime = HAL_GetTick();
	}
}
// -----------------------------------------------------------------------------

// -------------------------- Keys handling ------------------------------------
void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin) {
	if(GPIO_Pin == MENU_KEY_Pin) {
		wakeUpFlag = TRUE;
	}
}

static void checkKeysEvent() {
	if((HAL_GPIO_ReadPin(MENU_KEY_GPIO_Port, MENU_KEY_Pin) == LOW) && (keyEvent.state != PRESSED)) {
		keyEvent.timestamp = HAL_GetTick();
		keyEvent.state = PRESSED;
	} else if((HAL_GPIO_ReadPin(MENU_KEY_GPIO_Port, MENU_KEY_Pin) == HIGH) && (keyEvent.state != RELEASED)) {
		// calculate elapsed time since PRESS state
		uint32_t keyPressDuration = HAL_GetTick() - keyEvent.timestamp;

		// fire events based on time elapsed between key states
		if(keyPressDuration >= SHORT_KEYPRESS_MIN_THRESHOLD_MS &&
				keyPressDuration <= SHORT_KEYPRESS_MAX_THRESHOLD_MS) {
			keyEvent.event = SHORT_KEYPRESS_EVENT;
		}

		if(keyPressDuration >= LONG_KEYPRESS_MAX_THRESHOLD_MS) {
			keyEvent.event = LONG_KEYPRESS_EVENT;
		}

		// record last event
		lastKeyEvent = keyEvent.event;

		// reset current events state for a new iteration
		keyEvent.state = RELEASED;
		keyEvent.event = NO_KEYPRESS_EVENT;
		keyEvent.timestamp = 0;
	}
}
// -----------------------------------------------------------------------------

// ----------------------- FSM handling ----------------------------------------
static void checkMenuKeyStateMachine() {
	switch(nextState) {
	case DISPLAY_STATE:
		hoursBlink = FALSE;
		minutesBlink = FALSE;
		if(lastKeyEvent == LONG_KEYPRESS_EVENT) {
			nextState = MINUTES_SETUP_STATE;
			lastKeyEvent = NO_KEYPRESS_EVENT;
		}
		break;
	case MINUTES_SETUP_STATE:
		minutesBlink = TRUE;
		hoursBlink = !minutesBlink;
		if(lastKeyEvent == SHORT_KEYPRESS_EVENT) {
			getCurrentDateTime(&currentDate, &currentTime);
			if(++currentTime.Minutes > MINUTES_MAX_ALLOWED_VALUE) {
				currentTime.Minutes = 0;
			}
			HAL_RTC_SetTime(&hrtc, &currentTime, RTC_FORMAT_BIN);
			lastKeyEvent = NO_KEYPRESS_EVENT;
		}

		if(lastKeyEvent == LONG_KEYPRESS_EVENT) {
			nextState = HOURS_SETUP_STATE;
			lastKeyEvent = NO_KEYPRESS_EVENT;
		}
		break;
	case HOURS_SETUP_STATE:
		hoursBlink = TRUE;
		minutesBlink = !hoursBlink;
		if(lastKeyEvent == SHORT_KEYPRESS_EVENT) {
			getCurrentDateTime(&currentDate, &currentTime);
			if(++currentTime.Hours > HOURS_MAX_ALLOWED_VALUE) {
				currentTime.Hours = 0;
			}
			HAL_RTC_SetTime(&hrtc, &currentTime, RTC_FORMAT_BIN);
			lastKeyEvent = NO_KEYPRESS_EVENT;
		}

		if(lastKeyEvent == LONG_KEYPRESS_EVENT) {
			nextState = DISPLAY_STATE;
			lastKeyEvent = NO_KEYPRESS_EVENT;
		}
		break;
	}
}
// -----------------------------------------------------------------------------


int main(void) {
	/* MCU Configuration----------------------------------------------------------*/

	/* Reset of all peripherals, Initializes the Flash interface and the Systick. */
	HAL_Init();

	/* Configure the system clock */
	SystemClock_Config();

	/* Initialize all configured peripherals */
	MX_GPIO_Init();
	MX_RTC_Init();
	MX_SPI1_Init();

	blankDisplay();

	for (;;) {
		static uint32_t lastTick;
		if(HAL_GetTick() - lastTick >= 1000) {
			secondsTick = !secondsTick;
			lastTick = HAL_GetTick();
		}

		getCurrentDateTime(&currentDate, &currentTime);
		displayTime(&currentTime, minutesBlink, hoursBlink);
		checkKeysEvent();
		checkMenuKeyStateMachine();
		checkSleep(INACTIVITY_SLEEP_INTERVAL_MS);
	}

}


#ifdef USE_FULL_ASSERT

/**
 * @brief Reports the name of the source file and the source line number
 * where the assert_param error has occurred.
 * @param file: pointer to the source file name
 * @param line: assert_param error line source number
 * @retval None
 */
void assert_failed(uint8_t* file, uint32_t line)
{
	/* USER CODE BEGIN 6 */
	/* User can add his own implementation to report the file name and line number,
    ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
	/* USER CODE END 6 */

}

#endif

/**
 * @}
 */

/**
 * @}
 */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
