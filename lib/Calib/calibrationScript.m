%% The aim of this script is to analyse the calibration data provided by
% the LabVIEW software, providing the user and the LabVIEW software with
% the individual refresh ratios of each of the individual reacotrs.

% currently on one reactor calibration at a time is possible

% To succesfully run these scripts, install the bfopen toolbox:
% https://docs.openmicroscopy.org/bio-formats/5.7.1/users/matlab/index.html
%
clear all
ENABLE_BLANK_SUBTRACTION = false;
%% Select the correct .Tiff file:
[pathName]  = uigetdir();
blankPath   = fullfile(pathName,'blank.tif');
dilPath     = fullfile(pathName, 'dilutions.tif');
fulIIntPath = fullfile(pathName, 'full.tif');

if ~exist(blankPath,'file') || ~exist(dilPath,'file') || ~exist(fulIIntPath,'file')
    error("the folder and/or file structure is invalid.");
else
    dil = loadTiffFast(dilPath);
    blank = loadTiffFast(blankPath);
    
    %%
    if ndims(dil) < 3
        error('Image Stack required');
    end
    
    prompt= 'How many different positions did you evaluate?';
    dlgtitle = 'Number of positions';
    dims = [1 35];
    definput = {'8','50'};
    answer = inputdlg(prompt,dlgtitle,dims,definput)
    numReactor = str2double(answer{1});
    %feedSteps = str2double(answer{2});
    feedSteps = 50;
    
    %% Reorder images to 4d Matrix with positions and frames
    rep = (size(dil,3)/numReactor);
    dilSorted = zeros(size(dil,1),size(dil,2), rep, numReactor);
    dilSorted(:,:,1,:) = blank;
    for i = 1:numReactor
        for j = 1:rep
            dilSorted(:,:,j+1,i) = dil(:,:, i + (j-1)*numReactor);
        end
    end
    clear dil
    %% Set the intensity range with which to view all images during ROI selection
    intensityRange = zeros(2,numReactor);
    for i = 1:numReactor
        intensityRange(:,i) = [min(min(dilSorted(:,:,2,i))), max(max(dilSorted(:,:,2,i)))];
    end
    
    %% ROI selection for all chambers
    % A figure will be shown of the first image taken by the microscope at each
    % of the locations of interest within the microfluidic device. Using the
    % cursor, select an ROI (Region of Interest) where the fluorescence
    % intensity will be determined. This area should fall within the boundaries
    % of the microfluidic flow channel. Draw the area by selecting the corners
    % of a polygon (left mouse click) and accept the polygon by
    % double-clicking within the borders of the polygon.
    [xCoordinates, yCoordinates] = regionOfInterestDetermination(dilSorted, intensityRange);
    
    %% Determine the intensities of the ROI within all images
    intensities = intensityDetermination(dilSorted, xCoordinates, yCoordinates);
    %% Plot the intensity curves and view the refresh ratio
    [final_Refresh_Ratio, refreshPerReactor] = plotIntensityCurves(intensities,ENABLE_BLANK_SUBTRACTION);
    
    RR1 = refreshPerReactor(1,1)
    RR2 = refreshPerReactor(2,1)
    RR3 = refreshPerReactor(3,1)
    RR4 = refreshPerReactor(4,1)
    RR5 = refreshPerReactor(5,1)
    RR6 = refreshPerReactor(6,1)
    RR7 = refreshPerReactor(7,1)
    RR8 = refreshPerReactor(8,1)
    final_Refresh_Ratio
    final_Refresh_RatioPerFeed / feedSteps
    refreshPerReactorPerFeed = refreshPerReactor./feedSteps
end
%% This is the end of the script.