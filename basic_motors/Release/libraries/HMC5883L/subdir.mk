################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/Users/imaveek/SensorFly/libraries/HMC5883L/HMC5883L.cpp 

OBJS += \
./libraries/HMC5883L/HMC5883L.o 

CPP_DEPS += \
./libraries/HMC5883L/HMC5883L.d 


# Each subdirectory must supply rules for building sources it contributes
libraries/HMC5883L/HMC5883L.o: /Users/imaveek/SensorFly/libraries/HMC5883L/HMC5883L.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: AVR C++ Compiler'
	avr-g++ -I"/Users/imaveek/SensorFly/libraries/zigduino" -I"/Users/imaveek/SensorFly/libraries/SPI" -I"/Users/imaveek/SensorFly/libraries/Wire" -I"/Users/imaveek/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/SensorFly/libraries/MPU6050" -I"/Users/imaveek/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/SensorFly/libraries/Timers" -I"/Users/imaveek/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -funsigned-char -funsigned-bitfields -fno-exceptions --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

