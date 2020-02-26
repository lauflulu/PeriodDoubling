%% The aim of this script is to analyse the calibration data provided by
% the LabVIEW software, providing the user and the LabVIEW software with
% the individual refresh ratios of each of the individual reacotrs.

% currently on one reactor calibration at a time is possible

% To succesfully run these scripts, install the bfopen toolbox:
% https://docs.openmicroscopy.org/bio-formats/5.7.1/users/matlab/index.html
%
clear all

%% Select the correct .Tiff file:
[pathName]  = uigetdir();
blankPath   = fullfile(pathName,'blank.tif');
dilPath     = fullfile(pathName, 'dilutions.tif');
fulIIntPath = fullfile(pathName, 'full.tif');

if ~exist(blankPath,'file') || ~exist(dilPath,'file') || ~exist(fulIIntPath,'file')
    error("the folder and/or file structure is invalid.");
else
    dil = loadTiffFast(dilPath);
    
    %%
    if ndims(dil) < 3
        error('Image Stack required');
    end
    
    prompt= 'How many different positions did you evaluate?';
    dlgtitle = 'Number of positions';
    numReactor = inputdlg(prompt,dlgtitle);
    numReactor = str2double(numReactor{1});
    
    %% Reorder images to 4d Matrix with positions and frames
    rep = (size(dil,3)/numReactor);
    dilSorted = zeros(size(dil,1),size(dil,2), rep, numReactor);
    
    for i = 1:numReactor
        for j = 1:rep
            dilSorted(:,:,j,i) = dil(:,:,i+i*(j-1));
        end
    end
    clear dil
    %% Set the intensity range with which to view all images during ROI selection
    for i = 1:numReactor
        desiredIntensity = selectIntensity(dilSorted(:,:,1,i));
        intensityRange(:,i) = [0, desiredIntensity];
    end
    
    %% ROI selection for all chambers
    % A figure will be shown of the first image taken by the microscope at each
    % of the locations of interest within the microfluidic device. Using the
    % cursor, select an ROI (Region of Interest) where the fluorescence
    % intensity will be determined. This area should fall within the boundaries
    % of the microfluidic flow channel. Draw the area by selecting the corners
    % of a polygon (left mouse click) and accept the polygon by
    % double-clicking within the borders of the polygon.
    for i = 1:numReactor
        [xCoordinates(:,i), yCoordinates(:,i)] = regionOfInterestDetermination(dilSorted(:,:,:,i), intensityRange(:,i));
    end
    
    %% Determine the intensities of the ROI within all images
    for i = 1:numReactor
        intensities(:,i) = intensityDetermination(dilSorted(:,:,:,i), xCoordinates(:,i), yCoordinates(:,i));
    end
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