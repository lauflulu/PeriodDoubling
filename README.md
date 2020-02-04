# LabviewIX81

Integration of an Olympus IX81 with various peripherals

## ToDos

DONE Thread für Live-Modus
DONE SHUTDOWN FOR CAMERA
DONE Fokus Case
DONE Change exposure time during live mode
DONE Stage Positionen anfahren
DONE Bild speichern
DONE Single Chip Pumpen testen
DONE Adapt and run Matlab script within labview to perform calibration
DONE Export Stage List
DONE Config .tif Stack as Output format (How to stack??)
DONE Adapt Matlab for tif stack (former .nd2 file --> not possible on Olympus HW)
DONE Only-Pos List instead of complete-Pos List
DONE Decimal Separator of Position List
DONE Fokus am Mikroskop (Test Jogsens, INITORIG und INITSTART)
DONE Writing to config file from UI
DONE Change Parser for optimized config file scheme
  + <Exposure>
  + <Pos> Focus,
  + general Microscope settings for every image
DONE Asynchrous Pumpcycles with feedback
DONE Exposure-Quelle-Filter kopppeln
DONE Andor Temp Color if stabilized
DONE Umstrukturierung mit Queued Message Handler (mehr Events und Sub-VIs)
DONE Histogram


### CRUCIAL

- Review Time Calculation procedure
  + Timing of physical change
  DONE Timing of pumps
   - SingleRing:
		- Feed: 6-7 ms per Valve Action Step
		- Pump: 
  DONE Duration for light source availability
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
