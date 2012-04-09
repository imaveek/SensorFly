################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include libraries/zigduino/subdir.mk
-include libraries/ZigduinoRadio/subdir.mk
-include libraries/Wire/utility/subdir.mk
-include libraries/Wire/subdir.mk
-include libraries/Timers/subdir.mk
-include libraries/SoftwareSerial/subdir.mk
-include libraries/SPI/subdir.mk
-include libraries/Misc/subdir.mk
-include libraries/MaxBotix/subdir.mk
-include libraries/MPU6050/subdir.mk
-include libraries/LowPassFilter/subdir.mk
-include libraries/I2Cdev/subdir.mk
-include libraries/HMC5883L/subdir.mk
-include libraries/FlightControl/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
LSS += \
base_station.lss \

FLASH_IMAGE += \
base_station.hex \

EEPROM_IMAGE += \
base_station.eep \

SIZEDUMMY += \
sizedummy \


# All Target
all: base_station.elf secondary-outputs

# Tool invocations
base_station.elf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: AVR C++ Linker'
	avr-gcc --cref -s -Os -o"base_station.elf" $(OBJS) $(USER_OBJS) $(LIBS) -lm -Wl,-Map,base_station.map,--cref -Wl,--gc-sections -mmcu=atmega128rfa1
	@echo 'Finished building target: $@'
	@echo ' '

base_station.lss: base_station.elf
	@echo 'Invoking: AVR Create Extended Listing'
	-avr-objdump -h -S base_station.elf  >"base_station.lss"
	@echo 'Finished building: $@'
	@echo ' '

base_station.hex: base_station.elf
	@echo 'Create Flash image (ihex format)'
	-avr-objcopy -R .eeprom -O ihex base_station.elf  "base_station.hex"
	@echo 'Finished building: $@'
	@echo ' '

base_station.eep: base_station.elf
	@echo 'Create eeprom image (ihex format)'
	-avr-objcopy -j .eeprom --no-change-warnings --change-section-lma .eeprom=0 -O ihex base_station.elf  "base_station.eep"
	@echo 'Finished building: $@'
	@echo ' '

sizedummy: base_station.elf
	@echo 'Invoking: Print Size'
	-avr-size --format=avr --mcu=atmega128rfa1 base_station.elf
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EEPROM_IMAGE)$(ELFS)$(FLASH_IMAGE)$(LSS)$(S_DEPS)$(CXX_DEPS)$(S_UPPER_DEPS)$(C++_DEPS)$(ASM_DEPS)$(CC_DEPS)$(CPP_DEPS)$(C_UPPER_DEPS)$(SIZEDUMMY) base_station.elf
	-@echo ' '

secondary-outputs: $(LSS) $(FLASH_IMAGE) $(EEPROM_IMAGE) $(SIZEDUMMY)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
