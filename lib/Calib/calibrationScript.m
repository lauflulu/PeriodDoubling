%% The aim of this script is to analyse the calibration data provided by
% the LabVIEW software, providing the user and the LabVIEW software with
% the individual refresh ratios of each of the individual reacotrs.

% currently on one reactor calibration at a time is possible

% To succesfully run these scripts, install the bfopen toolbox:
% https://docs.openmicroscopy.org/bio-formats/5.7.1/users/matlab/index.html
%
clear all
close all
%% Select the correct .Tiff file:
[pathName]  = uigetdir();%\\nas.ads.mwn.de\tuph\e14\users\laufinger\Videos\04-8ring\200923_ElliBistable3\200923_calibration
blankPath   = fullfile(pathName,'blank.tif');
dilPath     = fullfile(pathName, 'dilutions.tif');
fulIPath = fullfile(pathName, 'full.tif');

if ~exist(blankPath,'file') || ~exist(dilPath,'file') || ~exist(fulIPath,'file')
    error("the folder and/or file structure is invalid.");
else
    dil = loadTiffFast(dilPath);
    blank = loadTiffFast(blankPath);
    full = loadTiffFast(fulIPath);
    
    %%
    if ndims(dil) < 3
        error('Image Stack required');
    end
    
    dlgtitle = 'How many different positions did you evaluate?';
    prompt= {'Number of positions','Number of Feed Steps'};
    dims = [1 35];
    definput = {'8','45'};
    answer = inputdlg(prompt,dlgtitle,dims,definput)
    numReactor = str2double(answer{1});
    feedSteps = str2double(answer{2});
    
    %% Reorder images to 4d Matrix with positions and frames
    rep = (size(dil,3)/numReactor);
    dilSorted = zeros(size(dil,1),size(dil,2), rep+2, numReactor);
    dilSorted(:,:,1,:) = blank;
    dilSorted(:,:,2,:) = full;
    for i = 1:numReactor
        for j = 1:rep
            dilSorted(:,:,j+2,i) = dil(:,:, i + (j-1)*numReactor);
        end
    end
    clear dil
    clear full
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
    if isempty(blank)
        ENABLE_BLANK_SUBTRACTION = false;
    else
        ENABLE_BLANK_SUBTRACTION = true;
    end
    [finalRefreshRatio, refreshPerReactor] = plotIntensityCurves(intensities,pathName, ENABLE_BLANK_SUBTRACTION);
    
    refreshPerReactorPerFeed = refreshPerReactor ./ feedSteps
%     RR1 = refreshPerReactorPerFeed(1,1)
%     RR2 = refreshPerReactorPerFeed(2,1)
%     RR3 = refreshPerReactorPerFeed(3,1)
%     RR4 = refreshPerReactorPerFeed(4,1)
%     RR5 = refreshPerReactorPerFeed(5,1)
%     RR6 = refreshPerReactorPerFeed(6,1)
%     RR7 = refreshPerReactorPerFeed(7,1)
%     RR8 = refreshPerReactorPerFeed(8,1)
    finalRefreshRatio
    finalRefreshRatioPerFeed = finalRefreshRatio / feedSteps
    save(fullfile(pathName, 'RefreshRatios.mat'),'refreshPerReactor',...
        'refreshPerReactorPerFeed', 'finalRefreshRatio',...
        'finalRefreshRatioPerFeed');
end
%% This is the end of the script.