# Labview Integration Software

Integration software for the following devices:
- Olympus IX81
- Maerzhäuser TANGO X-Y-Stage Controller
- SOLA Light Engine
- ANDOR iXon3-888 DU8201_BV (Controller CCI-20)
- A custom made 24-valve controller, based on an Arduino Mega 2560
- TODO: Elveflow OB1 Pressure Controller

## Open ToDos

### CRUCIAL

- Review Time Calculation procedure 

  __DONE__ Timing of pumps

  __DONE__ Duration for light source availability

  + Timing of physical change
    +  SingleRing:
		- Feed: 6-7 ms per Valve Action Step
		- Pump: 
  + Transfer Timing and Process Finish Events/Handlers
 
- Queue for continuous loop still buggy
- Adjust Jogsens with objective
- Limit z-Movement with Objective
- Adapt everything for Maerkl reactor
- Handle the Camera Events properly (Performance enhancing):
	Make a dynamic event (LV), register it (LV). Make an event case for it (LV). Then, create the event handle (dll) and start a dynamic vi (LV) that waits for it (dll). When it's done, trigger the event (generate user event).


### PRIO0
- Lampenknöpfe

### PRIO1
- allgemeines Error-Handling
- Dokumentation

### PRIO2

### IDEA
- Correct PDMS angle in camera pictures and implement it also in the Stage movement



## Initial LabView Package Configuration
Generally, every library can be configured standalone from the _lib_ folder of the project. Instructions for every API are supplied in the respective folder. In the following, several basic fixes for common bugs as well as usage hints with the project are explained.

### Olympus IX 81 Control
In order to work with the LabView package, the library and the IX81 successfully, configure the SubVI _Olympus Command.vi_ to terminate with ```\n\r```. Append ASCII text termination Carriage Return and Line Feed to the communication string for successful connection. Further, change the __filter-change-command__ in the SubVI _Select_ _Filter_ _Wheel.vi_ from "FW" to "MU".
- Find the SubVIs in the Instrument Menu
- Only use the IX SubVIs (Text on symbol)

### Initialization

- Bright Field Lamp Configuration
  - SubVI: __Lamp_Conf__
    - Params: Double intensity (Voltage between 0 and 12V)
- Shutter
  - SubVI: __Status__
    - Params: Bool Shutter State (CAVE: Normally Closed)
- Objective Selection
  - SubVI: __Objective__
      - Params: Enum Objective
- Prism Configuration
  - Light path through both oculars or beam splitting for camera path
  - SubVI: __Prism__
    - Params: Enum Prism Position
- Filter Selection
  - SubVI: __Filter__ __IX__
    - Params: Enum Filter Wheel Position
- Focus / Autofocus (Objective z-Axis)
  - @@@ TODO
	
### Termination
- Reset Lamp to 0V or Disabled
- Logout every Login you performed (e.g. for each device number 1 and 2 a sequential logut is necessary)
- Close VISA connection


 
## TANGO Stage XY-Control

### Configuration:

Import _Tango.dll_ and header file via the __Import Shared Library__ function.

 
## SOLA Light Control

Acquired the LabView library form Lumencor support.

 

## ANDOR Camera

Imported the C/C++ functions via the __Import Shared Library__ function with the preprocessor definition sepecified in the _lib/ANDOR_ folder.´The original library ```atmcd32d.llb```has been downloaded from GitHub. 
### Usage
- quite good Documentation under _lib/ANDOR_
- Labview Error Handling has to be supplied via the function return values


## Custom Arduino-Valve-Controller

### LabView + Arduino Mega 2560 Setup
#### For older versions

- Install LINX preferably from the NI Package Manager or from this source.(Very few) Documentation can be found under: https://www.labviewmakerhub.com/doku.php?id=libraries:linx:start
- Follow the installation instructions and restart the PC
- Browse into the LINX folder of your installation (similar to C:\Program Files (x86)\National Instruments\LabVIEW 2013\vi.lib\LabVIEW Hacker\LINX\Firmware\Source\Arduino\LINX_Arduino_Base_Firmware)
- Open Linx Arduino Source File (LINX.cpp)
- Go to LINX_Config.h
- Uncomment the lines for the correct Chipset and disable all others
- Flash LINX software to arduino

#### For newer versions

- Install the Makerhub Toolbox and Diligent LINX (in this order) from the _JKI Package Manager_
- Select in LabView __Tools__ > __Makerhub__ > __LINX Firmware Wizard__
- Follow the instructions for an Arduino Mega2560 via USB/Serial connection
 
### LabView LINX Command (with LINX SubVIs) Workflow:
VISA Ressource Name: COM Port of USB-connection to Arduino (see Windows Device Manager if you are unsure)
``` c
[Initialized VISA Ressource, Error Out] = Initialize.vi (VISA Ressource Name, Error In]
[Initialized VISA Ressource, Error Out] = DigitalWriteNChans.vi(Initialized VISA Ressource, Bool Valve_State[n], Integer Pin_Numbers[n])
[Error Out] = Close.vi(Initialized VISA Ressource, Error In)
```
 

 

 

 

 

