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
#include "stm32f4xx_hal.h"
#include "dma.h"
#include "i2c.h"
#include "i2s.h"
#include "spi.h"
#include "usb_device.h"
#include "gpio.h"
#include "usbd_cdc_if.h"
#include "pff.h"
#include "string.h"

#define CS43L22_CODEC_ADDR	(0x4A << 1)
#define CS43L22_PWR_REG	0x02

FATFS fs; // fs object

//#define DEBUG

#ifdef DEBUG
#define DEBUG_BUFF_SIZE	512
char debug_info[DEBUG_BUFF_SIZE];
#endif

#define I2S_BUFFER_SIZE						4096
#define I2S_BUFFER_BYTES_SIZE				I2S_BUFFER_SIZE
#define I2S_BUFFER_BYTES_SIZE_HALF			(I2S_BUFFER_BYTES_SIZE / 2)
uint8_t i2s_buffer[I2S_BUFFER_SIZE];

volatile uint8_t wav_file_is_playing = 0;

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

/** System Clock Configuration
 */
void SystemClock_Config(void) {

	RCC_OscInitTypeDef RCC_OscInitStruct;
	RCC_ClkInitTypeDef RCC_ClkInitStruct;
	RCC_PeriphCLKInitTypeDef PeriphClkInitStruct;

	__PWR_CLK_ENABLE();

	__HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

	RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
	RCC_OscInitStruct.HSEState = RCC_HSE_ON;
	RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
	RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
	RCC_OscInitStruct.PLL.PLLM = 4;
	RCC_OscInitStruct.PLL.PLLN = 168;
	RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
	RCC_OscInitStruct.PLL.PLLQ = 7;
	HAL_RCC_OscConfig(&RCC_OscInitStruct);

	RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
			|RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
	RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
	RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
	RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
	RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;
	HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_5);

	PeriphClkInitStruct.PeriphClockSelection = RCC_PERIPHCLK_I2S;
	PeriphClkInitStruct.PLLI2S.PLLI2SN = 50;
	PeriphClkInitStruct.PLLI2S.PLLI2SR = 2;
	HAL_RCCEx_PeriphCLKConfig(&PeriphClkInitStruct);

	HAL_RCC_EnableCSS();

	HAL_SYSTICK_Config(HAL_RCC_GetHCLKFreq()/1000);

	HAL_SYSTICK_CLKSourceConfig(SYSTICK_CLKSOURCE_HCLK);

	/* SysTick_IRQn interrupt configuration */
	HAL_NVIC_SetPriority(SysTick_IRQn, 0, 0);
}

void print_to_console(char* msg) {
	CDC_Transmit_FS((uint8_t*)msg, strlen(msg));
}

void print_error_and_halt(char* msg) {
	uint32_t last_print = HAL_GetTick();
	for(;;) {
		if((HAL_GetTick() - last_print) >= 2000) {
			print_to_console(msg);
			last_print = HAL_GetTick();
		}
	}
}

void print_info(char* msg) {
	print_to_console(msg);
}

uint8_t cs43l22_read_codec_register(uint8_t register_addr) {
	uint8_t recv_data = 0;

	HAL_I2C_Mem_Read(&hi2c1, (uint16_t)CS43L22_CODEC_ADDR, (uint16_t)register_addr,
			sizeof(uint8_t), &recv_data, sizeof(uint8_t), HAL_MAX_DELAY);

	return recv_data;
}

void cs43l22_write_codec_register(uint8_t register_addr, uint8_t data) {
	HAL_I2C_Mem_Write(&hi2c1, (uint16_t)CS43L22_CODEC_ADDR, (uint16_t)register_addr,
			sizeof(uint8_t), &data, sizeof(uint8_t), HAL_MAX_DELAY);
}

void cs43l22_init(void) {
	HAL_GPIO_WritePin(Audio_RST_GPIO_Port, Audio_RST_Pin, RESET);
	HAL_Delay(10);
	HAL_GPIO_WritePin(Audio_RST_GPIO_Port, Audio_RST_Pin, SET);

	// CS43L22 required initialization sequence from datasheet
	// 1. Write 0x99 to register 0x00.
	// 2. Write 0x80 to register 0x47.
	// 3. Write ‘1’b to bit 7 in register 0x32.
	// 4. Write ‘0’b to bit 7 in register 0x32.
	// 5. Write 0x00 to register 0x00.

	cs43l22_write_codec_register(0x00, 0x99);
	cs43l22_write_codec_register(0x47, 0x80);
	cs43l22_write_codec_register(0x32, (cs43l22_read_codec_register(0x32) | (1 << 7)));
	cs43l22_write_codec_register(0x32, (cs43l22_read_codec_register(0x32) & ~(1 << 7)));
	cs43l22_write_codec_register(0x00, 0x00);

	// interface control register setup
	cs43l22_write_codec_register(0x06, 0b0010111);

	// enable treble/bass
	cs43l22_write_codec_register(0x1E, (cs43l22_read_codec_register(0x1E) | (1 << 0)));
	// treble/bass values
	cs43l22_write_codec_register(0x1F, 0x22);

	// Power up
	cs43l22_write_codec_register(CS43L22_PWR_REG, 0x9E);
}

void mount_sd_card_fs(FATFS* fs, uint8_t retries) {
	uint8_t fs_mount_retries = 0;

	// Initialize SD and file system.
#ifdef DEBUG
	print_info("[DEBUG] Mounting SD card ...\r\n");
#endif
	while (pf_mount(fs)) {
		if(++fs_mount_retries >= retries) {
#ifdef DEBUG
			print_error_and_halt("[ERROR] SD card mount failed ...\r\n");
#endif
		}
		HAL_Delay(10);
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

	UINT nr;
	pf_lseek(WAV_FILE_HEADER_SIZE); // skip wave file header
	pf_read((uint8_t*)i2s_buffer, I2S_BUFFER_BYTES_SIZE, &nr);

#ifdef DEBUG
	sprintf(debug_info, "[INFO] Playing wav file %s ...\r\n", wav_file);
	print_info(debug_info);
#endif
	HAL_I2S_Transmit_DMA(&hi2s3, (uint16_t*)i2s_buffer, I2S_BUFFER_BYTES_SIZE / 2);

	wav_file_is_playing = 1;
}

// stops the current wav file that is playing
void stop_playing_wav_file(void) {
	HAL_I2S_DMAStop(&hi2s3);
	wav_file_is_playing = 0;

	// mute headphones
	cs43l22_write_codec_register(0x0F, (cs43l22_read_codec_register(0x0F) | ((1 << 7) | (1 << 6))));

	// mute PCM
	cs43l22_write_codec_register(0x1A, (cs43l22_read_codec_register(0x1A) | (1 << 7)));

	// Power down
	cs43l22_write_codec_register(CS43L22_PWR_REG, 0x9F);
}

// I2S DMA half buffer transfer callback
void HAL_I2S_TxHalfCpltCallback(I2S_HandleTypeDef *hi2s) {
	if(hi2s->Instance == SPI3) {
		UINT nr;
		if(pf_read((uint8_t*)i2s_buffer, I2S_BUFFER_BYTES_SIZE_HALF, &nr) != FR_OK) {
			print_info("error reading file ...");
		}

#ifdef DEBUG
		sprintf(debug_info, "FS position: %lu \r\n", fs.fptr);
		print_info(debug_info);
#endif
		// EOF reached
		if(nr == 0) {
#ifdef DEBUG
			print_info("EOF reached ...\r\n");
#endif
			stop_playing_wav_file();
		}
	}
}

// I2S DMA full buffer transfer callback
void HAL_I2S_TxCpltCallback(I2S_HandleTypeDef *hi2s) {
	if(hi2s->Instance == SPI3) {
		UINT nr;
		if(pf_read(((uint8_t*)i2s_buffer + I2S_BUFFER_BYTES_SIZE_HALF), I2S_BUFFER_BYTES_SIZE_HALF, &nr) != FR_OK) {
			print_info("error reading file ...");
		}

		// EOF reached
		if(nr == 0) {
#ifdef DEBUG
			print_info("EOF reached ...\r\n");
#endif
			stop_playing_wav_file();
		}
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
	MX_I2C1_Init();
	MX_I2S3_Init();
#ifdef DEBUG
	MX_USB_DEVICE_Init();
#endif
	MX_SPI2_Init();

#ifdef DEBUG
	HAL_Delay(5000); // don't know how to detect when cdc device is ready
#endif

	cs43l22_init();

	mount_sd_card_fs(&fs, 10);

	play_wav_file("carousel.wav");

	for(;;) {

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
