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
#include "main.h"
#include "stm32f4xx_hal.h"
#include "dma.h"
#include "i2s.h"
#include "spi.h"
#include "gpio.h"
#include "pff.h"

#define I2S_BUFFER_SIZE                     8192
#define I2S_BUFFER_BYTES_SIZE               I2S_BUFFER_SIZE
#define I2S_BUFFER_BYTES_SIZE_HALF          (I2S_BUFFER_BYTES_SIZE / 2)
uint8_t i2s_buffer[I2S_BUFFER_SIZE];

volatile uint8_t wav_file_is_playing = 0;

#define WAV_FILE_HEADER_SIZE    44
typedef struct {
	char riff[4];               // should be "RIFF"
	uint32_t file_size;         // file size in bytes - 8 bytes
	char type[4];               // should be "WAVE"
	char fmt[4];
	uint32_t fmt_len;
	uint16_t fmt_type;
	uint16_t channels;          // audio channels
	uint32_t sample_rate;       // sample rate in Hz
	uint32_t sr_bit_ch;         // (Sample Rate * Bit Size * Channels) / 8
	uint16_t bit_ch;            // (Bit Size * Channels) / 8
	uint16_t bps;               // Bits per sample (Bit Size * Samples)
	char data[4];               // should be "data"
	uint32_t data_size;         // total wav raw data size
} WavHeader_TypeDef;

/** System Clock Configuration
 */
void SystemClock_Config(void) {
	RCC_OscInitTypeDef RCC_OscInitStruct;
	RCC_ClkInitTypeDef RCC_ClkInitStruct;
	RCC_PeriphCLKInitTypeDef PeriphClkInitStruct;

	/**Configure the main internal regulator output voltage
	 */
	__HAL_RCC_PWR_CLK_ENABLE();

	__HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

	/**Initializes the CPU, AHB and APB busses clocks
	 */
	RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
	RCC_OscInitStruct.HSIState = RCC_HSI_ON;
	RCC_OscInitStruct.HSICalibrationValue = 16;
	RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
	RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
	RCC_OscInitStruct.PLL.PLLM = 8;
	RCC_OscInitStruct.PLL.PLLN = 100;
	RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
	RCC_OscInitStruct.PLL.PLLQ = 4;
	RCC_OscInitStruct.PLL.PLLR = 2;
	if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK) {
		Error_Handler();
	}

	/**Initializes the CPU, AHB and APB busses clocks
	 */
	RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_SYSCLK
			| RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2;
	RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
	RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
	RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
	RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

	if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_3) != HAL_OK) {
		Error_Handler();
	}

	PeriphClkInitStruct.PeriphClockSelection = RCC_PERIPHCLK_I2S;
	PeriphClkInitStruct.I2SClockSelection = RCC_I2SAPBCLKSOURCE_PLLR;
	if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInitStruct) != HAL_OK) {
		Error_Handler();
	}

	/**Configure the Systick interrupt time
	 */
	HAL_SYSTICK_Config(HAL_RCC_GetHCLKFreq() / 1000);

	/**Configure the Systick
	 */
	HAL_SYSTICK_CLKSourceConfig(SYSTICK_CLKSOURCE_HCLK);

	/* SysTick_IRQn interrupt configuration */
	HAL_NVIC_SetPriority(SysTick_IRQn, 0, 0);
}

/**
 * @brief  This function is executed in case of error occurrence.
 * @param  None
 * @retval None
 */
void Error_Handler(void) {
	/* User can add his own implementation to report the HAL error return state */
	while (1) {
	}
}

void mount_sd_card_fs(FATFS* fs, uint8_t retries) {
	uint8_t fs_mount_retries = 0;

	// Initialize SD and file system.
	while (pf_mount(fs)) {
		if (++fs_mount_retries >= retries) {
			// TO DO
			// error mounting sd card
		}
		HAL_Delay(10);
	}
}

void get_wav_info(char* wav_file, WavHeader_TypeDef* header) {
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
}

void play_wav_file(char* wav_file) {
	if (pf_open(wav_file)) {
		// Failed to open file
		// TODO
	}

	WavHeader_TypeDef wav_header;
	get_wav_info(wav_file, &wav_header);

	UINT nr;
	pf_lseek(WAV_FILE_HEADER_SIZE); // skip wave file header
	pf_read((uint8_t*) i2s_buffer, I2S_BUFFER_BYTES_SIZE, &nr);

	HAL_I2S_Transmit_DMA(&hi2s1, (uint16_t*) i2s_buffer,
			I2S_BUFFER_BYTES_SIZE / 2);

	// unmute PCM and get power amplifier out of shutdown mode
	HAL_GPIO_WritePin(PAM8403_STANDBY_GPIO_Port, PAM8403_STANDBY_Pin,
			GPIO_PIN_SET);
	HAL_GPIO_WritePin(PCM5100_MUTE_GPIO_Port, PCM5100_MUTE_Pin, GPIO_PIN_SET);

	wav_file_is_playing = 1;
}

// stops the current wav file that is playing
void stop_playing_wav_file(void) {
	HAL_I2S_DMAStop(&hi2s1);
	wav_file_is_playing = 0;

	// mute PCM and put audio power amplifier in shutdown mode
	HAL_GPIO_WritePin(PAM8403_STANDBY_GPIO_Port, PAM8403_STANDBY_Pin,
			GPIO_PIN_RESET);
	HAL_GPIO_WritePin(PCM5100_MUTE_GPIO_Port, PCM5100_MUTE_Pin, GPIO_PIN_RESET);

	// Put core mcu into sleep mode

}

// I2S DMA half buffer transfer callback
void HAL_I2S_TxHalfCpltCallback(I2S_HandleTypeDef *hi2s) {
	if (hi2s->Instance == SPI1) {
		UINT nr;
		if (pf_read((uint8_t*) i2s_buffer, I2S_BUFFER_BYTES_SIZE_HALF, &nr)
				!= FR_OK) {
			// Failed to read file
			// TODO
		}

		// EOF reached
		if (nr == 0) {
			stop_playing_wav_file();
		}
	}
}

// I2S DMA full buffer transfer callback
void HAL_I2S_TxCpltCallback(I2S_HandleTypeDef *hi2s) {
	if (hi2s->Instance == SPI1) {
		UINT nr;
		if (pf_read(((uint8_t*) i2s_buffer + I2S_BUFFER_BYTES_SIZE_HALF),
				I2S_BUFFER_BYTES_SIZE_HALF, &nr) != FR_OK) {
			// Failed to read file
			// TODO
		}

		// EOF reached
		if (nr == 0) {
			stop_playing_wav_file();
		}
	}
}

// handle keys
void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin) {

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
	MX_I2S1_Init();
	MX_SPI2_Init();

	FATFS fs; // fs object

	mount_sd_card_fs(&fs, 10);

	char* sounds_list[] = { "intro.wav", "party.wav", "castle.wav",
			"carousel.wav", "child1.wav", "child2.wav", "dog.wav", "cat.wav",
			"sheep.wav", "frog.wav", "cow.wav", "dolphin.wav", "seal.wav",
			"whale.wav" };

	for (;;) {
		for (uint8_t i = 0; i < (sizeof(sounds_list) / sizeof(char*)); ++i) {
			play_wav_file(sounds_list[i]);
			while (wav_file_is_playing)
				;  // wait until current song finishes playing
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

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
