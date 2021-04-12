img=roiImages;
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
numReactors = size(img,3);
XCoordinates = cell(numReactors,2);
YCoordinates = cell(numReactors,2);


for r = 1:numReactors
    % button              
    confirmHandle = uicontrol('Style', 'ToggleButton', ...
                         'String', 'Confirm ROIs',...
                         'Position',[20,40,120,20]);
    
    % Select each image and proceed to select the desired range.
    % Selection is acheived by selecting the corner points of the region of
    % interest in a clockwise manner, starting at the top-left corner.
    %fig = figure;
    %ax = axes(fig);
    image = img(:,:,r);

    imshow(image,intensityRange(:,r));
    I=0;
    while ~confirmHandle.Value
        I=I+1;
        roi(I) = drawrectangle(gca,'Color', 'r','Label',sprintf('%i',I));
    end
    title('edit ROIs, then hit any key to continue with next ring')
    pause
    
    o=0;
    for i=1:I
        try
            mask = createMask(roi(i));
            o=o+1;
            % Obtain the coordinates of all points within the ROI
            [YCoordinates{r,o}, XCoordinates{r,o}] = find(mask);
        catch
            sprintf('ROI %d was deleted',i)
        end
    end
    close all
end

