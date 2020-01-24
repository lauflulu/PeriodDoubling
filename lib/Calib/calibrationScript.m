%% The aim of this script is to analyse the calibration data provided by
% the LabVIEW software, providing the user and the LabVIEW software with
% the individual refresh ratios of each of the individual reacotrs.

% currently on one reactor calibration at a time is possible

% To succesfully run these scripts, install the bfopen toolbox:
% https://docs.openmicroscopy.org/bio-formats/5.7.1/users/matlab/index.html
%

%% Select the correct .Tiff file:
[pathName]  = uigetdir();
blankPath   = fullfile(pathName,'blank.tif');
dilPath     = fullfile(pathName, 'dilutions4.tif');
fulIIntPath = fullfile(pathName, 'full.tif');

if ~exist(blankPath,'file') || ~exist(dilPath,'file') || ~exist(fulIIntPath,'file')
    error("the folder and/or file structure is invalid.");
else
    dil = loadTiffFast(dilPath);
    
    %%
    if ndims(dil) < 3
        error('Image Stack required');
    end
    
    %% Set the intensity range with which to view all images during ROI selection
    desiredIntensity = selectIntensity(dil(:, :,1));
    intensityRange = [0, desiredIntensity];
    
    %% ROI selection for all chambers
    % A figure will be shown of the first image taken by the microscope at each
    % of the locations of interest within the microfluidic device. Using the
    % cursor, select an ROI (Region of Interest) where the fluorescence
    % intensity will be determined. This area should fall within the boundaries
    % of the microfluidic flow channel. Draw the area by selecting the corners
    % of a polygon (left mouse click) and accept the polygon by
    % double-clicking within the borders of the polygon.
    [xCoordinates, yCoordinates] = regionOfInterestDetermination(dil, intensityRange);
    
    %% Determine the intensities of the ROI within all images
    intensities = intensityDetermination(dil, xCoordinates, yCoordinates);
    
    %% Plot the intensity curves and view the refresh ratio
    [singlePumpCycleRefreshRatio, final_Refresh_Ratio, refreshPerReactor] = plotIntensityCurves(intensities);
    RR1 = singlePumpCycleRefreshRatio
    % RR1 = refreshPerReactor(1,1)
    % RR2 = refreshPerReactor(2,1)
    % RR3 = refreshPerReactor(3,1)
    % RR4 = refreshPerReactor(4,1)
    % RR5 = refreshPerReactor(5,1)
    % RR6 = refreshPerReactor(6,1)
    % RR7 = refreshPerReactor(7,1)
    % RR8 = refreshPerReactor(8,1)
end
%% This is the end of the script.