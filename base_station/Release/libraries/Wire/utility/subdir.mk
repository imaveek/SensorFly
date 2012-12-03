################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire/utility/twi.c 

OBJS += \
./libraries/Wire/utility/twi.o 

C_DEPS += \
./libraries/Wire/utility/twi.d 


# Each subdirectory must supply rules for building sources it contributes
libraries/Wire/utility/twi.o: /Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire/utility/twi.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Timers" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Misc" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SPI" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MPU6050" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -std=gnu99 --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


