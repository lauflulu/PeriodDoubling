%% Tiff-Concatenator

%% Select the correct .Tiff file:
[pathName]  = uigetdir();

if ~exist(blankPath,'file') || ~exist(dilPath,'file') || ~exist(fulIIntPath,'file')
    error("the folder and/or file structure is invalid.");
end
    
    files = dir(fullfile(pathName, '*tif'));    
   
    dlgtitle = 'How many different positions did you evaluate?';
    prompt= {'Number of positions','Channels'};
    dims = [1 35];
    definput = {'9','2'};
    answer = inputdlg(prompt,dlgtitle,dims,definput)
    numReactor = str2double(answer{1});
    numChan = str2double(answer{2});
    
    for j = 1:numReactor
        for k = 1:Chan
            for i = 1:length(files) 
                    stack = loadTiffFast(files(i).name);
                    newChamber = 
            end
        end        
    end
end