# Deploy STM32 Image into Remote Target
This allow to normally develop in STM32CubeIDE, then deploy image to remote target.

*Note* In case Flash remote device, Remote Machine must install SSH-Server.
## Prerequisite
**In Remote Machine:**
- SSH Server
- ST-Tools , st-flash

**In Local Machine**
- Toolchains for Arm Cortex or install STM32CubeIDE
- Make

## Configuration Board
In [Board Define file](./board.mk), you must change BOARD_FAMILY and BOARD_DEFINE same with your board

## Configurate SSH Key-Pair
You must create ssh-key in your machine, and add public key to remote machine.
- Private Key will be located at [*Cert*](./Cert) folder.
- Public Key will be put in Remote Server.

Create SSHKEY-Pair
```
ssh-keygen
```
Entering Name of Key, example: **stm32key**



## Step by Step
1. Clean Project
    ```
    make clean
    ```
2. Compile Project
    ```
    make all
    ```
3. Flash local device

    st-flash will automatically detect the target device in your machine.
    ```
    make flash-local
    ```
4. Flash Remote device
    ```
    make flash-remote USER=$(USERNAME) PASSWD=$(PASSOFUSER) SERVER=$(REMOTE_SERVER) PORT={SSH_PORT}
    ```
    **Example**
    ```
    make flash-remote USER=xuanthodo PASSWD=22041999 SERVER=0.tcp.ap.ngrok.io PORT=10865
    ```