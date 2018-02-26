/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  ** This notice applies to any and all portions of this file
  * that are not between comment pairs USER CODE BEGIN and
  * USER CODE END. Other portions of this file, whether 
  * inserted by the user or by software development tools
  * are owned by their respective copyright owners.
  *
  * COPYRIGHT(c) 2018 STMicroelectronics
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H__
#define __MAIN_H__

/* Includes ------------------------------------------------------------------*/

/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private define ------------------------------------------------------------*/

#define BTN_1_Pin GPIO_PIN_0
#define BTN_1_GPIO_Port GPIOC
#define BTN_1_EXTI_IRQn EXTI0_IRQn
#define BTN_2_Pin GPIO_PIN_1
#define BTN_2_GPIO_Port GPIOC
#define BTN_2_EXTI_IRQn EXTI1_IRQn
#define BTN_3_Pin GPIO_PIN_2
#define BTN_3_GPIO_Port GPIOC
#define BTN_3_EXTI_IRQn EXTI2_IRQn
#define BTN_4_Pin GPIO_PIN_3
#define BTN_4_GPIO_Port GPIOC
#define BTN_4_EXTI_IRQn EXTI3_IRQn
#define PAM8403_MUTE_Pin GPIO_PIN_1
#define PAM8403_MUTE_GPIO_Port GPIOA
#define PAM8403_STANDBY_Pin GPIO_PIN_2
#define PAM8403_STANDBY_GPIO_Port GPIOA
#define I2S_LRCLK_Pin GPIO_PIN_4
#define I2S_LRCLK_GPIO_Port GPIOA
#define I2S_BCLK_Pin GPIO_PIN_5
#define I2S_BCLK_GPIO_Port GPIOA
#define I2S_DATA_Pin GPIO_PIN_7
#define I2S_DATA_GPIO_Port GPIOA
#define PCM5100_MUTE_Pin GPIO_PIN_4
#define PCM5100_MUTE_GPIO_Port GPIOC
#define I2S_MCLK_Pin GPIO_PIN_10
#define I2S_MCLK_GPIO_Port GPIOB
#define SD_SCLK_Pin GPIO_PIN_13
#define SD_SCLK_GPIO_Port GPIOB
#define SD_DO_Pin GPIO_PIN_14
#define SD_DO_GPIO_Port GPIOB
#define SD_DI_Pin GPIO_PIN_15
#define SD_DI_GPIO_Port GPIOB
#define BTN_5_Pin GPIO_PIN_6
#define BTN_5_GPIO_Port GPIOC
#define BTN_5_EXTI_IRQn EXTI9_5_IRQn
#define BTN_6_Pin GPIO_PIN_7
#define BTN_6_GPIO_Port GPIOC
#define BTN_6_EXTI_IRQn EXTI9_5_IRQn
#define BTN_7_Pin GPIO_PIN_8
#define BTN_7_GPIO_Port GPIOC
#define BTN_7_EXTI_IRQn EXTI9_5_IRQn
#define SD_CS_Pin GPIO_PIN_9
#define SD_CS_GPIO_Port GPIOC
#define BTN_8_Pin GPIO_PIN_9
#define BTN_8_GPIO_Port GPIOA
#define BTN_8_EXTI_IRQn EXTI9_5_IRQn
#define BTN_9_Pin GPIO_PIN_10
#define BTN_9_GPIO_Port GPIOA
#define BTN_9_EXTI_IRQn EXTI15_10_IRQn
#define BTN_10_Pin GPIO_PIN_11
#define BTN_10_GPIO_Port GPIOA
#define BTN_10_EXTI_IRQn EXTI15_10_IRQn
#define BTN_11_Pin GPIO_PIN_12
#define BTN_11_GPIO_Port GPIOA
#define BTN_11_EXTI_IRQn EXTI15_10_IRQn
#define TMS_Pin GPIO_PIN_13
#define TMS_GPIO_Port GPIOA
#define TCK_Pin GPIO_PIN_14
#define TCK_GPIO_Port GPIOA
#define SWO_Pin GPIO_PIN_3
#define SWO_GPIO_Port GPIOB

/* ########################## Assert Selection ############################## */
/**
  * @brief Uncomment the line below to expanse the "assert_param" macro in the 
  *        HAL drivers code
  */
/* #define USE_FULL_ASSERT    1U */

/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
 extern "C" {
#endif
void _Error_Handler(char *, int);

#define Error_Handler() _Error_Handler(__FILE__, __LINE__)
#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H__ */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
