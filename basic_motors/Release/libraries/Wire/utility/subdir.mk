################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/Users/imaveek/SensorFly/libraries/Wire/utility/twi.c 

OBJS += \
./libraries/Wire/utility/twi.o 

C_DEPS += \
./libraries/Wire/utility/twi.d 


# Each subdirectory must supply rules for building sources it contributes
libraries/Wire/utility/twi.o: /Users/imaveek/SensorFly/libraries/Wire/utility/twi.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/Users/imaveek/SensorFly/libraries/zigduino" -I"/Users/imaveek/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/SensorFly/libraries/SPI" -I"/Users/imaveek/SensorFly/libraries/Wire" -I"/Users/imaveek/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/SensorFly/libraries/Timers" -I"/Users/imaveek/SensorFly/libraries/MPU6050" -I"/Users/imaveek/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -std=gnu99 --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


