# Deploy STM32 Image into Remote Target
This allow to normally develop in STM32CubeIDE, then deploy image to remote target.

*Note* In case Flash remote device, Remote Machine must install SSH-Server.
## Prerequisite

**In Local Machine**
- Toolchains for Arm Cortex or install STM32CubeIDE
- Make
## Toolchain PATH Configuration
- Default PATH: Version **stm32.9-2020-q2-update**
    ```
    C:/ST/STM32CubeIDE_1.7.0/STM32CubeIDE/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.9-2020-q2-update.win32_2.0.0.202105311346/tools
    ```
- Check PATH in STM32CubeIDE:

    **Project**-> **Propertise** -> **C/C++ Build** -> **Environment**
    
    In the **Value** box, Get first element of **PATH**

- Update PATH to [Toolchain file](./toolchain.mk)

    ```
    TOOLCHAIN_PATH = C:/ST/STM32CubeIDE_1.7.0/STM32CubeIDE/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.9-2020-q2-update.win32_2.0.0.202105311346/tools
    ```

## Board Configuration 
In [Board Define file](./board.mk), you must change BOARD_FAMILY and BOARD_DEFINE same with your board

**Example:** 

Your board is **STM32F103C6**
```
BOARD_FAMILY = STM32F1xx
BOARD_DEFINE = STM32F103x6
```
Your board is **STM32F103RBT6**
```
BOARD_FAMILY = STM32F1xx
BOARD_DEFINE = STM32F103xB
```

## Build Project
```
make all
```
## Clean Project
```
make clean
```
## Flash local device
*Note: Only for Ubuntu*

st-flash will automatically detect the target device in your machine.
```
make flash-local
```

## Flash Remote device
```
make flash-remote USER=$(USERNAME) PASSWD=$(PASSOFUSER) SERVER=$(REMOTE_SERVER) PORT=(SSH_PORT)
```
**Example**
```
make flash-remote USER=xuanthodo PASSWD=12345678 SERVER=0.tcp.ap.ngrok.io PORT=12896
```
*Note: The PORT or SSH_PORT can be changed. Please request new PORT at anytime access to deploy in remote device.*
