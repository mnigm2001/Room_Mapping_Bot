# Room_Mapping_Bot
 In this academic project, I've developed an embedded spatial measurement and plotting bot. Using a MSP432E401Y microcontroller, time of flight (ToF) sensor, stepper motor, and other components, I developed a semi-autonomous bot that’s able to scan and map any space.   In addition to this, a complete data sheet of the system was written including a detailed description of device characteristics, functionality, applications, and limitations.

The functionality of this device can be separated into 3 segments of data acquisition,transmission, then processing, and visualization. Data acquisition begins at the VL53LIX time of flight sensor(ToF) which takes distance measurements. This sensor is mounted onto a 28BYJ-48 stepper motor which rotates clockwise and stops at a specified angle to take distance measurements. Then the measurements are transferred from the ToF to the MCU using I2C then to the PC using UART. The python code processes the data and calculates the x, y, and z dimensions for MATLAB to visually plot on a 3D graph.

Technology Used:
- MSP432E401Y Microcontroller
- Keil MDK Software Development Environment- VL53L1X Time of Flight(ToF) Sensor- 28BYJ-48 Stepper Motor- ULN2003 Motor Driver

