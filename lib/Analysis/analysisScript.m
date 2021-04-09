%% The aim of this script is to analyse the experiment data provided by
% the LabVIEW software

% To succesfully run these scripts, install the bfopen toolbox:
% https://docs.openmicroscopy.org/bio-formats/5.7.1/users/matlab/index.html
%
clear all
close all
%% Select the correct .Tiff file:
[pathNameImages]  = uigetdir();
imagePath   = fullfile(pathNameImages,'SinglePosSingleChan');

warning('off','imageio:tiffmexutils:libtiffWarning')

%%
dlgtitle = 'How many different positions did you evaluate?';
prompt= {'Number of rings','Number of channels'};
dims = [1 35];
definput = {'8','2'};
answer = inputdlg(prompt,dlgtitle,dims,definput);
numReactor = str2double(answer{1});
numChannels = str2double(answer{2});


lastImagePath = [imagePath,sprintf('\\Pos_%d_Chan_%d.tif',numReactor,numChannels)];

if ~exist(lastImagePath,'file')
    error("the folder and/or file structure is invalid.");
else

    tmpImage = loadTiffFast(lastImagePath);

    [Y,X,T] = (size(tmpImage));
    clear tmpImage
    roiImages = zeros(Y,X, numReactor);

    %% ROI selection for all chambers
    % load first images into 3d Matrix with positions and frames

    for r = 1:numReactor
        c=2; %channel for ROI drawing
        currImagePath= [imagePath,sprintf('\\Pos_%d_Chan_%d.tif',r,c)];
        roiImages(:,:,r) = imread(currImagePath,1);
    end

    % Set the intensity range with which to view all images during ROI selection
    intensityRange = zeros(2,numReactor);
    for r = 1:numReactor
        intensityRange(:,r) = [min(min(roiImages(:,:,r))), max(max(roiImages(:,:,r)))];
    end
    % A figure will be shown of the first image taken by the microscope at each
    % of the locations of interest within the microfluidic device. Using the
    % cursor, select an ROI (Region of Interest) where the fluorescence
    % intensity will be determined. This area should fall within the boundaries
    % of the microfluidic flow channel. Draw the area by selecting the corners
    % of a polygon (left mouse click) and accept the polygon by
    % double-clicking within the borders of the polygon.

    [xCoordinates, yCoordinates] = regionOfInterestDetermination(roiImages, intensityRange);
    %%
    numROIs=size(xCoordinates,2);

    xCoords=cell(numReactor,T,numROIs);
    yCoords=cell(numReactor,T,numROIs);
    for t=1:T
        for r=1:numReactor
            for o=1:numROIs
                xCoords{r,t,o}=xCoordinates{r,o};
                yCoords{r,t,o}=yCoordinates{r,o};
            end
        end
    end

%% extract fluorescence data
% load images into 3d Matrix with positions and frames
    intensities = zeros(numReactor,numChannels-1,numROIs,T);

    for r = 1:numReactor
        for c=2:numChannels
            images = zeros(Y,X,T,1);

            currImagePath= [imagePath,sprintf('\\Pos_%d_Chan_%d.tif',r,c)];
            images(:,:,:,1) = loadTiffFast(currImagePath);

            % Determine the intensities of the ROI within all frames
            for o=1:numROIs
                intensities(r,c-1,o,:) = intensityDetermination(images, xCoords, yCoords);
            end
        end
        r
    end 

    clear roiImages
    %% Plot the intensity curves and view the refresh ratio
    time=[0:T-1]*0.25; %in hours
    figure(1);
        for r = 1:numReactor
            subplot(4,4,r) 
                hold all
                for c=2:numChannels
                    title(sprintf('Reactor %d',r))
                    plot(time,squeeze(intensities(r,c-1,:,:)))
                end
                box('on')
        end
        
        for c=2:numChannels
            subplot(2,2,c+1)
            hold all
            for r = 1:numReactor
                title(sprintf('Channel %d',c))
                plot(time,squeeze(intensities(r,c-1,:,:)))
            end
            box('on'); legend();
        end
        
%      save(fullfile(pathNameImages,...
%          [datestr(now,'yymmdd'),'_intensities.mat']),...
%          'intensities','time');
end
%% This is the end of the script.