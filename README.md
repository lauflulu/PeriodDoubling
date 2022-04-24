# PeriodDoubling
Contains raw data, analysis scripts, and simulation scripts for the publication: "Complex Dynamics in a Synchronized Cell-Free Genetic Clock".

## System requirements
The scripts were tested in Matlab version 2019b.

## Installation guide
No installation required

## Demo
- analysis
Extracts fluorescence intensity data from time-lapse images.
Should be completed within 10 min.

- data and simulation
The scripts named 'figure x' reproduce the plots shown in that figure.
Most scripts should complete within a few seconds.
The simulation times for the plots in figure 2,6,7, and S4 depend on the number of simulated samples.
For coarse sampling (default), the scripts should complete witin approximately 10 min.
Finer sampling, e.g. as shown in figure 7 and S4, may require 1-2 days of computation time, plus approximately 4 GB of free RAM.

## Instructions for use
- analysis
Time-lapse image data needs to be available as single channel Tiff-stacks. 
If images are instead stored as multichannel, single time point, run TiffConcatenator and follow instructions.
Run 'analysisScript' and follow instructions. 
First enter number of rings and number of image channels.
When asked, select sample ROI and background ROI for each ring.
Next, you will be asked to register the data image to a calibration image that is acquired when setting up the experiment. 
In both images mark at least one spot that appears in both of them. Rough alignment is sufficient, automatic registration will improve accuracy.
This step allows to calibrate the measured fluorescence intensity to the reference measurement obtained with purified fluorescent proteins and can be skipped if not required.

- data and simulation
Run the scripts in Matlab.
