################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/Users/imaveek/SensorFly/libraries/SPI/SPI.cpp 

OBJS += \
./libraries/SPI/SPI.o 

CPP_DEPS += \
./libraries/SPI/SPI.d 


# Each subdirectory must supply rules for building sources it contributes
libraries/SPI/SPI.o: /Users/imaveek/SensorFly/libraries/SPI/SPI.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: AVR C++ Compiler'
	avr-g++ -I"/Users/imaveek/SensorFly/libraries/zigduino" -I"/Users/imaveek/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/SensorFly/libraries/Misc" -I"/Users/imaveek/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/SensorFly/libraries/FlightControl" -I"/Users/imaveek/SensorFly/libraries/SPI" -I"/Users/imaveek/SensorFly/libraries/Wire" -I"/Users/imaveek/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/SensorFly/libraries/MPU6050" -I"/Users/imaveek/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/SensorFly/libraries/Timers" -I"/Users/imaveek/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -funsigned-char -funsigned-bitfields -fno-exceptions --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


