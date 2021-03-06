function [XCoordinates, YCoordinates] = regionOfInterestDetermination(img, intensityRange)
%% This function is used to determine the regions of interest for each of
%  channels of the microfluidic device. The images are loaded and the user
%  is required to select the region of interest from which the intensity
%  will be determined.
%
% The function output is a matrix containing the regions of interest for
% each of the images in a single data set.
%
% The inputs of the function are the images themselves as well as the
% intensity range used to make the images visable.

%% Show each of the images and determine the region of interest.
numReactors = size(img,4);
timePoints = size(img,3);
XCoordinates = cell([numReactors, timePoints]);
YCoordinates = cell([numReactors, timePoints]);

for i = 1:numReactors
    % Select each image and proceed to select the desired range.
    % Selection is acheived by selecting the corner points of the region of
    % interest in a clockwise manner, starting at the top-left corner.
    %fig = figure;
    %ax = axes(fig);
    imageFull = img(:,:,2,i);
    imshow(imageFull,intensityRange(:,i));
    
    roi = drawpolygon(gca,'Color', 'r');
    mask = createMask(roi);
    
    for j = 1:timePoints
        % Obtain the coordinates of all points within the ROI
        [YCoordinates{i,j}, XCoordinates{i,j}] = find(mask);
    end
end

close all

end


