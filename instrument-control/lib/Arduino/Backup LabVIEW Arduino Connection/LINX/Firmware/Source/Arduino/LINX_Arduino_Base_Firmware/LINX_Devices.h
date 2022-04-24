/****************************************************************************************
**  LINX Devices
**
**
**
****************************************************************************************/

#include "LINX_Config.h"

/****************************************************************************************
**  DIGILENT
****************************************************************************************/

/*----------------------------------------- UNO32 --------------------------------------*/
#ifdef CHIPKIT_UNO32
  //Device ID
  #define DEVICE_FAMILY 1
  #define DEVICE_ID 0
  //Peripheral
  #define LINX_DIGITAL_ENABLED 1
  #define LINX_I2C_ENABLED 1
  #define LINX_ANALOG_INPUT_ENABLED 1
  #define AI_RESOLUTION 10
  //#define LINX_ANALOG_OUTPUT_ENABLED 1
  #define LINX_PWM_ENABLED 1
  #define LINX_SPI_ENABLED 1
  //#define LINX_UART_ENABLED 1
  #define LINX_NVS_ENABLED 1
#endif //CHIPKIT_UNO32

/*---------------------------------------- UC32 --------------------------------------*/
#ifdef CHIPKIT_UC32
  //Device ID
  #define DEVICE_FAMILY 1
  #define DEVICE_ID 1  
  //Peripheral
  #define LINX_DIGITAL_ENABLED 1
  #define LINX_I2C_ENABLED 1
  #define LINX_ANALOG_INPUT_ENABLED 1
  #define AI_RESOLUTION 10
  //#define LINX_ANALOG_OUTPUT_ENABLED 1
  #define LINX_PWM_ENABLED 1
  #define LINX_SPI_ENABLED 1
  //#define LINX_UART_ENABLED 1
  #define LINX_NVS_ENABLED 1
#endif //CHIPKIT_UC32

/*---------------------------------------- MAX32 --------------------------------------*/
#ifdef CHIPKIT_MAX32
  //Device ID
  #define DEVICE_FAMILY 1
  #define DEVICE_ID 2
  //Peripheral
  #define LINX_DIGITAL_ENABLED 1
  #define LINX_I2C_ENABLED 1
  #define LINX_ANALOG_INPUT_ENABLED 1
  #define AI_RESOLUTION 10
  //#define LINX_ANALOG_OUTPUT_ENABLED 1
  #define LINX_PWM_ENABLED 1
  #define LINX_SPI_ENABLED 1
  #define LINX_UART_ENABLED 1
  #define LINX_NVS_ENABLED 1
#endif //CHIPKIT_MAX32

/*----------------------------------------- WF32 --------------------------------------*/
#ifdef CHIPKIT_WF32
  //Device ID
  #define DEVICE_FAMILY 1
  #define DEVICE_ID 3
  //Peripheral
  #define LINX_DIGITAL_ENABLED 1
  #define LINX_I2C_ENABLED 1
  #define LINX_ANALOG_INPUT_ENABLED 1
  #define AI_RESOLUTION 10
  //#define LINX_ANALOG_OUTPUT_ENABLED 1
  #define LINX_PWM_ENABLED 1
  #define LINX_SPI_ENABLED 1
  //#define LINX_UART_ENABLED 1
  #define LINX_NVS_ENABLED 1
#endif //CHIPKIT_WF32


/****************************************************************************************
**  ARDUINO
****************************************************************************************/

/*----------------------------------------- UNO --------------------------------------*/
#ifdef ARDUINO_UNO
  //Device ID
  #define DEVICE_FAMILY 2
  #define DEVICE_ID 0
  //Peripheral
  #define LINX_DIGITAL_ENABLED 1
  #define LINX_I2C_ENABLED 1
  #define LINX_ANALOG_INPUT_ENABLED 1
  #define AI_RESOLUTION 10
  //#define LINX_ANALOG_OUTPUT_ENABLED 1
  #define LINX_PWM_ENABLED 1
  #define LINX_SPI_ENABLED 1
  //#define LINX_UART_ENABLED 1
  #define LINX_NVS_ENABLED 1
#endif //ARDUINO_UNO

/*---------------------------------------- MEGA2560 --------------------------------------*/
#ifdef ARDUINO_MEGA2560
  //Device ID
  #define DEVICE_FAMILY 2
  #define DEVICE_ID 1
  //Peripheral
  #define LINX_DIGITAL_ENABLED 1
  #define LINX_I2C_ENABLED 1
  #define LINX_ANALOG_INPUT_ENABLED 1
  #define AI_RESOLUTION 10
  //#define LINX_ANALOG_OUTPUT_ENABLED 1
  #define LINX_PWM_ENABLED 1
  #define LINX_SPI_ENABLED 1
  #define LINX_UART_ENABLED 1
  #define LINX_NVS_ENABLED 1
#endif //ARDUINO_MEGA2560

/*----------------------------------------- NANO --------------------------------------*/
#ifdef ARDUINO_NANO
  //Device ID
  #define DEVICE_FAMILY 2
  #define DEVICE_ID 5
  //Peripheral
  #define LINX_DIGITAL_ENABLED 1
  #define LINX_I2C_ENABLED 1
  #define LINX_ANALOG_INPUT_ENABLED 1
  #define AI_RESOLUTION 10
  //#define LINX_ANALOG_OUTPUT_ENABLED 1
  #define LINX_PWM_ENABLED 1
  #define LINX_SPI_ENABLED 1
  //#define LINX_UART_ENABLED 1
  #define LINX_NVS_ENABLED 1
#endif //ARDUINO_NANO


/****************************************************************************************
**  PJRC
****************************************************************************************/

/*----------------------------------------- TEENSY 3.0  --------------------------------------*/
#ifdef PJRC_TEENSY_30
  //Device ID
  #define DEVICE_FAMILY 3
  #define DEVICE_ID 2
  //Peripheral
  #define LINX_DIGITAL_ENABLED 1
  #define LINX_I2C_ENABLED 1
  #define LINX_ANALOG_INPUT_ENABLED 1
  #define AI_RESOLUTION 13
  //#define LINX_ANALOG_OUTPUT_ENABLED 1
  #define LINX_PWM_ENABLED 1
  #define LINX_SPI_ENABLED 1
  #define LINX_UART_ENABLED 1
  #define LINX_NVS_ENABLED 1
#endif //ARDUINO_UNO


