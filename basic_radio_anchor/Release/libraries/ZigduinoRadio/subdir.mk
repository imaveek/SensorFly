################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/Users/imaveek/SensorFly/libraries/ZigduinoRadio/ZigduinoRadio.cpp 

C_SRCS += \
/Users/imaveek/SensorFly/libraries/ZigduinoRadio/ZigduinoRadioEvents.c \
/Users/imaveek/SensorFly/libraries/ZigduinoRadio/ZigduinoRadioInC.c \
/Users/imaveek/SensorFly/libraries/ZigduinoRadio/radio_rfa.c \
/Users/imaveek/SensorFly/libraries/ZigduinoRadio/trx_datarate.c \
/Users/imaveek/SensorFly/libraries/ZigduinoRadio/trx_datarate_str.c \
/Users/imaveek/SensorFly/libraries/ZigduinoRadio/trx_rfa.c 

OBJS += \
./libraries/ZigduinoRadio/ZigduinoRadio.o \
./libraries/ZigduinoRadio/ZigduinoRadioEvents.o \
./libraries/ZigduinoRadio/ZigduinoRadioInC.o \
./libraries/ZigduinoRadio/radio_rfa.o \
./libraries/ZigduinoRadio/trx_datarate.o \
./libraries/ZigduinoRadio/trx_datarate_str.o \
./libraries/ZigduinoRadio/trx_rfa.o 

C_DEPS += \
./libraries/ZigduinoRadio/ZigduinoRadioEvents.d \
./libraries/ZigduinoRadio/ZigduinoRadioInC.d \
./libraries/ZigduinoRadio/radio_rfa.d \
./libraries/ZigduinoRadio/trx_datarate.d \
./libraries/ZigduinoRadio/trx_datarate_str.d \
./libraries/ZigduinoRadio/trx_rfa.d 

CPP_DEPS += \
./libraries/ZigduinoRadio/ZigduinoRadio.d 


# Each subdirectory must supply rules for building sources it contributes
libraries/ZigduinoRadio/ZigduinoRadio.o: /Users/imaveek/SensorFly/libraries/ZigduinoRadio/ZigduinoRadio.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: AVR C++ Compiler'
	avr-g++ -I"/Users/imaveek/SensorFly/libraries/zigduino" -I"/Users/imaveek/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/SensorFly/libraries/Misc" -I"/Users/imaveek/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/SensorFly/libraries/FlightControl" -I"/Users/imaveek/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/SensorFly/libraries/SPI" -I"/Users/imaveek/SensorFly/libraries/Wire" -I"/Users/imaveek/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/SensorFly/libraries/Timers" -I"/Users/imaveek/SensorFly/libraries/MPU6050" -I"/Users/imaveek/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -funsigned-char -funsigned-bitfields -fno-exceptions --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libraries/ZigduinoRadio/ZigduinoRadioEvents.o: /Users/imaveek/SensorFly/libraries/ZigduinoRadio/ZigduinoRadioEvents.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/Users/imaveek/SensorFly/libraries/zigduino" -I"/Users/imaveek/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/SensorFly/libraries/Misc" -I"/Users/imaveek/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/SensorFly/libraries/FlightControl" -I"/Users/imaveek/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/SensorFly/libraries/SPI" -I"/Users/imaveek/SensorFly/libraries/Wire" -I"/Users/imaveek/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/SensorFly/libraries/Timers" -I"/Users/imaveek/SensorFly/libraries/MPU6050" -I"/Users/imaveek/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -std=gnu99 --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libraries/ZigduinoRadio/ZigduinoRadioInC.o: /Users/imaveek/SensorFly/libraries/ZigduinoRadio/ZigduinoRadioInC.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/Users/imaveek/SensorFly/libraries/zigduino" -I"/Users/imaveek/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/SensorFly/libraries/Misc" -I"/Users/imaveek/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/SensorFly/libraries/FlightControl" -I"/Users/imaveek/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/SensorFly/libraries/SPI" -I"/Users/imaveek/SensorFly/libraries/Wire" -I"/Users/imaveek/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/SensorFly/libraries/Timers" -I"/Users/imaveek/SensorFly/libraries/MPU6050" -I"/Users/imaveek/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -std=gnu99 --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libraries/ZigduinoRadio/radio_rfa.o: /Users/imaveek/SensorFly/libraries/ZigduinoRadio/radio_rfa.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/Users/imaveek/SensorFly/libraries/zigduino" -I"/Users/imaveek/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/SensorFly/libraries/Misc" -I"/Users/imaveek/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/SensorFly/libraries/FlightControl" -I"/Users/imaveek/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/SensorFly/libraries/SPI" -I"/Users/imaveek/SensorFly/libraries/Wire" -I"/Users/imaveek/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/SensorFly/libraries/Timers" -I"/Users/imaveek/SensorFly/libraries/MPU6050" -I"/Users/imaveek/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -std=gnu99 --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libraries/ZigduinoRadio/trx_datarate.o: /Users/imaveek/SensorFly/libraries/ZigduinoRadio/trx_datarate.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/Users/imaveek/SensorFly/libraries/zigduino" -I"/Users/imaveek/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/SensorFly/libraries/Misc" -I"/Users/imaveek/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/SensorFly/libraries/FlightControl" -I"/Users/imaveek/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/SensorFly/libraries/SPI" -I"/Users/imaveek/SensorFly/libraries/Wire" -I"/Users/imaveek/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/SensorFly/libraries/Timers" -I"/Users/imaveek/SensorFly/libraries/MPU6050" -I"/Users/imaveek/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -std=gnu99 --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libraries/ZigduinoRadio/trx_datarate_str.o: /Users/imaveek/SensorFly/libraries/ZigduinoRadio/trx_datarate_str.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/Users/imaveek/SensorFly/libraries/zigduino" -I"/Users/imaveek/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/SensorFly/libraries/Misc" -I"/Users/imaveek/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/SensorFly/libraries/FlightControl" -I"/Users/imaveek/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/SensorFly/libraries/SPI" -I"/Users/imaveek/SensorFly/libraries/Wire" -I"/Users/imaveek/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/SensorFly/libraries/Timers" -I"/Users/imaveek/SensorFly/libraries/MPU6050" -I"/Users/imaveek/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -std=gnu99 --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libraries/ZigduinoRadio/trx_rfa.o: /Users/imaveek/SensorFly/libraries/ZigduinoRadio/trx_rfa.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/Users/imaveek/SensorFly/libraries/zigduino" -I"/Users/imaveek/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/SensorFly/libraries/Misc" -I"/Users/imaveek/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/SensorFly/libraries/FlightControl" -I"/Users/imaveek/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/SensorFly/libraries/SPI" -I"/Users/imaveek/SensorFly/libraries/Wire" -I"/Users/imaveek/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/SensorFly/libraries/Timers" -I"/Users/imaveek/SensorFly/libraries/MPU6050" -I"/Users/imaveek/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -std=gnu99 --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


