################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/CDC.cpp \
/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/HID.cpp \
/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/HardwareSerial.cpp \
/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/IPAddress.cpp \
/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/Print.cpp \
/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/Stream.cpp \
/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/Tone.cpp \
/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/USBCore.cpp \
/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/WMath.cpp \
/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/WString.cpp \
/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/new.cpp 

C_SRCS += \
/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/WInterrupts.c \
/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/wiring.c \
/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/wiring_analog.c \
/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/wiring_digital.c \
/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/wiring_pulse.c \
/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/wiring_shift.c 

OBJS += \
./libraries/zigduino/CDC.o \
./libraries/zigduino/HID.o \
./libraries/zigduino/HardwareSerial.o \
./libraries/zigduino/IPAddress.o \
./libraries/zigduino/Print.o \
./libraries/zigduino/Stream.o \
./libraries/zigduino/Tone.o \
./libraries/zigduino/USBCore.o \
./libraries/zigduino/WInterrupts.o \
./libraries/zigduino/WMath.o \
./libraries/zigduino/WString.o \
./libraries/zigduino/new.o \
./libraries/zigduino/wiring.o \
./libraries/zigduino/wiring_analog.o \
./libraries/zigduino/wiring_digital.o \
./libraries/zigduino/wiring_pulse.o \
./libraries/zigduino/wiring_shift.o 

C_DEPS += \
./libraries/zigduino/WInterrupts.d \
./libraries/zigduino/wiring.d \
./libraries/zigduino/wiring_analog.d \
./libraries/zigduino/wiring_digital.d \
./libraries/zigduino/wiring_pulse.d \
./libraries/zigduino/wiring_shift.d 

CPP_DEPS += \
./libraries/zigduino/CDC.d \
./libraries/zigduino/HID.d \
./libraries/zigduino/HardwareSerial.d \
./libraries/zigduino/IPAddress.d \
./libraries/zigduino/Print.d \
./libraries/zigduino/Stream.d \
./libraries/zigduino/Tone.d \
./libraries/zigduino/USBCore.d \
./libraries/zigduino/WMath.d \
./libraries/zigduino/WString.d \
./libraries/zigduino/new.d 


# Each subdirectory must supply rules for building sources it contributes
libraries/zigduino/CDC.o: /Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/CDC.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: AVR C++ Compiler'
	avr-g++ -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Misc" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/FlightControl" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SPI" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MPU6050" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Timers" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -funsigned-char -funsigned-bitfields -fno-exceptions --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libraries/zigduino/HID.o: /Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/HID.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: AVR C++ Compiler'
	avr-g++ -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Misc" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/FlightControl" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SPI" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MPU6050" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Timers" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -funsigned-char -funsigned-bitfields -fno-exceptions --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libraries/zigduino/HardwareSerial.o: /Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/HardwareSerial.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: AVR C++ Compiler'
	avr-g++ -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Misc" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/FlightControl" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SPI" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MPU6050" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Timers" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -funsigned-char -funsigned-bitfields -fno-exceptions --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libraries/zigduino/IPAddress.o: /Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/IPAddress.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: AVR C++ Compiler'
	avr-g++ -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Misc" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/FlightControl" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SPI" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MPU6050" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Timers" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -funsigned-char -funsigned-bitfields -fno-exceptions --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libraries/zigduino/Print.o: /Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/Print.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: AVR C++ Compiler'
	avr-g++ -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Misc" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/FlightControl" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SPI" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MPU6050" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Timers" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -funsigned-char -funsigned-bitfields -fno-exceptions --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libraries/zigduino/Stream.o: /Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/Stream.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: AVR C++ Compiler'
	avr-g++ -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Misc" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/FlightControl" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SPI" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MPU6050" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Timers" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -funsigned-char -funsigned-bitfields -fno-exceptions --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libraries/zigduino/Tone.o: /Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/Tone.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: AVR C++ Compiler'
	avr-g++ -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Misc" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/FlightControl" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SPI" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MPU6050" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Timers" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -funsigned-char -funsigned-bitfields -fno-exceptions --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libraries/zigduino/USBCore.o: /Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/USBCore.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: AVR C++ Compiler'
	avr-g++ -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Misc" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/FlightControl" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SPI" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MPU6050" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Timers" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -funsigned-char -funsigned-bitfields -fno-exceptions --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libraries/zigduino/WInterrupts.o: /Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/WInterrupts.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Misc" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/FlightControl" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SPI" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Timers" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MPU6050" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -std=gnu99 --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libraries/zigduino/WMath.o: /Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/WMath.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: AVR C++ Compiler'
	avr-g++ -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Misc" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/FlightControl" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SPI" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MPU6050" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Timers" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -funsigned-char -funsigned-bitfields -fno-exceptions --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libraries/zigduino/WString.o: /Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/WString.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: AVR C++ Compiler'
	avr-g++ -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Misc" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/FlightControl" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SPI" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MPU6050" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Timers" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -funsigned-char -funsigned-bitfields -fno-exceptions --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libraries/zigduino/new.o: /Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/new.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: AVR C++ Compiler'
	avr-g++ -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Misc" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/FlightControl" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SPI" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MPU6050" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Timers" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -funsigned-char -funsigned-bitfields -fno-exceptions --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libraries/zigduino/wiring.o: /Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/wiring.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Misc" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/FlightControl" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SPI" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Timers" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MPU6050" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -std=gnu99 --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libraries/zigduino/wiring_analog.o: /Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/wiring_analog.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Misc" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/FlightControl" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SPI" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Timers" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MPU6050" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -std=gnu99 --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libraries/zigduino/wiring_digital.o: /Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/wiring_digital.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Misc" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/FlightControl" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SPI" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Timers" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MPU6050" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -std=gnu99 --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libraries/zigduino/wiring_pulse.o: /Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/wiring_pulse.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Misc" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/FlightControl" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SPI" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Timers" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MPU6050" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -std=gnu99 --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libraries/zigduino/wiring_shift.o: /Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino/wiring_shift.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/zigduino" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Comp6DOF" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MaxBotix" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SoftwareSerial" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Misc" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/LowPassFilter" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/FlightControl" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/ZigduinoRadio/boards" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/SPI" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/I2Cdev" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Timers" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/MPU6050" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/Wire/utility" -I"/Users/imaveek/Dropbox/Research/Projects/SensorFly/libraries/HMC5883L" -Wall -Os -ffunction-sections -fdata-sections -std=gnu99 --pedantic -c -mmcu=atmega128rfa1 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


