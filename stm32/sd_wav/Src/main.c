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
#include "stm32f3xx_hal.h"
#include "dac.h"
#include "dma.h"
#include "spi.h"
#include "tim.h"
#include "usart.h"
#include "gpio.h"
#include "pff.h"
#include "pff_stm32.h"
#include "string.h"

//#define DEBUG

#ifdef DEBUG
#define DEBUG_BUFF_SIZE	512
char debug_info[DEBUG_BUFF_SIZE];
#endif

#define WAV_FILE_HEADER_SIZE	44
typedef struct {
	char riff[4];					// should be "RIFF"
	uint32_t file_size;				// file size in bytes - 8 bytes
	char type[4];					// should be "WAVE"
	char fmt[4];
	uint32_t fmt_len;
	uint16_t fmt_type;
	uint16_t channels;				// audio channels
	uint32_t sample_rate;			// sample rate in Hz
	uint32_t sr_bit_ch;				// (Sample Rate * Bit Size * Channels) / 8
	uint16_t bit_ch;				// (Bit Size * Channels) / 8
	uint16_t bps;					// Bits per sample (Bit Size * Samples)
	char data[4];					// should be "data"
	uint32_t data_size;				// total wav raw data size
} WavHeader_TypeDef;

#define DAC_BUFFER_SIZE					1024
#define DAC_BUFFER_HALF_SIZE			(DAC_BUFFER_SIZE / 2)
uint8_t dac_buffer[DAC_BUFFER_SIZE];

volatile uint8_t wav_file_is_playing = 0;

/** System Clock Configuration
 */
void SystemClock_Config(void) {
	RCC_OscInitTypeDef RCC_OscInitStruct;
	RCC_ClkInitTypeDef RCC_ClkInitStruct;

	RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
	RCC_OscInitStruct.HSIState = RCC_HSI_ON;
	RCC_OscInitStruct.HSICalibrationValue = 16;
	RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
	RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
	RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL12;
	HAL_RCC_OscConfig(&RCC_OscInitStruct);

	RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
			|RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
	RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
	RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
	RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
	RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;
	HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_1);

	HAL_SYSTICK_Config(HAL_RCC_GetHCLKFreq()/1000);

	HAL_SYSTICK_CLKSourceConfig(SYSTICK_CLKSOURCE_HCLK);

	/* SysTick_IRQn interrupt configuration */
	HAL_NVIC_SetPriority(SysTick_IRQn, 0, 0);
}

void print_to_console(UART_HandleTypeDef *huart, char* msg) {
	HAL_UART_Transmit(huart, (uint8_t*)msg, strlen(msg), HAL_MAX_DELAY);
}

void print_error_and_halt(char* msg) {
	print_to_console(&huart2, msg);
	while(1);
}

void print_info(char* msg) {
	print_to_console(&huart2, msg);
}

void mount_sd_card_fs(FATFS* fs) {
	// Initialize SD and file system.
#ifdef DEBUG
	print_info("[DEBUG] Mounting SD card ...\r\n");
#endif
	if (pf_mount(fs)) {
#ifdef DEBUG
		print_error_and_halt("[ERROR] SD card mount failed ...\r\n");
#else
		// display error and halt
		// TODO
		for(;;);
#endif
	}
}

void get_wav_info(char* wav_file, WavHeader_TypeDef* header) {
#ifdef DEBUG
	sprintf(debug_info, "[DEBUG] Reading %s file header ...\r\n", wav_file);
	print_info(debug_info);
#endif
	UINT nr;
	pf_read(header->riff, sizeof(header->riff), &nr);
	pf_read(&header->file_size, sizeof(header->file_size), &nr);
	pf_read(header->type, sizeof(header->type), &nr);
	pf_read(header->fmt, sizeof(header->fmt), &nr);
	pf_read(&header->fmt_len, sizeof(header->fmt_len), &nr);
	pf_read(&header->fmt_type, sizeof(header->fmt_type), &nr);
	pf_read(&header->channels, sizeof(header->channels), &nr);
	pf_read(&header->sample_rate, sizeof(header->sample_rate), &nr);
	pf_read(&header->sr_bit_ch, sizeof(header->sr_bit_ch), &nr);
	pf_read(&header->bit_ch, sizeof(header->bit_ch), &nr);
	pf_read(&header->bps, sizeof(header->bps), &nr);
	pf_read(header->data, sizeof(header->data), &nr);
	pf_read(&header->data_size, sizeof(header->data_size), &nr);

#ifdef DEBUG
	sprintf(debug_info,
			"[DEBUG] %s file header info:\r\n"
			"\tRiff string: %.4s\r\n"
			"\tFile size: %lu\r\n"
			"\tWav type: %.4s\r\n"
			"\tFormat chunk marker: %.3s\r\n"
			"\tFormat data length: %lu\r\n"
			"\tFormat type: %d\r\n"
			"\tChannels: %d\r\n"
			"\tSample rate: %lu\r\n"
			"\tSample rate * bit size * channels: %lu\r\n"
			"\tBit size * channels: %d\r\n"
			"\tBits per sample: %d\r\n"
			"\tData chunk: %.4s\r\n"
			"\tData size: %lu\r\n",
			wav_file,
			header->riff,
			header->file_size,
			header->type,
			header->fmt,
			header->fmt_len,
			header->fmt_type,
			header->channels,
			header->sample_rate,
			header->sr_bit_ch,
			header->bit_ch,
			header->bps,
			header->data,
			header->data_size);

	print_info(debug_info);
#endif
}

void dac_trigger_timer_init(uint32_t wav_sample_rate) {
	// timer frequency must match wave file sample rate value

	uint32_t timer_reload_value = 0;
	uint32_t timer_prescaler = 0;

	timer_reload_value = HAL_RCC_GetHCLKFreq() / wav_sample_rate;

	// need better handling here
	if(timer_reload_value > 65535) {
		timer_prescaler = (timer_reload_value / 65535) + 1;
		if(timer_prescaler > 65535) {
			// cannot handle this situation when auto reload value and prescaler are bigger than 65535
			// TODO
			return;
		}
		timer_reload_value = 65535;
	}

	htim6.Init.Prescaler = timer_prescaler;
	htim6.Init.Period = timer_reload_value;
	HAL_TIM_Base_Init(&htim6);
}

void play_wav_file(char* wav_file) {
	if (pf_open(wav_file))  {
#ifdef DEBUG
		sprintf(debug_info, "[ERROR] Failed to open file %s ...\r\n", wav_file);
		print_error_and_halt(debug_info);
#else
		// display error and halt
		// TODO
		for(;;);
#endif
	}

	WavHeader_TypeDef wav_header;
	get_wav_info(wav_file, &wav_header);

	dac_trigger_timer_init(wav_header.sample_rate);

	UINT nr;
	pf_lseek(WAV_FILE_HEADER_SIZE); // skip wave file header
	pf_read(dac_buffer, DAC_BUFFER_SIZE, &nr);

	HAL_DAC_Start_DMA(&hdac1, DAC_CHANNEL_1, (uint32_t*)dac_buffer, DAC_BUFFER_SIZE, DAC_ALIGN_8B_R);
	HAL_TIM_Base_Start(&htim6);

	wav_file_is_playing = 1;
}

// stops the current wav file that is playing
void stop_playing_wav_file(void) {
	HAL_DAC_Stop_DMA(&hdac1, DAC_CHANNEL_1);
	HAL_TIM_Base_Stop(&htim6);
	wav_file_is_playing = 0;
}

// dma dac conversion complete callback
void HAL_DAC_ConvCpltCallbackCh1(DAC_HandleTypeDef* hdac) {
	UINT nr;
	pf_read((dac_buffer + DAC_BUFFER_HALF_SIZE), DAC_BUFFER_HALF_SIZE, &nr);

	// EOF reached
	if(nr == 0) {
#ifdef DEBUG
		print_info("EOF reached ...\r\n");
#endif
		stop_playing_wav_file();
	}
}

// dma dac conversion half complete callback
void HAL_DAC_ConvHalfCpltCallbackCh1(DAC_HandleTypeDef* hdac) {
	UINT nr;
	pf_read(dac_buffer, DAC_BUFFER_HALF_SIZE, &nr);

	// EOF reached
	if(nr == 0) {
#ifdef DEBUG
		print_info("EOF reached ...\r\n");
#endif
		stop_playing_wav_file();
	}
}

void delay(uint32_t ms) {
	uint32_t cnt = ms * 150;

	for (uint32_t i = 0; i < cnt; ++i) {
		dly_100us();
	}
}

int main(void) {
	/* MCU Configuration----------------------------------------------------------*/

	/* Reset of all peripherals, Initializes the Flash interface and the Systick. */
	HAL_Init();

	/* Configure the system clock */
	SystemClock_Config();

	/* Initialize all configured peripherals */
	MX_GPIO_Init();
	MX_DMA_Init();
	MX_DAC1_Init();
	MX_SPI1_Init();
	MX_USART2_UART_Init();
	MX_TIM6_Init();

	FATFS fs; // fs object

	mount_sd_card_fs(&fs);

	char* sounds_list[] = {
			"intro.wav",
			"party.wav",
			"castle.wav",
			"carousel.wav",
			"dog.wav",
			"cat.wav",
			"sheep.wav",
			"frog.wav",
			"cow.wav",
			"dolphin.wav",
			"seal.wav",
			"whale.wav"
	};

	for (;;) {
		for(uint8_t i = 0; i < (sizeof(sounds_list) / sizeof(char*)); ++i) {
			play_wav_file(sounds_list[i]);
			while(wav_file_is_playing); // wait until current song finishes playing
		}

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
void assert_failed(uint8_t* file, uint32_t line) {
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
