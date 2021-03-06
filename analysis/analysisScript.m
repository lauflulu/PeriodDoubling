%% The aim of this script is to analyse the experiment data provided by
% the LabVIEW software

% To succesfully run these scripts, install the bfopen toolbox:
% https://docs.openmicroscopy.org/bio-formats/5.7.1/users/matlab/index.html

clear all
close all

%% Select the correct .Tiff file:
scriptDir=cd;
[pathNameImages]  = uigetdir();
imagePath   = fullfile(pathNameImages,'SinglePosSingleChan');

% calibration path for normalization
cd(imagePath); cd('..\'); cd('..\'); mainDir=dir; mainCD=cd;
for d=1:length(mainDir)
    if strfind(mainDir(d).name,'calib')
        calibrationPath = [mainCD,'\',mainDir(d).name,'\full.tif'];
    end
end

cd(scriptDir);

warning('off','imageio:tiffmexutils:libtiffWarning')
warning('off', 'MATLAB:imagesci:tiffmexutils:libtiffWarning')

%%
files = dir(fullfile(imagePath, '*tif'));    
numChannels=numel(files)/8;


dlgtitle = 'How many different positions did you evaluate?';
prompt= {'Number of rings','Number of channels','ROI channel'};
dims = [1 35];
definput = {'8',sprintf('%d',numChannels),'1'};
answer = inputdlg(prompt,dlgtitle,dims,definput);
numReactor = str2double(answer{1});
numChannels = str2double(answer{2});
roiChannel = str2double(answer{3});

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
        currImagePath= [imagePath,sprintf('\\Pos_%d_Chan_%d.tif',r,roiChannel)];
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
                intensities(r,c-1,o,:) = intensityDetermination(images, xCoords(r,:,o), yCoords(r,:,o));
            end
        end
        r
    end 


    clear roiImages
    
    % normalization, last ROI is background
    normIntensities =zeros(numReactor,1,numROIs,1);
    normImages=loadTiffFast(calibrationPath);
    
    % register normImages
    for r = 1:numReactor
        I_cal=normImages(:,:,r);
        I_exp=imread([imagePath,sprintf('\\Pos_%d_Chan_1.tif',r)],1);
        
        normImage(:,:,1,1) = registerCalibration(I_cal,I_exp);
  
        for o=1:numROIs
            normIntensities(r,1,o,1) = intensityDetermination(normImage, xCoords(r,:,o), yCoords(r,:,o));
        end
        r
    end
    
    intensities=(intensities-intensities(:,:,end,:))./(normIntensities-normIntensities(:,:,end,:));
    %% Plot the intensity curves and view the refresh ratio
    time=[0:T-1]*0.25; %in hours
    figure(numReactor+1);
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
            subplot(2,numChannels-1,c+numChannels-2)
                hold all
                for r = 1:numReactor
                    title(sprintf('Channel %d',c))
                    plot(time,squeeze(intensities(r,c-1,1,:)))
                end
                box('on'); legend();
        end
        
     save(fullfile(pathNameImages,...
         [datestr(now,'yymmdd'),'_intensities.mat']),...
         'intensities');
end
%% This is the end of the script.