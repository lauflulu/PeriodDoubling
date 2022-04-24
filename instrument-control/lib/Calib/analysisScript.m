%% The aim of this script is to analyse the experiment data provided by
% the LabVIEW software

% To succesfully run these scripts, install the bfopen toolbox:
% https://docs.openmicroscopy.org/bio-formats/5.7.1/users/matlab/index.html
%
clear all
%% Select the correct .Tiff file:
[pathNameCalib]  = uigetdir();
blankPath   = fullfile(pathNameCalib,'blank.tif');
fullIntPath = fullfile(pathNameCalib, 'full.tif');

[pathNameImages]  = uigetdir();
imagePath   = fullfile(pathNameImages,'SinglePosSingleChan');

%%
dlgtitle = 'How many different positions did you evaluate?';
prompt= {'Number of positions','Number of Channels'};
dims = [1 35];
definput = {'8','3'};
answer = inputdlg(prompt,dlgtitle,dims,definput);
numReactor = str2double(answer{1});
numChannels = str2double(answer{2});

lastImagePath = [imagePath,sprintf('\\Pos_%d_Chan_%d.tif',numReactor,numChannels)];

if ~exist(blankPath,'file') || ~exist(fullIntPath,'file') ||  ~exist(lastImagePath,'file')
    error("the folder and/or file structure is invalid.");
else
    blank = loadTiffFast(blankPath);
    fullInt =  loadTiffFast(fullIntPath);
    tmpImage = loadTiffFast(lastImagePath);
    
    [Y,X,T] = (size(tmpImage));
    clear tmpImage
    roiImages = zeros(Y,X, 2, numReactor);
    intensities = zeros(numReactor,numChannels-1,T+2);
    

    
    %% ROI selection for all chambers
    % load first images into 3d Matrix with positions and frames
    
    for r = 1:numReactor
        c=1;
        currImagePath= [imagePath,sprintf('\\Pos_%d_Chan_%d.tif',r,c)];
        roiImages(:,:,2,r) = imread(currImagePath,1);
    end
    
    % Set the intensity range with which to view all images during ROI selection
    intensityRange = zeros(2,numReactor);
    for r = 1:numReactor
        intensityRange(:,r) = [min(min(roiImages(:,:,2,r))), max(max(roiImages(:,:,2,r)))];
    end
    % A figure will be shown of the first image taken by the microscope at each
    % of the locations of interest within the microfluidic device. Using the
    % cursor, select an ROI (Region of Interest) where the fluorescence
    % intensity will be determined. This area should fall within the boundaries
    % of the microfluidic flow channel. Draw the area by selecting the corners
    % of a polygon (left mouse click) and accept the polygon by
    % double-clicking within the borders of the polygon.
    [xCoordinates, yCoordinates] = regionOfInterestDetermination(roiImages, intensityRange);

    clear roiImages
    
    xCoords=cell(numReactor,T+2);
    yCoords=cell(numReactor,T+2);
    for t=1:T+2
        for r=1:numReactor
            xCoords{r,t}=xCoordinates{r,2};
            yCoords{r,t}=yCoordinates{r,2};
        end
    end
    
    %% extract fluorescence data
    % load images into 3d Matrix with positions and frames
    for r = 1:numReactor
        for c=2:numChannels
            images = zeros(Y,X, (T+2),1);
            images(:,:,1,1) = fullInt(:,:,r);
            images(:,:,2,1) = blank(:,:,r);
            currImagePath= [imagePath,sprintf('\\Pos_%d_Chan_%d.tif',r,c)];
            images(:,:,3:end,1) = loadTiffFast(currImagePath);
        
            % Determine the intensities of the ROI within all frames
            intensities(r,c-1,:) = intensityDetermination(images, xCoords, yCoords);
        end
        r
    end 
    %% Plot the intensity curves and view the refresh ratio
    time=[0:T-1]*0.25; %in hours
    figure(1);
        for r = 1:numReactor
            subplot(4,4,r) 
            hold all
            for c=2:numChannels
                title(sprintf('Reactor %d',r))
                plot(time,squeeze(intensities(r,c-1,3:end)))
            end
        end
        box('on')
        for c=2:numChannels
            subplot(2,2,c+1)
            hold all
            for r = 1:numReactor
                title(sprintf('Channel %d',c))
                plot(time,squeeze(intensities(r,c-1,3:end)))
            end
            box('on'); legend();
        end
        
     save(fullfile(pathNameImages,...
         [datestr(now,'yymmdd'),'_intensities.mat']),...
         'intensities','time');
end
%% This is the end of the script.