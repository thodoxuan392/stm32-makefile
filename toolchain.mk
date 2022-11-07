TOOLCHAIN_PATH = /opt/st/stm32cubeide_1.10.1/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.10.3-2021.10.linux64_1.0.0.202111181127/tools



#######################################
# binaries
#######################################
GCC_BINARY_PATH = $(TOOLCHAIN_PATH)/bin
PREFIX = arm-none-eabi-
# The gcc compiler bin path can be either defined in make command via GCC_PATH variable (> make GCC_PATH=xxx)
# either it can be added to the PATH environment variable.
CC = $(GCC_BINARY_PATH)/$(PREFIX)gcc
AS = $(GCC_BINARY_PATH)/$(PREFIX)gcc -x assembler-with-cpp
CP = $(GCC_BINARY_PATH)/$(PREFIX)objcopy
SZ = $(GCC_BINARY_PATH)/$(PREFIX)size
HEX = $(CP) -O ihex
BIN = $(CP) -O binary -S


#Include
GCC_INCLUDE_PATH = $(TOOLCHAIN_PATH)/arm-none-eabi/include \
$(TOOLCHAIN_PATH)/arm-none-eabi/newlib-nano \
$(TOOLCHAIN_PATH)/lib/gcc/arm-none-eabi/10.3.1/include \
$(TOOLCHAIN_PATH)/lib/gcc/arm-none-eabi/10.3.1/include-fixed

#Lib